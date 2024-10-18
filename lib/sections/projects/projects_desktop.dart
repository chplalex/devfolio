import 'package:flutter/material.dart';

import '../../app/app_constants.dart';
import '../../app/app_dimensions.dart';
import '../../app/app_typography.dart';
import '../../app/space.dart';
import '../../models/project_item.dart';
import '../../utils/utils.dart';
import '../../widget/localized_text.dart';
import '../../widget/section_heading.dart';
import '../../widget/section_sub_heading.dart';
import 'project_card.dart';

class ProjectsDesktop extends StatelessWidget {
  final List<ProjectItem> projects;

  const ProjectsDesktop({super.key, required this.projects});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Space.h!,
      child: Column(
        children: [
          const SectionHeading("projects_section_header"),
          const SectionSubHeading("projects_section_sub_header"),
          Wrap(
            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            runSpacing: AppDimensions.normalize(10),
            children: projects
                .map((item) => ProjectCard(
                      icon: item.icon,
                      link: item.githubLink,
                      title: item.titleKey,
                      description: item.descriptionKey,
                    ))
                .toList(growable: false),
          ),
          Space.y2!,
          SizedBox(
            height: AppDimensions.normalize(14),
            width: AppDimensions.normalize(50),
            child: OutlinedButton(
              onPressed: () => openURL(Sources.resume),
              child: LocalizedText('see_more_label', style: AppText.l1b),
            ),
          )
        ],
      ),
    );
  }
}
