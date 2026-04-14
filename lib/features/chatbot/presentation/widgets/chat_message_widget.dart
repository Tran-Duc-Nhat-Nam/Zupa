import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_markdown_plus/flutter_markdown_plus.dart';
import 'package:zupa/core/styles/colors.dart';
import 'package:zupa/core/styles/text_styles.dart';
import 'package:zupa/features/chatbot/presentation/bloc/chatbot_state.dart';

class ChatMessageWidget extends StatelessWidget {
  final ChatMessage message;

  const ChatMessageWidget({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.of(context);
    final isUser = message.isUser;

    return Padding(
      padding: const .symmetric(vertical: 8, horizontal: 16),
      child: Row(
        mainAxisAlignment: isUser ? .end : .start,
        crossAxisAlignment: .end,
        children: [
          if (!isUser) ...[
            Container(
              margin: const .only(bottom: 4),
              child: CircleAvatar(
                radius: 16,
                backgroundColor: colors.primaryContainer,
                child: Icon(
                  Icons.smart_toy_rounded,
                  color: colors.onPrimaryContainer,
                  size: 20,
                ),
              ),
            ),
            const SizedBox(width: 8),
          ],
          Flexible(
            child: Container(
              padding: const .symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                color: isUser
                    ? colors.secondaryContainer
                    : colors.surfaceContainerHigh,
                borderRadius: .only(
                  topLeft: const .circular(28),
                  topRight: const .circular(28),
                  bottomLeft: .circular(isUser ? 28 : 6),
                  bottomRight: .circular(isUser ? 6 : 28),
                ),
                boxShadow: [
                  BoxShadow(
                    color: colors.shadow.withAlpha(123),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: MarkdownBody(
                data: message.text,
                selectable: true,
                styleSheet: .new(
                  p: AppTextStyles.bodyLarge.copyWith(
                    color: isUser
                        ? colors.onSecondaryContainer
                        : colors.onSurface,
                  ),
                  h1: AppTextStyles.headlineMediumBold.copyWith(
                    color: isUser
                        ? colors.onSecondaryContainer
                        : colors.onSurface,
                  ),
                  h2: AppTextStyles.headlineSmallBold.copyWith(
                    color: isUser
                        ? colors.onSecondaryContainer
                        : colors.onSurface,
                  ),
                  h3: AppTextStyles.titleMediumBold.copyWith(
                    color: isUser
                        ? colors.onSecondaryContainer
                        : colors.onSurface,
                  ),
                  h4: AppTextStyles.titleMediumBold.copyWith(
                    color: isUser
                        ? colors.onSecondaryContainer
                        : colors.onSurface,
                  ),
                  h5: AppTextStyles.titleSmallBold.copyWith(
                    color: isUser
                        ? colors.onSecondaryContainer
                        : colors.onSurface,
                  ),
                  h6: AppTextStyles.titleSmall.copyWith(
                    color: isUser
                        ? colors.onSecondaryContainer
                        : colors.onSurface,
                  ),
                  code: AppTextStyles.bodyMedium.copyWith(
                    color: colors.onSurface,
                    fontFamily: 'monospace',
                  ),
                  codeblockDecoration: BoxDecoration(
                    color: colors.surfaceContainerHighest,
                    borderRadius: .circular(8),
                  ),
                  blockquoteDecoration: BoxDecoration(
                    border: Border(
                      left: BorderSide(
                        color: isUser
                            ? colors.onPrimary.withAlpha(100)
                            : colors.outline,
                        width: 4,
                      ),
                    ),
                  ),
                  blockquote: AppTextStyles.bodyMedium.copyWith(
                    color: isUser
                        ? colors.onPrimary.withAlpha(200)
                        : colors.onSurfaceVariant,
                    fontStyle: .italic,
                  ),
                  listBullet: AppTextStyles.bodyLarge.copyWith(
                    color: isUser ? colors.onPrimary : colors.onSurface,
                  ),
                ),
              ),
            ),
          ).animate().fade(duration: 250.ms).slideY(begin: 0.1, end: 0),
          if (isUser) ...[
            const SizedBox(width: 8),
            Container(
              margin: const .only(bottom: 4),
              child: CircleAvatar(
                radius: 16,
                backgroundColor: colors.secondaryContainer,
                child: Icon(
                  Icons.person_rounded,
                  color: colors.onSecondaryContainer,
                  size: 20,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
