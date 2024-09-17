import 'package:flutter/material.dart';
import 'package:folio/provider/app_provider.dart';
import 'package:provider/provider.dart';

import '../app/app_localizations.dart';
import '../app/app_typography.dart';

class AboutMeWidget extends StatelessWidget {
  final String labelKey;
  final String valueKey;

  const AboutMeWidget({super.key, required this.labelKey, required this.valueKey});

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context);
    final localizations = AppLocalizations.of(context);
    return Align(
      alignment: Alignment.center,
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: "${localizations.translate(labelKey)}: ",
              style: AppText.l1b!.copyWith(color: appProvider.isDark ? Colors.white : Colors.black),
            ),
            TextSpan(
              text: " ${localizations.translate(valueKey)}",
              style: AppText.l1!.copyWith(color: appProvider.isDark ? Colors.white : Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
