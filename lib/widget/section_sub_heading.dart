import 'package:flutter/material.dart';

import '../app/app_typography.dart';
import 'localized_text.dart';

class SectionSubHeading extends StatelessWidget {
  final String textKey;

  const SectionSubHeading(this.textKey, {super.key});

  @override
  Widget build(BuildContext context) => LocalizedText(textKey, style: AppText.l1!.copyWith(fontFamily: 'Montserrat'));
}
