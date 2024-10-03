import 'package:flutter/material.dart';

import '../../responsive/responsive.dart';
import 'skills_desktop.dart';
import 'skills_mobile.dart';

class Skills extends StatelessWidget {
  const Skills({super.key});

  @override
  Widget build(BuildContext context) => const Responsive(
        mobile: SkillsMobile(),
        tablet: SkillsMobile(),
        desktop: SkillsDesktop(),
      );
}
