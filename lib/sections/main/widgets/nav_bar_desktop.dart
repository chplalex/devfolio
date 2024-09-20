import 'package:flutter/material.dart';
import 'package:folio/app/app_constants.dart';
import 'package:provider/provider.dart';
import 'package:universal_html/html.dart' as html;

import '../../../animations/entrance_fader.dart';
import '../../../app/app_theme.dart';
import '../../../app/app_typography.dart';
import '../../../app/space.dart';
import '../../../provider/app_provider.dart';
import '../../../utils/utils.dart';
import '../../../widget/localized_text.dart';
import '../../../widget/nav_bar_actions_button.dart';
import '../../../widget/nav_bar_logo.dart';

class NavBarDesktop extends StatelessWidget {
  const NavBarDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context);

    return Container(
      padding: Space.all(),
      color: appProvider.isDark ? Colors.black : Colors.white,
      child: Row(
        children: [
          const NavBarLogo(),
          Space.xm!,
          ...drawerItems.asMap().entries.map(
                (entry) => NavBarActionButton(labelKey: entry.value.nameKey, index: entry.key),
              ),
          EntranceFader(
            offset: const Offset(0, -10),
            delay: const Duration(milliseconds: 100),
            duration: const Duration(milliseconds: 250),
            child: MaterialButton(
              hoverColor: AppTheme.c!.primary!.withAlpha(150),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
                side: BorderSide(
                  color: AppTheme.c!.primary!,
                ),
              ),
              onPressed: () => html.window.open(StaticUtils.resume, "pdf"),
              child: Padding(
                padding: Space.all(1.25, 0.45),
                child: LocalizedText('resume_label', style: AppText.l1b),
              ),
            ),
          ),
          Space.x!,
          Switch(
            inactiveTrackColor: Colors.grey,
            value: appProvider.isDark,
            onChanged: (value) => appProvider.setTheme(!value ? ThemeMode.light : ThemeMode.dark),
            activeColor: AppTheme.c!.primary!,
          ),
          Space.x!,
        ],
      ),
    );
  }
}
