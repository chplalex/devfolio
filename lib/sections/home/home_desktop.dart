import 'package:flutter/material.dart';
import 'package:folio/animations/entrance_fader.dart';
import 'package:folio/utils/utils.dart';
import 'package:folio/widget/localized_text.dart';
import 'package:folio/widget/social_links.dart';

import '../../app/app_dimensions.dart';
import '../../app/app_theme.dart';
import '../../app/app_typography.dart';
import '../../app/space.dart';
import 'home_animated_text_kit.dart';

class HomeDesktop extends StatelessWidget {
  const HomeDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 1.025,
      padding: Space.h,
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            right: 0,
            child: Opacity(
              opacity: 0.9,
              child: EntranceFader(
                offset: const Offset(0, 0),
                delay: const Duration(seconds: 1),
                duration: const Duration(milliseconds: 800),
                child: Image.asset(
                  StaticUtils.blackWhitePhoto,
                  height: size.width < 1200
                      ? size.height * 0.8
                      : size.height * 0.85,
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(
              AppDimensions.normalize(30),
              AppDimensions.normalize(80),
              0,
              0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    LocalizedText('home_greeting', style: AppText.b1!.copyWith(fontFamily: 'Montserrat')),
                    EntranceFader(
                      offset: const Offset(0, 0),
                      delay: const Duration(seconds: 2),
                      duration: const Duration(milliseconds: 800),
                      child: Image.asset(StaticUtils.hi, height: AppDimensions.normalize(12)),
                    ),
                  ],
                ),
                Space.y1!,
                LocalizedText(
                  'first_name',
                  style: AppText.h1!.copyWith(
                    fontFamily: 'Montserrat',
                    fontSize: AppDimensions.normalize(25),
                    fontWeight: FontWeight.w100,
                  ),
                ),
                LocalizedText(
                  'last_name',
                  style: AppText.h1b!.copyWith(fontSize: AppDimensions.normalize(25), height: 1),
                ),
                EntranceFader(
                  offset: const Offset(-10, 0),
                  delay: const Duration(seconds: 1),
                  duration: const Duration(milliseconds: 800),
                  child: Row(
                    children: [
                      Icon(Icons.play_arrow_rounded, color: AppTheme.c!.primary!),
                      const HomeAnimatedTextKit(),
                    ],
                  ),
                ),
                Space.y2!,
                const SocialLinks(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
