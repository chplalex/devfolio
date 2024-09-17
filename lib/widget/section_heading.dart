import 'package:flutter/material.dart';

import '../app/app_typography.dart';
import 'localized_text.dart';

class SectionHeading extends StatelessWidget {
  final String textKey;

  const SectionHeading(this.textKey, {super.key});

  @override
  Widget build(BuildContext context) => LocalizedText(textKey, style: AppText.h1!.copyWith(fontFamily: 'Montserrat'));
}
