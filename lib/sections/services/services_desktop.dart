import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

import '../../app/app_constants.dart';
import '../../app/space.dart';
import '../../widget/section_heading.dart';
import '../../widget/section_sub_heading.dart';
import 'widgets/services_card.dart';

class ServicesDesktop extends StatefulWidget {
  const ServicesDesktop({super.key});

  @override
  ServicesDesktopState createState() => ServicesDesktopState();
}

class ServicesDesktopState extends State<ServicesDesktop> {
  GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Container(
      padding: Space.hf(4),
      child: Column(
        children: [
          const SectionHeading('services_section_header'),
          const SectionSubHeading('services_section_sub_header'),
          Space.y!,
          Wrap(
            spacing: width * 0.05,
            runSpacing: height * 0.05,
            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: serviceItems
                .map(
                  (item) => ServiceCard(
                    icon: item.icon,
                    titleKey: item.titleKey,
                    descriptionKeys: item.descriptionKeys,
                  ),
                )
                .toList(),
          )
        ],
      ),
    );
  }
}
