import 'package:flutter/material.dart';

extension BuildContextExtension on BuildContext {
  bool get isMobile => MediaQuery.of(this).size.width < 600;

  bool get isTablet {
    final size = MediaQuery.of(this).size;
    return size.width < 1000 && size.width >= 600;
  }

  bool get isDesktop => MediaQuery.of(this).size.width >= 1000;
}
