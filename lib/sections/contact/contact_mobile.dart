import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../app/app_constants.dart';
import '../../app/app_dimensions.dart';
import '../../models/contact_item.dart';
import '../../widget/section_heading.dart';
import '../../widget/section_sub_heading.dart';
import 'contact_card.dart';

class ContactMobile extends StatelessWidget {
  const ContactMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SectionHeading("contact_section_header"),
        const SectionSubHeading("contact_section_sub_header"),
        CarouselSlider.builder(
          itemCount: contactItems.length,
          itemBuilder: (BuildContext context, int itemIndex, int i) => _buildItem(contactItems[i]),
          options: CarouselOptions(
            height: AppDimensions.normalize(110),
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

  Widget _buildItem(ContactItem item) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: ContactCard(iconData: item.iconData, title: item.titleKey, description: item.descriptionKey),
      );
}
