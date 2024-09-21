import 'package:flutter/material.dart';
import 'package:folio/animations/entrance_fader.dart';
import 'package:folio/provider/app_provider.dart';
import 'package:folio/provider/scroll_provider.dart';
import 'package:provider/provider.dart';

import '../app/app_dimensions.dart';
import '../app/app_theme.dart';

class ArrowOnTop extends StatefulWidget {
  const ArrowOnTop({super.key});

  @override
  ArrowOnTopState createState() => ArrowOnTopState();
}

class ArrowOnTopState extends State<ArrowOnTop> {
  var _isHover = false;

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context);
    final scrollProvider = Provider.of<ScrollProvider>(context);
    final size = MediaQuery.of(context).size;

    return Positioned(
      bottom: AppDimensions.normalize(30),
      right: -7,
      child: EntranceFader(
        offset: const Offset(0, 20),
        child: Padding(
          padding: EdgeInsets.only(top: size.height * 0.025),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                borderRadius: BorderRadius.circular(8.0),
                onTap: () => scrollProvider.scroll(0),
                onHover: (isHovering) => setState(() => _isHover = isHovering),
                child: Container(
                  decoration: BoxDecoration(
                    color: appProvider.isDark ? Colors.white : Colors.black,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8.0),
                      bottomLeft: Radius.circular(8.0),
                    ),
                    boxShadow: [
                      if (_isHover) const BoxShadow(blurRadius: 12.0, offset: Offset(2.0, 3.0)),
                    ],
                  ),
                  child: Icon(Icons.arrow_drop_up_outlined, color: AppTheme.c?.primary, size: size.height * 0.05),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
