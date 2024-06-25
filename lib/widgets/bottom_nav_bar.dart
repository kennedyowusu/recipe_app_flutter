import 'package:flutter/material.dart';
import 'package:recipe_app/constants/colors.dart';

class BottomNavBarWidget extends StatefulWidget {
  final int currentIndex;
  final Function ontap;

  const BottomNavBarWidget({
    super.key,
    required this.currentIndex,
    required this.ontap,
  });

  @override
  State<BottomNavBarWidget> createState() => _BottomNavBarWidgetState();
}

class _BottomNavBarWidgetState extends State<BottomNavBarWidget> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      elevation: 0,
      currentIndex: widget.currentIndex,
      iconSize: 20,
      selectedItemColor: ProjectColors.primaryColor,
      unselectedItemColor: Colors.blueGrey,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      type: BottomNavigationBarType.fixed,
      onTap: (value) {
        widget.ontap(value);
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(widget.currentIndex == 0 ? Icons.home : Icons.home),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon:
              Icon(widget.currentIndex == 1 ? Icons.bookmark : Icons.bookmark),
          label: "saved",
        ),
        BottomNavigationBarItem(
          icon: Icon(widget.currentIndex == 4 ? Icons.person : Icons.person),
          label: "profile",
        ),
      ],
    );
  }
}
