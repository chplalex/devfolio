import 'package:flutter/material.dart';

import '../app/app_constants.dart';
import '../app/app_dimensions.dart';
import '../app/app_theme.dart';
import '../app/app_typography.dart';

class TechToolsWidget extends StatelessWidget {
  const TechToolsWidget({super.key});

  @override
  Widget build(BuildContext context) => Wrap(
        alignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        runAlignment: WrapAlignment.center,
        spacing: 8.0,
        runSpacing: 8.0,
        children: kTools.map((e) => _buildItem(techName: e)).toList(growable: false),
      );

  Widget _buildItem({required String techName}) => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.play_arrow, color: AppTheme.c!.primary, size: AppDimensions.normalize(6)),
          Text(techName, style: AppText.l1b)
        ],
      );
}
