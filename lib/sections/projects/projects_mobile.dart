import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../app/app_constants.dart';
import '../../app/app_dimensions.dart';
import '../../app/app_typography.dart';
import '../../app/space.dart';
import '../../utils/utils.dart';
import '../../widget/localized_text.dart';
import '../../widget/section_heading.dart';
import '../../widget/section_sub_heading.dart';
import 'project_card.dart';

class ProjectsMobile extends StatelessWidget {
  const ProjectsMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        const SectionHeading("projects_section_header"),
        const SectionSubHeading("projects_section_sub_header"),
        CarouselSlider.builder(
          itemCount: projectItems.length,
          itemBuilder: (_, __, int index) {
            final item = projectItems[index];
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
        Space.y!,
        SizedBox(
          height: AppDimensions.normalize(14),
          width: AppDimensions.normalize(50),
          child: OutlinedButton(
            onPressed: () => openURL(Sources.resume),
            child: LocalizedText('see_more_label', style: AppText.l1b),
          ),
        )
      ],
    );
  }
}
