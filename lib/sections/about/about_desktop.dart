import 'package:flutter/material.dart';
import 'package:folio/utils/utils.dart';
import 'package:folio/widget/section_heading.dart';
import 'package:folio/widget/tech_tools_widget.dart';

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
          Container(
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
                Space.y1!,
                TextButton(
                  style: TextButton.styleFrom(
                    minimumSize: Size.zero,
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    textStyle: AppText.b1b!.copyWith(decoration: TextDecoration.underline, fontFamily: 'Montserrat'),
                  ),
                  onPressed: () => openURL(Sources.resume),
                  child: LocalizedText("resume_label"),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
