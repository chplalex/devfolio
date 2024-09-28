import 'package:flutter/material.dart';
import 'package:folio/utils/utils.dart';
import 'package:folio/utils/work_utils.dart';
import 'package:folio/widget/about_me_widget.dart';
import 'package:folio/widget/community_button.dart';
import 'package:folio/widget/section_heading.dart';
import 'package:folio/widget/tech_tools_widget.dart';
import 'package:universal_html/html.dart' as html;

import '../../app/app_constants.dart';
import '../../app/app_dimensions.dart';
import '../../app/app_theme.dart';
import '../../app/app_typography.dart';
import '../../app/space.dart';
import '../../widget/localized_text.dart';
import '../../widget/section_sub_heading.dart';

class AboutDesktop extends StatelessWidget {
  const AboutDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Container(
      padding: Space.h,
      child: Column(
        children: [
          const SectionHeading('about_me_section_header'),
          const SectionSubHeading('about_me_section_sub_header'),
          Space.y1!,
          Row(
            children: [
              Expanded(
                child: Image.asset(StaticUtils.coloredPhoto, height: height * 0.7),
              ),
              Expanded(
                flex: width < 1230 ? 2 : 1,
                child: Container(
                  padding: EdgeInsets.only(left: width < 1230 ? 25.0 : 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Space.y1!,
                      LocalizedText('about_me_headline', style: AppText.b1b!.copyWith(fontFamily: 'Montserrat')),
                      Space.y!,
                      LocalizedText(
                        'about_me_detail',
                        style: AppText.b2!.copyWith(
                          height: 2,
                          letterSpacing: 1.1,
                          fontFamily: 'Montserrat',
                          fontSize: AppDimensions.normalize(5),
                        ),
                        textAlign: TextAlign.justify,
                      ),
                      Space.y!,
                      Divider(color: Colors.grey[800], thickness: AppDimensions.normalize(0.5)),
                      Space.y!,
                      LocalizedText('tech_tools_label', style: AppText.l1!.copyWith(color: AppTheme.c!.primary)),
                      Space.y!,
                      const TechToolsWidget(),
                      Space.y!,
                      Divider(color: Colors.grey[800], thickness: AppDimensions.normalize(0.5)),
                      const Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AboutMeWidget(labelKey: "full_name_label", valueKey: "full_name"),
                              AboutMeWidget(labelKey: "age_label", valueKey: "age"),
                            ],
                          ),
                          Spacer(),
                          Column(
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
                              onPressed: () => html.window.open(Sources.resume, 'pdf'),
                              child: const LocalizedText("resume_label"),
                            ),
                          ),
                          Space.x1!,
                          Container(
                            color: Colors.grey[900]!,
                            width: AppDimensions.normalize(30),
                            height: AppDimensions.normalize(0.5),
                          ),
                          ...WorkUtils.logos.asMap().entries.map(
                                (e) => Expanded(
                                  child: CommunityIconBtn(
                                    icon: e.value,
                                    link: WorkUtils.communityLinks[e.key],
                                    height: WorkUtils.communityLogoHeight[e.key],
                                  ),
                                ),
                              )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(width: width < 1230 ? width * 0.05 : width * 0.1),
            ],
          )
        ],
      ),
    );
  }
}
