import 'package:flutter/material.dart';
import 'package:folio/models/contact_item.dart';
import 'package:folio/models/drawer_item.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../models/skill_item.dart';
import '../models/social_item.dart';

final techTools = [
  "Flutter",
  "Dart",
  "Android SDK",
  "Kotlin",
  "Java",
];

const contactItems = [
  ContactItem(iconData: Icons.home, titleKey: 'place_label', descriptionKey: 'place'),
  ContactItem(iconData: Icons.phone, titleKey: 'phone_label', descriptionKey: 'phone'),
  ContactItem(iconData: Icons.mail, titleKey: 'email_label', descriptionKey: 'email'),
];

const _skillsData = [
  (icon: "assets/skills/flutter_icon.svg", descriptionsCount: 4),
  (icon: "assets/skills/android_icon.svg", descriptionsCount: 5),
  (icon: "assets/skills/ci_cd_icon.svg", descriptionsCount: 2),
  (icon: "assets/skills/other_skills_icon.svg", descriptionsCount: 4),
];

final skillItems = List.generate(
  _skillsData.length,
  (indexService) {
    final serviceData = _skillsData[indexService];
    final descriptionKeys = List.generate(
      serviceData.descriptionsCount,
      (indexDescription) => 'skill_${indexService}_description_$indexDescription',
      growable: false,
    );
    return SkillItem(
      icon: serviceData.icon,
      titleKey: 'skill_${indexService}_title',
      descriptionKeys: descriptionKeys,
    );
  },
  growable: false,
);

class Contacts {
  static const email = 'mailto:alex.elpern@gmail.com';
  static const whatsapp = 'https://api.whatsapp.com/send?phone=9728258017';
  static const telegram = 'https://t.me/chepel_alexander';
}

const _drawerData = [
  (nameKey: 'section_name_home', iconData: Icons.home),
  (nameKey: 'section_name_about', iconData: Icons.person),
  (nameKey: 'section_name_services', iconData: Icons.work),
  (nameKey: 'section_name_projects', iconData: Icons.build),
  (nameKey: 'section_name_contact', iconData: Icons.contact_page),
];

final drawerItems = List.generate(
  _drawerData.length,
  (index) {
    final item = _drawerData[index];
    return DrawerItem(nameKey: item.nameKey, iconData: item.iconData);
  },
  growable: false,
);

class Sources {
  static const gitHub = 'https://github.com/chplalex';
  static const gitHubDevFolio = 'https://github.com/chplalex/devfolio';
  static const resume = 'https://drive.google.com/file/d/1Ycw9YNnAFpIo3ewou42SZZnFqW8h436z/view?usp=sharing';
}

const _socialData = [
  (iconData: FontAwesomeIcons.linkedin, url: 'https://www.linkedin.com/in/alex-elpern/'),
  (iconData: FontAwesomeIcons.github, url: 'https://github.com/chplalex'),
];

final socialItems = _socialData
    .map((data) => SocialItem(
          iconData: data.iconData,
          url: data.url,
        ))
    .toList(growable: false);

class StaticUtils {
  static const String hi = 'assets/hi.gif';

  // photos
  static const String mobilePhoto = 'assets/photos/mobile.png';
  static const String coloredPhoto = 'assets/photos/colored.png';
  static const String blackWhitePhoto = 'assets/photos/black-white.png';

  // work
  static const String dsc = 'assets/work/dsc.png';
  static const String sastaTicket = 'assets/work/st.png';
  static const String university = 'assets/work/cui.png';
  static const String flutterIsb = 'assets/work/flutterIsl.png';
}
