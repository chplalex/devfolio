import 'package:flutter/material.dart';

import '../utils/utils.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.fromLTRB(0, height * 0.05, 0, 0),
      height: height * 0.07,
      width: width,
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("Developed in 💙 with "),
            InkWell(
              onTap: () => openURL("https://github.com/mhmzdev/DevFolio"),
              child: const Text("Flutter", style: TextStyle(color: Colors.blue)),
            )
          ],
        ),
      ),
    );
  }
}
