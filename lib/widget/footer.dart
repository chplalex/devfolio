import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:folio/app/app_localizations.dart';

import '../app/app_constants.dart';
import '../app/app_theme.dart';
import '../utils/utils.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final localizations = AppLocalizations.of(context);

    const flutterText = "Flutter";
    const flutterStyle = TextStyle(color: Colors.blue, decoration: TextDecoration.underline);
    final flutterRecognizer = TapGestureRecognizer()..onTap = () => openURL(Sources.gitHubDevFolio);

    final labelText = localizations.translate("developed_with_love_label");
    final labelStyle = TextStyle(color: AppTheme.c?.text);

    return Container(
      margin: EdgeInsets.fromLTRB(0, size.height * 0.05, 0, 0),
      height: size.height * 0.07,
      width: size.width,
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            TextSpan(text: labelText, style: labelStyle),
            const TextSpan(text: " "),
            TextSpan(text: flutterText, style: flutterStyle, recognizer: flutterRecognizer),
          ],
        ),
      ),
    );
  }
}
