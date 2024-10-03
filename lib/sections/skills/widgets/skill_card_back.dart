import 'package:flutter/material.dart';
import 'package:folio/widget/localized_text.dart';
import 'package:provider/provider.dart';

import '../../../app/app_dimensions.dart';
import '../../../app/app_theme.dart';
import '../../../app/app_typography.dart';
import '../../../provider/app_provider.dart';
import 'hire_me_popup.dart';

class ServiceCardBackWidget extends StatelessWidget {
  final List<String> descriptionKeys;

  const ServiceCardBackWidget({super.key, required this.descriptionKeys});

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ...descriptionKeys.map((key) => LocalizedText(key, style: AppText.l1)),
        Divider(color: appProvider.isDark ? Colors.white : Colors.black38, height: AppDimensions.normalize(8.0)),
        SizedBox(
          height: AppDimensions.normalize(14),
          width: AppDimensions.normalize(60),
          child: MaterialButton(
            color: AppTheme.c!.primary,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppDimensions.normalize(6.0))),
            onPressed: () => const HireMePopup().show(context),
            child: LocalizedText('hire_me_label', style: AppText.b2!.copyWith(color: Colors.white)),
          ),
        )
      ],
    );
  }
}
