import 'package:flutter/material.dart';
import 'package:folio/app/app_constants.dart';
import 'package:folio/utils/utils.dart';
import 'package:folio/widget/folio_card.dart';
import 'package:folio/widget/section_heading.dart';

import '../../app/app_dimensions.dart';
import '../../app/app_typography.dart';
import '../../app/space.dart';
import '../../widget/section_sub_heading.dart';

class PortfolioDesktop extends StatefulWidget {
  const PortfolioDesktop({super.key});

  @override
  State<PortfolioDesktop> createState() => _PortfolioDesktopState();
}

class _PortfolioDesktopState extends State<PortfolioDesktop> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Space.h!,
      child: Column(
        children: [
          const SectionHeading("portfolio_section_header"),
          const SectionSubHeading("portfolio_section_sub_header"),
          Wrap(
            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            runSpacing: AppDimensions.normalize(10),
            children: projectItems
                .map((item) => FolioCard(
                      banner: item.banner,
                      icon: item.icon,
                      link: item.githubLink,
                      title: item.titleKey,
                      description: item.descriptionKey,
                    ))
                .toList(growable: false),
          ),
          Space.y2!,
          SizedBox(
            height: AppDimensions.normalize(14),
            width: AppDimensions.normalize(50),
            child: OutlinedButton(
              onPressed: () => openURL(StaticUtils.gitHub),
              child: Text('See More', style: AppText.l1b),
            ),
          )
        ],
      ),
    );
  }
}
