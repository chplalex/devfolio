import 'package:flutter/material.dart';
import 'package:folio/app/app_extensions.dart';

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;

  const Responsive({
    super.key,
    required this.mobile,
    required this.tablet,
    required this.desktop,
  });

  @override
  Widget build(BuildContext context) {
    if (context.isDesktop) {
      return desktop;
    } else if (context.isTablet) {
      return tablet;
    } else {
      return mobile;
    }
    //TODO: remove after testing
    // return LayoutBuilder(
    //   builder: (context, constraints) {
    //     if (context.isDesktop) {
    //       return desktop;
    //     } else if (context.isTablet) {
    //       return tablet;
    //     } else {
    //       return mobile;
    //     }
    // if (constraints.maxWidth >= 1000) {
    //   return desktop;
    // } else if (constraints.maxWidth >= 600) {
    //   return tablet;
    // } else {
    //   return mobile;
    // }
    //   },
    // );
  }
}
