import 'package:flutter/material.dart';
import 'package:folio/app/app_colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../app/app_constants.dart';
import '../../../app/app_typography.dart';
import '../../../app/space.dart';
import '../../../utils/utils.dart';
import '../../../widget/localized_text.dart';

class HireMePopup {
  const HireMePopup();

  Future<void> show(BuildContext context) => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: LocalizedText("hire_me_label", style: AppText.b2b),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const LocalizedText("back_label"),
            )
          ],
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _contactButton(
                iconData: FontAwesomeIcons.squareEnvelope,
                iconColor: AppColors.email,
                url: Contacts.email,
              ),
              Space.y1!,
              _contactButton(
                iconData: FontAwesomeIcons.whatsapp,
                iconColor: AppColors.whatsapp,
                url: Contacts.whatsapp,
              ),
              Space.y1!,
              _contactButton(
                iconData: FontAwesomeIcons.telegram,
                iconColor: AppColors.telegram,
                url: Contacts.telegram,
              ),
            ],
          ),
        ),
      );

  Widget _contactButton({
    required IconData iconData,
    required Color iconColor,
    required String url,
  }) =>
      IconButton(
        icon: Icon(iconData),
        iconSize: 40.0,
        color: iconColor, // const Color(0xff13A800),
        onPressed: () => openURL(url),
      );
}
