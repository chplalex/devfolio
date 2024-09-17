import 'package:flutter/material.dart';

import 'app_dimensions.dart';
import 'app_theme.dart';
import 'app_typography.dart';
import 'space.dart';
import 'ui.dart';
import 'ui_props.dart';

class App {
  static bool? isLtr;
  static bool showAds = false;

  static init(BuildContext context) {
    UI.init(context);
    AppDimensions.init();
    AppTheme.init(context);
    UIProps.init();
    Space.init();
    AppText.init();
    isLtr = Directionality.of(context) == TextDirection.ltr;
  }
}
