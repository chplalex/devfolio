import 'package:flutter/material.dart';
import 'package:folio/widget/localized_text.dart';

import '../app/app_typography.dart';

class NavBarLogo extends StatelessWidget {
  const NavBarLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text("< ", style: AppText.b1),
        LocalizedText("last_name", style: AppText.b1b!.copyWith(fontFamily: 'Agustina')),
        Text(MediaQuery.of(context).size.width >= 1000 ? " />\t\t" : " />", style: AppText.b1)
      ],
    );
  }
}
