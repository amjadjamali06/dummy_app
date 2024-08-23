import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/custom_widget_controllers/custom_bottom_nav_bar_controller.dart';
import '../../utils/app_colors.dart';

class CustomBottomNavBar extends GetView<CustomBottomNavBarController> {
  const CustomBottomNavBar({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(
          () => SafeArea(
        child: BottomNavigationBar(
          backgroundColor: const Color(0xffEFEFEF),
          currentIndex: CustomBottomNavBarController.selectedIndex.value,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedLabelStyle: const TextStyle(
            fontSize: 12,
          ),
          unselectedLabelStyle: const TextStyle(
            fontSize: 12,
          ),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home),
              label: "Home",
              activeIcon: Icon(CupertinoIcons.home),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.call),
              label: "Contact",
              activeIcon: Icon(Icons.call),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.location_on),
              label: "Location",
              activeIcon: Icon(Icons.location_on),
            ),
          ],
          onTap: (index) {
            controller.onItemSelect(index);
          },
          iconSize: 22.0,
          unselectedItemColor: kGreyColor,
          selectedItemColor: kGreyColor,
          type: BottomNavigationBarType.fixed,
        ),
      ),
    );
  }
}
