import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../models/project_item.dart';
import '../../widget/section_heading.dart';
import '../../widget/section_sub_heading.dart';
import 'project_card.dart';

class ProjectsMobile extends StatelessWidget {
  final List<ProjectItem> projects;

  const ProjectsMobile({super.key, required this.projects});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        const SectionHeading("projects_section_header"),
        const SectionSubHeading("projects_section_sub_header"),
        CarouselSlider.builder(
          itemCount: projects.length,
          itemBuilder: (_, __, int index) {
            final item = projects[index];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: ProjectCard(
                icon: item.icon,
                link: item.githubLink,
                title: item.titleKey,
                description: item.descriptionKey,
              ),
            );
          },
          options: CarouselOptions(
            height: height * 0.4,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 5),
            enlargeCenterPage: true,
            autoPlayCurve: Curves.fastOutSlowIn,
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            enableInfiniteScroll: false,
          ),
        ),
      ],
    );
  }
}
