import 'package:flutter/material.dart';

import '../app/app_localizations.dart';
import '../app/app_typedefs.dart';

class LocalizedText extends StatelessWidget {
  final String textKey;
  final StringMap? args;
  final TextStyle? style;
  final TextAlign? textAlign;

  const LocalizedText(this.textKey, {super.key, this.args, this.style, this.textAlign});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    return Text(localizations.translate(textKey, args: args), style: style, textAlign: textAlign);
  }
}
