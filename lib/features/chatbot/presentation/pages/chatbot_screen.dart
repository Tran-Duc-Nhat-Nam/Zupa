import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:zupa/core/bloc/ui/ui_cubit.dart';
import 'package:zupa/core/di/injection.dart';
import 'package:zupa/core/i18n/gen/strings.g.dart';
import 'package:zupa/core/styles/colors.dart';
import 'package:zupa/core/styles/text_styles.dart';
import 'package:zupa/core/widgets/app_list_tile.dart';
import 'package:zupa/core/widgets/app_loading_widget.dart';
import 'package:zupa/core/widgets/app_screen.dart';
import 'package:zupa/core/widgets/popup/app_dialog.dart';
import 'package:zupa/core/widgets/popup/app_message.dart';
import 'package:zupa/core/widgets/state/app_state.dart';
import 'package:zupa/features/chatbot/domain/entity/chat_session.dart';
import 'package:zupa/features/chatbot/presentation/bloc/chatbot_cubit.dart';
import 'package:zupa/features/chatbot/domain/entity/chat_message.dart';
import 'package:zupa/features/chatbot/presentation/widgets/chat_message_widget.dart';

@RoutePage()
class ChatbotScreen extends StatefulWidget {
  const ChatbotScreen({super.key});

  @override
  AppState<ChatbotScreen> createState() => _ChatbotScreenState();
}

class _ChatbotScreenState extends AppState<ChatbotScreen> {
  final _controller = TextEditingController();
  final _scrollController = ScrollController();

  void _scrollToBottom() => WidgetsBinding.instance.addPostFrameCallback((_) {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const .new(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ChatbotCubit>()..loadModel(),
      child: BlocConsumer<ChatbotCubit, ChatbotState>(
        listener: (context, state) {
          state.whenOrNull(
            ready: (_, _, _, _, _) {
              _scrollToBottom();
            },
            error: (message) {
              MessageHelper.showError(context, message: message);
            },
          );
        },
        builder: (context, state) {
          final colors = context.colorScheme;

          return AppScreen(
            title: t.chatbot.title,
            appBarTrailing: [
              IconButton(
                icon: const Icon(Symbols.add_rounded),
                onPressed: () {
                  context.read<ChatbotCubit>().createNewSession();
                },
              ),
              IconButton(
                icon: const Icon(Symbols.chat_rounded),
                onPressed: () {
                  final state = context.read<ChatbotCubit>().state;
                  if (state is Ready) {
                    _showHistorySheet(
                      context,
                      state.sessions,
                      context.read<ChatbotCubit>(),
                    );
                  }
                },
              ),
            ],
            isChildScrollable: true,
            hasSafeBottomArea: true,
            resizeToAvoidBottomInset: true,
            child: state.maybeWhen(
              initial: () => const SizedBox.shrink(),
              loadingModel: () => Center(
                child: Column(
                  mainAxisAlignment: .center,
                  children: [
                    AppLoadingWidget(color: colors.primary),
                    const SizedBox(height: 16),
                    Text(
                      t.chatbot.loadingModel,
                      style: AppTextStyles.bodyLargeMedium,
                    ),
                    Text(
                      t.chatbot.loadingWarning,
                      style: AppTextStyles.bodySmall.copyWith(
                        color: colors.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
              downloading: (progress) => Center(
                child: DownloadProgressDialog(
                  progressStream: context
                      .read<ChatbotCubit>()
                      .stream
                      .map(
                        (s) => s.maybeWhen(
                          downloading: (p) => p,
                          orElse: () => null,
                        ),
                      )
                      .where((p) => p != null)
                      .cast<double>(),
                  title: t.chatbot.downloading,
                  subtitle: t.chatbot.downloadingSubtitle,
                ),
              ),
              ready:
                  (
                    messages,
                    sessions,
                    currentSessionId,
                    isProcessing,
                    currentStreamingResponse,
                  ) {
                    final uiSettings = context
                        .read<UICubit>()
                        .state
                        .currentSettings;
                    return !uiSettings.isFloatingNavbar
                        ? Column(
                            children: [
                              Expanded(
                                child: RepaintBoundary(
                                  child: ListView.builder(
                                    controller: _scrollController,
                                    padding: const .symmetric(vertical: 12),
                                    itemCount:
                                        messages.length +
                                        (currentStreamingResponse != null
                                            ? 1
                                            : 0),
                                    itemBuilder: (context, index) =>
                                        index < messages.length
                                        ? ChatMessageWidget(
                                            message: messages[index],
                                          )
                                        : ChatMessageWidget(
                                            message: ChatMessage(
                                              text: currentStreamingResponse!,
                                              isUser: false,
                                              isStreaming: true,
                                            ),
                                          ),
                                  ),
                                ),
                              ),
                              _buildInputArea(
                                context: context,
                                isProcessing: isProcessing,
                                isGlassmorphism: uiSettings.isGlassmorphism,
                                isFloating: uiSettings.isFloatingNavbar,
                              ),
                            ],
                          )
                        : Stack(
                            children: [
                              ListView.builder(
                                controller: _scrollController,
                                padding: const .symmetric(vertical: 12),
                                itemCount:
                                    messages.length +
                                    (currentStreamingResponse != null ? 1 : 0),
                                itemBuilder: (context, index) =>
                                    index < messages.length
                                    ? ChatMessageWidget(
                                        message: messages[index],
                                      )
                                    : ChatMessageWidget(
                                        message: ChatMessage(
                                          text: currentStreamingResponse!,
                                          isUser: false,
                                          isStreaming: true,
                                        ),
                                      ),
                              ),
                              AnimatedPositioned(
                                duration: const .new(milliseconds: 500),
                                curve: Curves.easeInOutQuart,
                                left: 24,
                                right: 24,
                                bottom: 36,
                                child: _buildInputArea(
                                  context: context,
                                  isProcessing: isProcessing,
                                  isGlassmorphism: uiSettings.isGlassmorphism,
                                  isFloating: uiSettings.isFloatingNavbar,
                                ),
                              ),
                            ],
                          );
                  },
              error: (message) => Center(
                child: Column(
                  mainAxisAlignment: .center,
                  children: [
                    Icon(
                      Icons.error_outline_rounded,
                      color: colors.error,
                      size: 60,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      message,
                      textAlign: .center,
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: colors.onSurface,
                      ),
                    ),
                    const SizedBox(height: 24),
                    FilledButton.icon(
                      onPressed: () => context.read<ChatbotCubit>().loadModel(),
                      icon: const Icon(Icons.refresh_rounded),
                      label: Text(t.common.actions.retry),
                    ),
                  ],
                ),
              ),
              orElse: () => const SizedBox.shrink(),
            ),
          );
        },
      ),
    );
  }

  void _showHistorySheet(
    BuildContext context,
    List<ChatSession> sessions,
    ChatbotCubit cubit,
  ) => showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (bottomSheetContext) => DraggableScrollableSheet(
      builder: (context, scrollController) {
        final colors = context.colorScheme;
        return DecoratedBox(
          decoration: BoxDecoration(
            color: colors.surfaceContainer,
            borderRadius: const .vertical(top: .circular(24)),
          ),
          child: Column(
            children: [
              const SizedBox(height: 16),
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: colors.outlineVariant,
                  borderRadius: .circular(2),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                t.chatbot.pastChat,
                style: AppTextStyles.titleMedium.copyWith(
                  color: colors.onSurface,
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: sessions.isEmpty
                    ? Center(
                        child: Text(
                          t.chatbot.noPastChat,
                          style: AppTextStyles.bodyMedium.copyWith(
                            color: colors.onSurfaceVariant,
                          ),
                        ),
                      )
                    : Padding(
                        padding: const .symmetric(horizontal: 8),
                        child: AppList(
                          padding: const .symmetric(
                            vertical: 4,
                            horizontal: 16,
                          ),
                          items: sessions
                              .map(
                                (session) => AppListItem(
                                  content: Column(
                                    crossAxisAlignment: .start,
                                    children: [
                                      Text(
                                        session.title,
                                        maxLines: 1,
                                        overflow: .ellipsis,
                                        style: AppTextStyles.bodyLargeSemibold
                                            .copyWith(color: colors.onSurface),
                                      ),
                                      Text(
                                        '${session.createdAt.day}/${session.createdAt.month}/${session.createdAt.year}',
                                        style: AppTextStyles.bodyMedium
                                            .copyWith(
                                              color: colors.onSurfaceVariant,
                                            ),
                                      ),
                                    ],
                                  ),
                                  onTap: () {
                                    cubit.loadSession(session.id);
                                    Navigator.pop(bottomSheetContext);
                                  },
                                ),
                              )
                              .toList(),
                        ),
                      ),
              ),
            ],
          ),
        );
      },
    ),
  );

  Widget _buildInputArea({
    required BuildContext context,
    bool isProcessing = false,
    bool isGlassmorphism = false,
    bool isFloating = false,
  }) {
    final colors = context.colorScheme;
    return ClipRRect(
      borderRadius: isFloating ? .circular(32) : .circular(0),
      child: BackdropFilter(
        filter: isGlassmorphism
            ? .blur(sigmaX: 12, sigmaY: 12)
            : .blur(sigmaX: 0, sigmaY: 0),
        child: Container(
          padding: const .symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: colors.surfaceContainer.withAlpha(
              isGlassmorphism ? 155 : 255,
            ),
            borderRadius: isFloating ? .circular(32) : .circular(0),
            border: isGlassmorphism
                ? .all(color: colors.outlineVariant.withAlpha(155), width: 2)
                : null,
          ),
          clipBehavior: .antiAlias,
          child: Row(
            spacing: 8,
            children: [
              Expanded(
                child: TextField(
                  controller: _controller,
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: colors.onSurface,
                  ),
                  decoration: .new(
                    hintText: t.chatbot.hint,
                    hintStyle: AppTextStyles.bodyMedium.copyWith(
                      color: colors.onSurfaceVariant,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: .circular(28),
                      borderSide: .none,
                    ),
                    filled: true,
                    fillColor: colors.surfaceContainerHigh.withAlpha(
                      isGlassmorphism ? 155 : 255,
                    ),
                    contentPadding: const .symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                  ),
                  maxLines: null,
                  enabled: !isProcessing,
                  onSubmitted: (val) {
                    if (val.trim().isNotEmpty) {
                      context.read<ChatbotCubit>().sendMessage(val.trim());
                      _controller.clear();
                    }
                  },
                ),
              ),
              IconButton.filled(
                onPressed: isProcessing
                    ? null
                    : () {
                        if (_controller.text.trim().isNotEmpty) {
                          context.read<ChatbotCubit>().sendMessage(
                            _controller.text.trim(),
                          );
                          _controller.clear();
                        }
                      },
                icon: isProcessing
                    ? AppLoadingWidget(color: colors.onPrimary, size: .small)
                    : const Icon(Symbols.send_rounded, size: 24),
                style: IconButton.styleFrom(
                  backgroundColor: colors.primary,
                  foregroundColor: colors.onPrimary,
                  disabledBackgroundColor: colors.outlineVariant,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }
}
