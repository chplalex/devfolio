import 'package:flutter/material.dart';
import 'package:folio/utils/utils.dart';
import 'package:folio/utils/work_utils.dart';
import 'package:folio/widget/about_me_widget.dart';
import 'package:folio/widget/community_button.dart';
import 'package:folio/widget/localized_text.dart';
import 'package:folio/widget/section_heading.dart';
import 'package:folio/widget/tech_tools_widget.dart';
import 'package:universal_html/html.dart' as html;

import '../../app/app_dimensions.dart';
import '../../app/app_theme.dart';
import '../../app/app_typography.dart';
import '../../app/space.dart';
import '../../widget/section_sub_heading.dart';

class AboutTablet extends StatelessWidget {
  const AboutTablet({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Container(
      padding: Space.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Center(child: SectionHeading('about_me_section_header')),
          const Center(child: SectionSubHeading('about_me_section_sub_header')),
          Space.y1!,
          Image.asset(StaticUtils.mobilePhoto, height: height * 0.27),
          SizedBox(height: height * 0.03),
          LocalizedText("about_me_headline_label", style: AppText.b2!.copyWith(color: AppTheme.c!.primary)),
          Space.y1!,
          LocalizedText('about_me_headline', style: AppText.b2b!.copyWith(fontFamily: 'Montserrat')),
          SizedBox(height: height * 0.02),
          LocalizedText(
            'about_me_detail',
            style: AppText.l1!.copyWith(height: 2, letterSpacing: 1.1, fontFamily: 'Montserrat'),
          ),
          Space.y!,
          Divider(color: Colors.grey[800], thickness: AppDimensions.normalize(0.5)),
          Space.y!,
          LocalizedText('tech_tools_label', style: AppText.l1!.copyWith(color: AppTheme.c!.primary)),
          const TechToolsWidget(),
          Space.y!,
          Divider(
            color: Colors.grey[800],
            thickness: AppDimensions.normalize(0.5),
          ),
          Space.y!,
          Row(
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AboutMeWidget(labelKey: "full_name_label", valueKey: "full_name"),
                  AboutMeWidget(labelKey: "age_label", valueKey: "age"),
                ],
              ),
              SizedBox(width: width > 710 ? width * 0.2 : width * 0.05),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AboutMeWidget(labelKey: "email_label", valueKey: "email"),
                  AboutMeWidget(labelKey: "place_label", valueKey: "place"),
                ],
              ),
            ],
          ),
          Space.y1!,
          Row(
            children: [
              SizedBox(
                height: AppDimensions.normalize(13),
                width: AppDimensions.normalize(40),
                child: OutlinedButton(
                  onPressed: () => html.window.open(StaticUtils.resume, 'pdf'),
                  child: const LocalizedText("resume_label"),
                ),
              ),
              Space.x!,
              Container(
                width: width * 0.05,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.grey[900]!, width: 2.0),
                  ),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                    children: WorkUtils.logos
                        .asMap()
                        .entries
                        .map(
                          (e) => CommunityIconBtn(
                            icon: e.value,
                            link: WorkUtils.communityLinks[e.key],
                            height: WorkUtils.communityLogoHeight[e.key],
                          ),
                        )
                        .toList()),
              ),
            ],
          )
        ],
      ),
    );
  }
}
