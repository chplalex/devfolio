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
        spacing: AppDimensions.normalize(4.0),
        runSpacing: AppDimensions.normalize(4.0),
        children: techTools.map((name) => _buildItem(text: name)).toList(growable: false),
      );

  Widget _buildItem({required String text}) => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.play_arrow, color: AppTheme.c!.primary, size: AppDimensions.normalize(6.0)),
          Text(text, style: AppText.l1b)
        ],
      );
}
