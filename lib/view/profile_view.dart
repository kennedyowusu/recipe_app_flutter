import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/widgets/background_tile.dart';
import 'package:recipe_app/widgets/divider.dart';
import 'package:recipe_app/widgets/profile_appbar.dart';
import 'package:recipe_app/widgets/profile_sub.dart';
import 'package:recipe_app/widgets/profile_top.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final List<StaggeredGridTile> items = List.generate(8, (index) {
    return StaggeredGridTile.count(
      crossAxisCellCount: (index % 4 == 0) ? 2 : 1,
      mainAxisCellCount: (index % 3 == 0) ? 1 : 2,
      child: const ImageWidget(),
    );
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ProfileTop(),
              const SizedBox(height: 10),
              const ProfileSub(),
              const SizedBox(height: 15),
              const ProjectDivider(),
              const Center(
                child: Text(
                  "My Recipes",
                  style: TextStyle(
                    color: CupertinoColors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const ProjectDivider(),
              const SizedBox(height: 15),
              buildStaggeredGrid(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildStaggeredGrid() {
    return StaggeredGrid.count(
      crossAxisCount: 4,
      mainAxisSpacing: 4,
      crossAxisSpacing: 4,
      children: items.map((e) => e.child).toList(),
    );
  }
}
