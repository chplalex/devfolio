import 'package:url_launcher/url_launcher.dart';

class StaticUtils {
  static const String hi = 'assets/hi.gif';

  // photos
  static const String mobilePhoto = 'assets/photos/mobile.png';
  static const String coloredPhoto = 'assets/photos/colored.png';
  static const String blackWhitePhoto = 'assets/photos/black-white.png';

  // work
  static const String dsc = 'assets/work/dsc.png';
  static const String sastaTicket = 'assets/work/st.png';
  static const String university = 'assets/work/cui.png';
  static const String flutterIsb = 'assets/work/flutterIsl.png';

  // services
  static const String uiUx = 'assets/services/ui.png';
  static const String blog = 'assets/services/blog.png';
  static const String appDev = 'assets/services/app.png';
  static const String rapid = 'assets/services/rapid.png';
  static const String openSource = 'assets/services/open.png';
  static const String openSourceBlack = 'assets/services/open_b.png';
}

// URL Launcher
void openURL(String url) => launchUrl(Uri.parse(url));
