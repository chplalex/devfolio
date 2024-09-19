import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:folio/app/app_constants.dart';

import '../../app/space.dart';
import '../../models/service_item.dart';
import '../../widget/section_heading.dart';
import '../../widget/section_sub_heading.dart';
import 'widgets/services_card.dart';

class ServicesMobile extends StatelessWidget {
  const ServicesMobile({super.key});

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
          itemCount: serviceItems.length,
          itemBuilder: (BuildContext context, _, int index) => _serviceItem(serviceItems[index]),
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

  Padding _serviceItem(ServiceItem item) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: ServiceCard(
          icon: item.icon,
          titleKey: item.titleKey,
          descriptionKeys: item.descriptionKeys,
        ),
      );
}
