import 'package:flutter/material.dart';

class ProjectDivider extends StatelessWidget {
  const ProjectDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Divider(
      color: Colors.grey,
      thickness: 0.5,
      endIndent: 5,
      indent: 5,
    );
  }
}
