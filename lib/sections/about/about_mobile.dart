import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:folio/utils/utils.dart';
import 'package:folio/utils/work_utils.dart';
import 'package:folio/widget/about_me_widget.dart';
import 'package:folio/widget/community_button.dart';
import 'package:folio/widget/section_heading.dart';
import 'package:folio/widget/tech_tools_widget.dart';
import 'package:universal_html/html.dart' as html;

import '../../app/app_dimensions.dart';
import '../../app/app_theme.dart';
import '../../app/app_typography.dart';
import '../../app/space.dart';
import '../../widget/localized_text.dart';
import '../../widget/section_sub_heading.dart';

class AboutMobile extends StatelessWidget {
  const AboutMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Container(
      padding: Space.h,
      child: Column(
        children: [
          const SectionHeading('about_me_section_header'),
          const SectionSubHeading('about_me_section_sub_header'),
          Space.y1!,
          Image.asset(StaticUtils.mobilePhoto, height: height * 0.27),
          SizedBox(height: height * 0.03),
          Align(
            alignment: Alignment.centerLeft,
            child: LocalizedText("about_me_headline_label", style: AppText.b2!.copyWith(color: AppTheme.c!.primary)),
          ),
          Space.y1!,
          LocalizedText('about_me_headline_label', style: AppText.b2b!.copyWith(fontFamily: 'Montserrat')),
          SizedBox(height: height * 0.02),
          LocalizedText(
            'about_me_headline',
            style: AppText.l1!.copyWith(height: 2, letterSpacing: 1.1, fontFamily: 'Montserrat'),
          ),
          Space.y!,
          Divider(color: Colors.grey[800], thickness: AppDimensions.normalize(0.5)),
          Space.y!,
          LocalizedText('tool_tech_label', style: AppText.l1!.copyWith(color: AppTheme.c!.primary)),
          Space.y!,
          const TechToolsWidget(),
          Space.y!,
          Divider(color: Colors.grey[800], thickness: AppDimensions.normalize(0.5)),
          SizedBox(height: height * 0.02),
          const AboutMeWidget(labelKey: "full_name_label", valueKey: "full_name"),
          const AboutMeWidget(labelKey: "email_label", valueKey: "email"),
          const AboutMeWidget(labelKey: "place_label", valueKey: "place"),
          Space.y!,
          OutlinedButton(
            onPressed: () {
              kIsWeb ? html.window.open(StaticUtils.resume, "pdf") : openURL(StaticUtils.resume);
            },
            child: const LocalizedText("resume_label"),
          ),
          Space.y!,
          Wrap(
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
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
        ],
      ),
    );
  }
}
