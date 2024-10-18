import 'package:flutter/material.dart';

import '../../app/app_dimensions.dart';
import '../../app/space.dart';
import '../../models/project_item.dart';
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
        ],
      ),
    );
  }
}
