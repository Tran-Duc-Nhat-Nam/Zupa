import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:zupa/core/helper/debugger/debugger_helper.dart';
import 'package:zupa/core/i18n/gen/strings.g.dart';
import 'package:zupa/core/styles/colors.dart';
import 'package:zupa/core/styles/text_styles.dart';
import 'package:zupa/core/widgets/app_button.dart';
import 'package:talker_flutter/talker_flutter.dart';

class AppErrorScreen extends StatelessWidget {
  const AppErrorScreen({
    super.key,
    required this.details,
  });

  final FlutterErrorDetails details;

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColors.of(context);

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const .symmetric(horizontal: 24, vertical: 32),
          child: Column(
            mainAxisAlignment: .center,
            children: [
              Container(
                padding: const .all(24),
                decoration: BoxDecoration(
                  color: colorScheme.errorContainer,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Symbols.error_rounded,
                  size: 64,
                  color: colorScheme.error,
                ),
              ),
              const SizedBox(height: 32),
              Text(
                t.common.errors.unexpected,
                style: AppTextStyles.heading4.copyWith(
                  color: colorScheme.onSurface,
                ),
                textAlign: .center,
              ),
              const SizedBox(height: 16),
              Text(
                'We apologize for the inconvenience. A technical error has occurred in the application hardware or software interface.',
                style: AppTextStyles.bodyMediumRegular.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
                textAlign: .center,
              ),
              const SizedBox(height: 48),
              AppButton(
                onPressed: () {
                  // Navigate to Talker Screen for debugging
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => TalkerScreen(
                        talker: DebuggerHelper.talker,
                      ),
                    ),
                  );
                },
                icon: Symbols.bug_report_rounded,
                text: 'Report & View Logs',
                color: .error,
              ),
              const SizedBox(height: 16),
              AppButton(
                onPressed: () {
                  // In a real app, you might want to restart the app or clear state
                  // For now, we'll just try to pop or go home
                  if (Navigator.of(context).canPop()) {
                    Navigator.of(context).pop();
                  } else {
                    // Force restart or go to initial route could be implemented here
                  }
                },
                theme: .outline,
                text: t.common.actions.close,
              ),
              const SizedBox(height: 32),
              if (details.exceptionAsString().isNotEmpty)
                Container(
                  width: double.infinity,
                  padding: const .all(16),
                  decoration: BoxDecoration(
                    color: colorScheme.surfaceContainerLow,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: colorScheme.outlineVariant),
                  ),
                  child: SingleChildScrollView(
                    scrollDirection: .horizontal,
                    child: Text(
                      details.exceptionAsString(),
                      style: AppTextStyles.bodySmallRegular.copyWith(
                        color: colorScheme.error,
                        fontFamily: 'monospace',
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
