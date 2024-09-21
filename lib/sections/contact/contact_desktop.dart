import 'package:flutter/material.dart';
import 'package:folio/animations/widget_animator.dart';
import 'package:folio/widget/folio_card.dart';
import 'package:folio/widget/section_heading.dart';

import '../../app/app_dimensions.dart';
import '../../app/space.dart';
import '../../app/app_constants.dart';
import '../../widget/section_sub_heading.dart';

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
                      child: FolioCard(
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
