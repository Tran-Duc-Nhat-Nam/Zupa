import 'package:logarte/logarte.dart';

final debugger = Logarte(
  // Protect with password
  password: '1234',

  // Share network request
  onShare: (String content) {
    print(content);
  },

  // Add shortcut actions (optional)
  onRocketLongPressed: (context) {
    // e.g: toggle theme mode
  },
  onRocketDoubleTapped: (context) {
    // e.g: change language
  },
);
