import 'package:flutter/material.dart';

import '../../app/app_constants.dart';
import '../../app/space.dart';
import '../../widget/section_heading.dart';
import '../../widget/section_sub_heading.dart';
import 'widgets/skill_card.dart';

class SkillsDesktop extends StatelessWidget {
  const SkillsDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Container(
      padding: Space.hf(4),
      child: Column(
        children: [
          const SectionHeading('services_section_header'),
          const SectionSubHeading('services_section_sub_header'),
          Space.y!,
          Wrap(
            spacing: width * 0.05,
            runSpacing: height * 0.05,
            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: serviceItems
                .map(
                  (item) => SkillCard(
                    icon: item.icon,
                    titleKey: item.titleKey,
                    descriptionKeys: item.descriptionKeys,
                  ),
                )
                .toList(),
          )
        ],
      ),
    );
  }
}
