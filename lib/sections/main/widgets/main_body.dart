import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../../provider/scroll_provider.dart';
import '../../../widget/footer.dart';
import '../../about/about.dart';
import '../../contact/contact.dart';
import '../../home/home.dart';
import '../../portfolio/portfolio.dart';
import '../../services/services.dart';

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
        Services(),
        Portfolio(),
        Contact(),
        Footer(),
      ],
    );
  }
}

