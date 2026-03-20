import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zupa/core/env/env.dart';
import 'package:zupa/core/i18n/gen/strings.g.dart';
import 'package:zupa/core/styles/colors.dart';
import 'package:zupa/core/styles/text_styles.dart';
import 'package:zupa/core/widgets/app_button.dart';

class AppErrorScreen extends StatelessWidget {
  const AppErrorScreen({
    super.key,
    required this.details,
  });

  final FlutterErrorDetails details;

  Future<String> _buildFullLog() async {
    final packageInfo = await PackageInfo.fromPlatform();
    final deviceInfoPlugin = DeviceInfoPlugin();

    String deviceInfo = '';
    if (Platform.isAndroid) {
      final androidInfo = await deviceInfoPlugin.androidInfo;
      deviceInfo = 'Model: ${androidInfo.model}, SDK: ${androidInfo.version.sdkInt}';
    } else if (Platform.isIOS) {
      final iosInfo = await deviceInfoPlugin.iosInfo;
      deviceInfo = 'Model: ${iosInfo.utsname.machine}, System: ${iosInfo.systemName} ${iosInfo.systemVersion}';
    } else {
      deviceInfo = 'Platform not detailed';
    }

    final buffer = StringBuffer();
    buffer.writeln('===== APP ERROR REPORT =====');
    buffer.writeln('App Name: ${packageInfo.appName}');
    buffer.writeln('Version: ${packageInfo.version}+${packageInfo.buildNumber}');
    buffer.writeln('Device: $deviceInfo');
    buffer.writeln('Timestamp: ${DateTime.now().toIso8601String()}');
    buffer.writeln('\n===== EXCEPTION =====');
    buffer.writeln(details.exceptionAsString());
    buffer.writeln('\n===== STACKTRACE =====');
    buffer.writeln(details.stack.toString());
    buffer.writeln('============================');

    return buffer.toString();
  }

  Future<void> _exportToFile() async {
    final log = await _buildFullLog();
    final directory = await getTemporaryDirectory();
    final filePath = '${directory.path}/error_log_${DateTime.now().millisecondsSinceEpoch}.txt';
    final file = File(filePath);
    await file.writeAsString(log);

    await SharePlus.instance.share(
      ShareParams(
        files: [XFile(filePath)],
        subject: 'Zupa App Crash Log',
        text: 'Here is the error log for the Zupa app crash.',
      ),
    );
  }

  Future<void> _reportToGitHub() async {
    final log = await _buildFullLog();
    final title = Uri.encodeComponent('App Crash: ${details.exceptionAsString().split('\n').first}');
    final body = Uri.encodeComponent('**Error Report:**\n```\n$log\n```');
    final url = '${Env.github}/issues/new?title=$title&body=$body';

    final uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      // Could not launch
    }
  }

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
                onPressed: _exportToFile,
                icon: Symbols.save_alt_rounded,
                text: 'Export Error Log',
              ),
              const SizedBox(height: 12),
              AppButton(
                onPressed: _reportToGitHub,
                icon: Symbols.bug_report_rounded,
                text: 'Report to GitHub',
                color: .error,
                theme: .outline,
              ),
              const SizedBox(height: 24),
              AppButton(
                onPressed: () {
                  if (Navigator.of(context).canPop()) {
                    Navigator.of(context).pop();
                  }
                },
                theme: .outline,
                text: t.common.actions.close,
                color: .basic,
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
