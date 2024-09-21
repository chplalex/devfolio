import 'package:flutter/material.dart';
import 'package:folio/app/app_constants.dart';
import 'package:folio/widget/localized_text.dart';
import 'package:provider/provider.dart';

import '../../../app/app_theme.dart';
import '../../../app/app_typography.dart';
import '../../../provider/app_provider.dart';
import '../../../provider/scroll_provider.dart';
import '../../../utils/utils.dart';
import '../../../widget/nav_bar_logo.dart';

class MobileDrawer extends StatelessWidget {
  const MobileDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context);
    final scrollProvider = Provider.of<ScrollProvider>(context);

    return Drawer(
      child: Material(
        color: appProvider.isDark ? Colors.grey[900] : Colors.white,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 25.0, 0, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(child: NavBarLogo()),
              const Divider(),
              ListTile(
                leading: Icon(Icons.light_mode, color: AppTheme.c!.primary!),
                title: const LocalizedText("dark_mode_label"),
                trailing: Switch(
                  inactiveTrackColor: Colors.grey,
                  value: appProvider.isDark,
                  onChanged: (value) => appProvider.setTheme(value ? ThemeMode.dark : ThemeMode.light),
                  activeColor: AppTheme.c!.primary,
                ),
              ),
              const Divider(),
              ...drawerItems.asMap().entries.map(
                    (entry) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: MaterialButton(
                        hoverColor: AppTheme.c!.primary!.withAlpha(70),
                        onPressed: () {
                          scrollProvider.scrollMobile(entry.key);
                          Navigator.pop(context);
                        },
                        child: ListTile(
                          leading: Icon(entry.value.iconData, color: AppTheme.c!.primary),
                          title: LocalizedText(entry.value.nameKey, style: AppText.l1),
                        ),
                      ),
                    ),
                  ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: MaterialButton(
                  hoverColor: AppTheme.c!.primary!.withAlpha(150),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0), side: BorderSide(color: AppTheme.c!.primary!)),
                  onPressed: () => openURL(Sources.resume),
                  child: const ListTile(
                    leading: Icon(Icons.book, color: Colors.red),
                    title: LocalizedText('resume_label'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
