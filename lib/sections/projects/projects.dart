import 'package:flutter/material.dart';
import 'package:folio/responsive/responsive.dart';
import 'package:provider/provider.dart';

import '../../data/app_repository.dart';
import '../../models/project_item.dart';
import 'projects_desktop.dart';
import 'projects_mobile.dart';

//ignore: must_be_immutable
class Projects extends StatelessWidget {
  Projects({super.key});

  Future<List<ProjectItem>>? _future;

  @override
  Widget build(BuildContext context) {
    _future ??= Provider.of<AppRepository>(context).getProjects();
    return FutureBuilder<List<ProjectItem>>(
        future: _future,
        builder: (context, snapshot) {
          return snapshot.hasData
              ? Responsive(
                  mobile: ProjectsMobile(projects: snapshot.data!),
                  tablet: ProjectsMobile(projects: snapshot.data!),
                  desktop: ProjectsDesktop(projects: snapshot.data!),
                )
              : const SizedBox.shrink();
        });
  }
}
