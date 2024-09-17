import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:folio/app/app_localizations.dart';

import '../../app/app_typography.dart';

class HomeAnimatedTextKit extends StatelessWidget {
  const HomeAnimatedTextKit({super.key});

  @override
  Widget build(BuildContext context) {
    const textKeys = [
      'home_animated_text_key_1',
      'home_animated_text_key_2',
      'home_animated_text_key_3',
      'home_animated_text_key_4',
    ];
    final localizations = AppLocalizations.of(context);
    return AnimatedTextKit(
      animatedTexts: List.generate(
        textKeys.length,
        (index) => TyperAnimatedText(
          localizations.translate(textKeys[index]),
          speed: const Duration(milliseconds: 50),
          textStyle: AppText.b1,
        ),
      ),
      repeatForever: true,
      isRepeatingAnimation: true,
    );
  }
}
