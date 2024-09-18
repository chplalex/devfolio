import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../app/space.dart';
import '../../utils/services_utils.dart';
import '../../widget/section_heading.dart';
import '../../widget/section_sub_heading.dart';
import 'widgets/services_card.dart';

class ServiceMobile extends StatelessWidget {
  const ServiceMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        const SectionHeading('services_section_header'),
        const SectionSubHeading('services_section_sub_header'),
        Space.y!,
        CarouselSlider.builder(
          itemCount: ServicesUtils.servicesTitles.length,
          itemBuilder: (BuildContext context, int itemIndex, int i) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: ServiceCard(
              serviceIcon: ServicesUtils.servicesIcons[i],
              serviceTitle: ServicesUtils.servicesTitles[i],
              serviceDescription: ServicesUtils.servicesDescription[i],
            ),
          ),
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
}
