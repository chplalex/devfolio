import 'package:flutter/material.dart';
import 'package:folio/sections/home/home_animated_text_kit.dart';
import 'package:folio/widget/social_links.dart';

import '../../app/app_constants.dart';
import '../../app/app_dimensions.dart';
import '../../app/app_theme.dart';
import '../../app/app_typography.dart';
import '../../app/space.dart';
import '../../widget/localized_text.dart';

class HomeMobile extends StatelessWidget {
  const HomeMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height * 1.02,
      child: Stack(
        children: [
          Positioned(
            bottom: 0.0,
            right: AppDimensions.normalize(25),
            child: Opacity(
              opacity: 0.9,
              child: Image.asset(StaticUtils.blackWhitePhoto, height: AppDimensions.normalize(150)),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(
              AppDimensions.normalize(10),
              AppDimensions.normalize(40),
              0,
              0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    LocalizedText("home_greeting", style: AppText.b2!.copyWith(fontFamily: 'Montserrat')),
                    Space.x!,
                    Image.asset(StaticUtils.hi, height: AppDimensions.normalize(10)),
                  ],
                ),
                Space.y!,
                LocalizedText(
                  "first_name",
                  style: AppText.h3!.copyWith(fontFamily: 'Montserrat', fontWeight: FontWeight.w100),
                ),
                LocalizedText("last_name", style: AppText.h3b!.copyWith(height: 1)),
                Space.y!,
                Row(
                  children: [
                    Icon(Icons.play_arrow_rounded, color: AppTheme.c!.primary!),
                    const HomeAnimatedTextKit(),
                  ],
                ),
                Space.y!,
                const SocialLinks(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
