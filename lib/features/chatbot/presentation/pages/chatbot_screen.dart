import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:zupa/core/di/injection.dart';
import 'package:zupa/core/i18n/gen/strings.g.dart';
import 'package:zupa/core/styles/colors.dart';
import 'package:zupa/core/styles/text_styles.dart';
import 'package:zupa/core/widgets/app_screen.dart';
import 'package:zupa/core/widgets/popup/app_dialog.dart';
import 'package:zupa/core/widgets/popup/app_message.dart';
import 'package:zupa/features/chatbot/presentation/bloc/chatbot_cubit.dart';
import 'package:zupa/features/chatbot/presentation/bloc/chatbot_state.dart';
import 'package:zupa/features/chatbot/presentation/widgets/chat_message_widget.dart';

@RoutePage()
class ChatbotScreen extends StatefulWidget {
  const ChatbotScreen({super.key});

  @override
  State<ChatbotScreen> createState() => _ChatbotScreenState();
}

class _ChatbotScreenState extends State<ChatbotScreen> {
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  bool _isDialogShowing = false;

  @override
  void initState() {
    super.initState();
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ChatbotCubit>()..loadModel(),
      child: BlocConsumer<ChatbotCubit, ChatbotState>(
        listener: (context, state) {
          state.whenOrNull(
            downloading: (progress) {
              if (!_isDialogShowing) {
                _isDialogShowing = true;
                DialogHelper.showDownloadProgress(
                  context,
                  tag: 'chatbot_download',
                  title: t.chatbot.downloading,
                  subtitle: t.chatbot.downloadingSubtitle,
                  onDismiss: () => _isDialogShowing = false,
                  progressStream: context.read<ChatbotCubit>().stream.map(
                    (s) =>
                        s.maybeWhen(downloading: (p) => p, orElse: () => 0.0),
                  ),
                );
              }
            },
            ready: (_, _, _) {
              if (_isDialogShowing) {
                SmartDialog.dismiss(tag: 'chatbot_download');
                _isDialogShowing = false;
              }
              _scrollToBottom();
            },
            error: (message) {
              if (_isDialogShowing) {
                SmartDialog.dismiss(tag: 'chatbot_download');
                _isDialogShowing = false;
              }
              MessageHelper.showError(context, message: message);
            },
          );
        },
        builder: (context, state) {
          final colors = AppColors.of(context);

          return AppScreen(
            title: t.chatbot.title,
            isChildScrollable: true,
            hasSafeBottomArea: true,
            resizeToAvoidBottomInset: true,
            child: state.maybeWhen(
              initial: () => const SizedBox(),
              loadingModel: () => Center(
                child: Column(
                  mainAxisAlignment: .center,
                  children: [
                    LoadingAnimationWidget.staggeredDotsWave(
                      color: colors.primary,
                      size: 50,
                    ),
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
              downloading: (progress) => const Center(
                child: SizedBox(), // Handled by dialog
              ),
              ready: (messages, isProcessing, currentStreamingResponse) =>
                  Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          controller: _scrollController,
                          padding: const .symmetric(vertical: 12),
                          itemCount:
                              messages.length +
                              (currentStreamingResponse != null ? 1 : 0),
                          itemBuilder: (context, index) {
                            if (index < messages.length) {
                              return ChatMessageWidget(
                                message: messages[index],
                              );
                            } else {
                              return ChatMessageWidget(
                                message: ChatMessage(
                                  text: currentStreamingResponse!,
                                  isUser: false,
                                  isStreaming: true,
                                ),
                              );
                            }
                          },
                        ),
                      ),
                      _buildInputArea(context, isProcessing),
                    ],
                  ),
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
              orElse: () => const SizedBox(),
            ),
          );
        },
      ),
    );
  }

  Widget _buildInputArea(BuildContext context, bool isProcessing) {
    final colors = AppColors.of(context);
    return Container(
      padding: const .symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: colors.surface,
        border: Border(
          top: BorderSide(color: colors.outlineVariant.withAlpha(123)),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              style: AppTextStyles.bodyMedium.copyWith(color: colors.onSurface),
              decoration: InputDecoration(
                hintText: t.chatbot.hint,
                hintStyle: AppTextStyles.bodyMedium.copyWith(
                  color: colors.onSurfaceVariant,
                ),
                border: OutlineInputBorder(
                  borderRadius: .circular(24),
                  borderSide: .none,
                ),
                filled: true,
                fillColor: colors.surfaceContainerLow,
                contentPadding: const .symmetric(horizontal: 20, vertical: 10),
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
          const SizedBox(width: 8),
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
                ? LoadingAnimationWidget.beat(color: colors.onPrimary, size: 20)
                : const Icon(Icons.send_rounded),
            style: IconButton.styleFrom(
              backgroundColor: colors.primary,
              foregroundColor: colors.onPrimary,
              disabledBackgroundColor: colors.outlineVariant,
            ),
          ),
        ],
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
