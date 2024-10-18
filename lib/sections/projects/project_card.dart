import 'package:flutter/material.dart';
import 'package:folio/app/app_extensions.dart';
import 'package:folio/provider/app_provider.dart';
import 'package:provider/provider.dart';

import '../../app/app_dimensions.dart';
import '../../app/app_theme.dart';
import '../../app/app_typography.dart';
import '../../app/space.dart';
import '../../utils/utils.dart';
import '../../widget/localized_text.dart';

class ProjectCard extends StatefulWidget {
  final String? link;
  final String icon;
  final String title;
  final String description;

  const ProjectCard({
    super.key,
    required this.icon,
    this.link,
    required this.title,
    required this.description,
  });

  @override
  ProjectCardState createState() => ProjectCardState();
}

class ProjectCardState extends State<ProjectCard> {
  bool _isHover = false;

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context);

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return InkWell(
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: widget.link != null ? () => openURL(widget.link!) : () {},
      onHover: (isHovering) => setState(() => _isHover = isHovering),
      child: Container(
        margin: Space.h,
        padding: Space.all(),
        width: AppDimensions.normalize(100),
        height: AppDimensions.normalize(80),
        decoration: BoxDecoration(
          color: appProvider.isDark ? Colors.grey[900] : Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: (_isHover ? AppTheme.c!.primary! : Colors.black).withAlpha(100),
              blurRadius: 12.0,
              offset: const Offset(0.0, 0.0),
            )
          ],
        ),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                  (width > 1135 || width < 950)
                    ? Image.asset(widget.icon, height: height * 0.05)
                    : Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(widget.icon, height: height * 0.03),
                          SizedBox(width: width * 0.01),
                          LocalizedText(widget.title, style: AppText.b2b, textAlign: TextAlign.center),
                        ],
                      ),
                if (width > 1135 || width < 950) ...[
                  SizedBox(height: height * 0.02),
                  LocalizedText(widget.title, style: AppText.b2b, textAlign: TextAlign.center),
                ],
                SizedBox(height: height * 0.01),
                LocalizedText(widget.description, textAlign: TextAlign.center),
                SizedBox(height: height * 0.01),
              ],
            ),
            AnimatedOpacity(
              duration: const Duration(milliseconds: 400),
              opacity: _isHover ? 0.0 : 1.0,
              child: context.isDesktop
                  ? Container(
                      color: appProvider.isDark ? Colors.grey[900] : Colors.white,
                      height: double.infinity,
                      width: double.infinity,
                      alignment: Alignment.center,
                      child: Image.asset(widget.icon, fit: BoxFit.cover),
                    )
                  : const SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }
}
