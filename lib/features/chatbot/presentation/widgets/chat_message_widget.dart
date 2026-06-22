import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gpt_markdown/gpt_markdown.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:zupa/core/styles/colors.dart';
import 'package:zupa/core/styles/text_styles.dart';
import 'package:zupa/features/chatbot/domain/entity/chat_message.dart';

class ChatMessageWidget extends StatelessWidget {
  final ChatMessage message;

  const ChatMessageWidget({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final colors = context.colorScheme;
    final isUser = message.isUser;

    return Padding(
      padding: const .symmetric(vertical: 8, horizontal: 16),
      child: Row(
        mainAxisAlignment: isUser ? .end : .start,
        crossAxisAlignment: .end,
        spacing: 8,
        children: [
          if (!isUser)
            Container(
              margin: const .only(bottom: 4),
              child: CircleAvatar(
                radius: 16,
                backgroundColor: colors.primaryContainer,
                child: Icon(
                  Symbols.smart_toy_rounded,
                  color: colors.onPrimaryContainer,
                  size: 24,
                ),
              ),
            ),
          Flexible(
            child: Container(
              padding: const .symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: isUser
                    ? colors.primaryContainer
                    : colors.secondaryContainer,
                borderRadius: .only(
                  topLeft: const .circular(28),
                  topRight: const .circular(28),
                  bottomLeft: .circular(isUser ? 28 : 8),
                  bottomRight: .circular(isUser ? 8 : 28),
                ),
              ),
              child: GptMarkdown(
                message.text,
                style: AppTextStyles.bodyLarge.copyWith(
                  color: isUser
                      ? colors.onPrimaryContainer
                      : colors.onSecondaryContainer,
                ),
                followLinkColor: true,
              ),
            ),
          ).animate().fade(duration: 250.ms).slideY(begin: 0.1, end: 0),
          if (isUser)
            CircleAvatar(
              radius: 16,
              backgroundColor: colors.secondaryContainer,
              child: Icon(
                Symbols.person_rounded,
                color: colors.onSecondaryContainer,
                size: 24,
              ),
            ),
        ],
      ),
    );
  }
}
