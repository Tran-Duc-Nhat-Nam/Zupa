import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
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
      padding: const .symmetric(vertical: 6.0, horizontal: 12.0),
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
                  size: 18,
                ),
              ),
            ),
            const SizedBox(width: 8),
          ],
          Flexible(
            child: Container(
              padding: const .symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                color: isUser ? colors.primary : colors.surfaceContainerHigh,
                borderRadius: .only(
                  topLeft: const .circular(20),
                  topRight: const .circular(20),
                  bottomLeft: .circular(isUser ? 20 : 4),
                  bottomRight: .circular(isUser ? 4 : 20),
                ),
                boxShadow: [
                  BoxShadow(
                    color: colors.shadow.withAlpha(123),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Text(
                message.text,
                style: AppTextStyles.bodyLarge.copyWith(
                  color: isUser ? colors.onPrimary : colors.onSurface,
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
                  size: 18,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
