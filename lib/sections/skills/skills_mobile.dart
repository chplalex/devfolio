import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:folio/app/app_constants.dart';

import '../../app/space.dart';
import '../../models/skill_item.dart';
import '../../widget/section_heading.dart';
import '../../widget/section_sub_heading.dart';
import 'widgets/skill_card.dart';

class SkillsMobile extends StatelessWidget {
  const SkillsMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        const SectionHeading('skills_section_header'),
        const SectionSubHeading('skills_section_sub_header'),
        Space.y!,
        CarouselSlider.builder(
          itemCount: skillItems.length,
          itemBuilder: (BuildContext context, _, int index) => _buildItem(skillItems[index]),
          options: CarouselOptions(
            viewportFraction: 0.65,
            height: width < 450 ? height * 0.4 : height * 0.4,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 5),
            enlargeCenterPage: true,
            autoPlayCurve: Curves.fastOutSlowIn,
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            enableInfiniteScroll: false,
          ),
        )
      ],
    );
  }

  Padding _buildItem(SkillItem item) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: SkillCard(
          icon: item.icon,
          titleKey: item.titleKey,
          descriptionKeys: item.descriptionKeys,
        ),
      );
}
