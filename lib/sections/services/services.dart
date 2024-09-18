import 'package:flutter/material.dart';

import '../../responsive/responsive.dart';
import 'services_desktop.dart';
import 'services_mobile.dart';

class Services extends StatelessWidget {
  const Services({super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: ServiceMobile(),
      tablet: ServiceMobile(),
      desktop: ServiceDesktop(),
    );
  }
}
