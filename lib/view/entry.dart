import 'package:flutter/material.dart';
import 'package:recipe_app/view/home.dart';
import 'package:recipe_app/view/profile_view.dart';
import 'package:recipe_app/view/saved_view.dart';
import 'package:recipe_app/widgets/bottom_nav_bar.dart';

class ProjectEntry extends StatefulWidget {
  const ProjectEntry({super.key});

  @override
  State<ProjectEntry> createState() => _ProjectEntryState();
}

class _ProjectEntryState extends State<ProjectEntry> {
  int currentIndex = 0;
  List screens = [
    HomeView(),
    SavedRecipeView(),
    const ProfileView(),
  ];

  void changeIndex(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: screens[currentIndex],
      resizeToAvoidBottomInset: true,
      bottomNavigationBar: BottomNavBarWidget(
        currentIndex: currentIndex,
        ontap: changeIndex,
      ),
    );
  }
}
