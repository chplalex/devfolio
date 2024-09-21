import 'package:flutter/material.dart';
import 'package:folio/app/app_extensions.dart';
import 'package:folio/models/social_item.dart';
import 'package:folio/provider/app_provider.dart';
import 'package:folio/utils/utils.dart';
import 'package:provider/provider.dart';

import '../app/app_constants.dart';
import '../app/app_dimensions.dart';

class SocialLinks extends StatelessWidget {
  const SocialLinks({super.key});

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context);
    final itemColor = appProvider.isDark ? Colors.white : Colors.black;
    final height = context.isMobile ? AppDimensions.normalize(15) : AppDimensions.normalize(20);
    return SizedBox(
      height: height,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => _buildItem(context, item: socialItems[index], color: itemColor),
        separatorBuilder: (_, __) => _separatorBuilder(),
        itemCount: socialItems.length,
      ),
    );
  }

  Widget _buildItem(
    BuildContext context, {
    required SocialItem item,
    required Color color,
  }) =>
      GestureDetector(
        child: Icon(item.iconData, color: color),
        onTap: () => openURL(item.url),
      );

  Widget _separatorBuilder() => SizedBox(width: AppDimensions.normalize(4));
}
