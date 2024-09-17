import 'package:flutter/material.dart';
import 'package:folio/models/contact_item.dart';
import 'package:folio/models/project_item.dart';

final kTools = [
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

const projectItems = [
  ProjectItem(
      banner: 'assets/projects/snackbar.png',
      icon: 'assets/projects/flutter.png',
      titleKey: 'project_title_01',
      descriptionKey: 'project_description_01',
      githubLink: 'https://pub.dev/packages/awesome_snackbar_content'),
  ProjectItem(
      banner: 'assets/projects/quranB.png',
      icon: 'assets/projects/quran.png',
      titleKey: 'project_title_02',
      descriptionKey: 'project_description_02',
      githubLink: 'https://github.com/mhmzdev/The_Holy_Quran_App'),
  ProjectItem(
      banner: 'assets/projects/medkitB.png',
      icon: 'assets/projects/medkit.png',
      titleKey: 'project_title_03',
      descriptionKey: 'project_description_03',
      githubLink: 'https://github.com/mhmzdev/MedKit-Pharmacy-App-Using-Flutter'),
  ProjectItem(
      banner: 'assets/projects/hereiamB.png',
      icon: 'assets/projects/hereiam.png',
      titleKey: 'project_title_04',
      descriptionKey: 'project_description_04',
      githubLink: 'https://github.com/mhmzdev/Here-I-Am-Alert-App'),
  ProjectItem(
      banner: 'assets/projects/covidB.png',
      icon: 'assets/projects/covid.png',
      titleKey: 'project_title_05',
      descriptionKey: 'project_description_05',
      githubLink: 'https://github.com/mhmzdev/Covid19-Tracker-App'),
  ProjectItem(
      banner: null,
      icon: 'assets/projects/messenger.png',
      titleKey: 'project_title_06',
      descriptionKey: 'project_description_06',
      githubLink: 'https://github.com/mhmzdev/Messenger-Chat-Head-Flutter-UI'),
  ProjectItem(
      banner: null,
      icon: 'assets/projects/flutter.png',
      titleKey: 'project_title_07',
      descriptionKey: 'project_description_07',
      githubLink: 'https://github.com/mhmzdev/flutter.dev-Flutter-Web-Clone'),
  ProjectItem(
      banner: null,
      icon: 'assets/projects/earbender.png',
      titleKey: 'project_title_08',
      descriptionKey: 'project_description_08',
      githubLink: 'https://github.com/mhmzdev/Earbender_Music_App'),
  ProjectItem(
      banner: null,
      icon: 'assets/projects/java.png',
      titleKey: 'project_title_09',
      descriptionKey: 'project_description_09',
      githubLink: 'https://github.com/mhmzdev/FTP_GUI_Java'),
  ProjectItem(
      banner: null,
      icon: 'assets/projects/android.png',
      titleKey: 'project_title_10',
      descriptionKey: 'project_description_10',
      githubLink: 'https://github.com/mhmzdev/My-Order-Resturant-Ordering-System'),
  ProjectItem(
      banner: null,
      icon: 'assets/services/open_b.png',
      titleKey: 'project_title_11',
      descriptionKey: 'project_description_11',
      githubLink: 'https://github.com/mhmzdev/Hidev_Web'),
];
