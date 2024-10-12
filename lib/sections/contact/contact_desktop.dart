import 'package:flutter/material.dart';

import '../../animations/widget_animator.dart';
import '../../app/app_constants.dart';
import '../../app/app_dimensions.dart';
import '../../app/space.dart';
import '../../widget/section_heading.dart';
import '../../widget/section_sub_heading.dart';
import 'contact_card.dart';

class ContactDesktop extends StatelessWidget {
  const ContactDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Space.all(1, 1),
      child: Column(
        children: [
          const SectionHeading("contact_section_header"),
          const SectionSubHeading("contact_section_sub_header"),
          Space.y!,
          Wrap(
            alignment: WrapAlignment.center,
            runSpacing: AppDimensions.normalize(10),
            children: contactItems
                .map((item) => WidgetAnimator(
                      child: ContactCard(
                        iconData: item.iconData,
                        title: item.titleKey,
                        description: item.descriptionKey,
                      ),
                    ))
                .toList(growable: false),
          ),
        ],
      ),
    );
  }
}
