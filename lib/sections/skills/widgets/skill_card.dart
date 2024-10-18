import 'package:flip_card/flip_card.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:folio/widget/localized_text.dart';
import 'package:provider/provider.dart';

import '../../../app/app_dimensions.dart';
import '../../../app/app_theme.dart';
import '../../../app/space.dart';
import '../../../provider/app_provider.dart';
import 'skill_card_back.dart';

class SkillCard extends StatefulWidget {
  final String icon;
  final String titleKey;
  final List<String> descriptionKeys;

  const SkillCard({
    super.key,
    required this.icon,
    required this.titleKey,
    required this.descriptionKeys,
  });

  @override
  State<SkillCard> createState() => _SkillCardState();
}

class _SkillCardState extends State<SkillCard> {
  final _cardKey = GlobalKey<FlipCardState>();
  var _isHover = false;

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context);

    return InkWell(
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () => _cardKey.currentState!.toggleCard(),
      onHover: (isHovering) => setState(() => _isHover = isHovering),
      child: FlipCard(
        flipOnTouch: !kIsWeb,
        key: _cardKey,
        back: Container(
          width: AppDimensions.normalize(100),
          height: AppDimensions.normalize(80),
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
          decoration: BoxDecoration(
            color: appProvider.isDark ? Colors.grey[900] : Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: _isHover ? AppTheme.c!.primary!.withAlpha(100) : Colors.black.withAlpha(100),
                blurRadius: 12.0,
                offset: Offset.zero,
              ),
            ],
          ),
          child: ServiceCardBackWidget(descriptionKeys: widget.descriptionKeys),
        ),
        front: Container(
          width: AppDimensions.normalize(100),
          height: AppDimensions.normalize(80),
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
          decoration: BoxDecoration(
            color: appProvider.isDark ? Colors.grey[900] : Colors.white,
            borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: _isHover ? AppTheme.c!.primary!.withAlpha(100) : Colors.black.withAlpha(100),
                  blurRadius: 12.0,
                  offset: Offset.zero,
                )
                  ]
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(widget.icon, height: AppDimensions.normalize(50)),
              Space.y1!,
              LocalizedText(widget.titleKey, textAlign: TextAlign.center),
            ],
          ),
        ),
      ),
    );
  }
}
