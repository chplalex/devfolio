import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../../provider/scroll_provider.dart';
import '../../../widget/footer.dart';
import '../../about/about.dart';
import '../../contact/contact.dart';
import '../../home/home.dart';
import '../../projects/projects.dart';
import '../../skills/skills.dart';

class MainBody extends StatelessWidget {
  const MainBody({super.key});

  @override
  Widget build(BuildContext context) {
    final scrollProvider = Provider.of<ScrollProvider>(context);

    return ListView(
      controller: scrollProvider.controller,
      children: const [
        Home(),
        About(),
        Skills(),
        Projects(),
        Contacts(),
        Footer(),
      ],
    );
  }
}

