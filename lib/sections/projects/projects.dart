import 'package:flutter/material.dart';
import 'package:folio/responsive/responsive.dart';

import 'projects_desktop.dart';
import 'projects_mobile.dart';

class Projects extends StatelessWidget {
  const Projects({super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: ProjectsMobile(),
      tablet: ProjectsMobile(),
      desktop: ProjectsDesktop(),
    );
  }
}
