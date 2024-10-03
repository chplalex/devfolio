import 'package:flutter/material.dart';
import 'package:folio/responsive/responsive.dart';
import 'package:folio/sections/contact/contact_desktop.dart';
import 'package:folio/sections/contact/contact_mobile.dart';

class Contacts extends StatelessWidget {
  const Contacts({super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: ContactMobile(),
      tablet: ContactMobile(),
      desktop: ContactDesktop(),
    );
  }
}
