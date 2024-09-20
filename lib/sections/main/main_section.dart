import 'package:flutter/material.dart';
import 'package:folio/app/app_extensions.dart';
import 'package:folio/provider/drawer_provider.dart';
import 'package:folio/widget/arrow_on_top.dart';
import 'package:provider/provider.dart';

import '../../app/app.dart';
import 'widgets/body.dart';
import 'widgets/mobile_drawer.dart';
import 'widgets/nav_bar_desktop.dart';
import 'widgets/nav_bar_tablet.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    App.init(context);
    final drawerProvider = Provider.of<DrawerProvider>(context);

    return Scaffold(
      key: drawerProvider.key,
      extendBodyBehindAppBar: true,
      drawer: context.isDesktop ? null : const MobileDrawer(),
      body: SafeArea(
        child: Stack(
          children: [
            const Body(),
            const ArrowOnTop(),
            context.isDesktop ? const NavBarDesktop() : const NavBarTablet(),
          ],
        ),
      ),
    );
  }
}
