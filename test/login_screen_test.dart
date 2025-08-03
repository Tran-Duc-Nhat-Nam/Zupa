import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:zupa/screens/login/login_screen.dart';
import 'package:zupa/widgets/app_text_field.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences_platform_interface/shared_preferences_async_platform_interface.dart';
import 'package:shared_preferences_platform_interface/in_memory_shared_preferences_async.dart';

void main() async {
  late Widget loginScreen;

  SharedPreferencesAsyncPlatform.instance =
      InMemorySharedPreferencesAsync.empty();
  SharedPreferences.setMockInitialValues({});
  await EasyLocalization.ensureInitialized();

  setUpAll(() async {
    loginScreen = EasyLocalization(
      child: Builder(
        builder: (context) => MaterialApp(
          locale: context.locale,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          home: LoginScreen(),
        ),
      ),
      supportedLocales: const [Locale('en', 'US'), Locale('vi', 'VN')],
      path: 'assets/translations',
    );
  });

  group('Login Screen', () {
    testWidgets('should contains 3 text field', (WidgetTester tester) async {
      await tester.pumpWidget(loginScreen);
      await tester.pumpAndSettle(const Duration(seconds: 1));
      expect(find.byType(AppTextField), findsNWidgets(3));
    });
  });
}
