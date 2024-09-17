import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../app/app_dimensions.dart';
import '../../../app/space.dart';
import '../../../provider/drawer_provider.dart';
import '../../../widget/nav_bar_logo.dart';

class NavBarTablet extends StatelessWidget {
  const NavBarTablet({super.key});

  @override
  Widget build(BuildContext context) {
    final drawerProvider = Provider.of<DrawerProvider>(context);
    return Padding(
      padding: Space.v!,
      child: Row(
        children: [
          Space.x1!,
          IconButton(
            highlightColor: Colors.white54,
            splashRadius: AppDimensions.normalize(10),
            onPressed: () => drawerProvider.key.currentState!.openDrawer(),
            icon: const Icon(Icons.menu),
          ),
          Space.xm!,
          const NavBarLogo(),
          Space.x1!,
        ],
      ),
    );
  }
}
