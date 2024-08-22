import 'package:excise_e_auction/controllers/custom_widget_controllers/custom_bottom_nav_bar_controller.dart';
import 'package:excise_e_auction/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class CustomBottomNavBar extends GetView<CustomBottomNavBarController> {
  const CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
          height: Get.height * 0.08,
          padding: const EdgeInsets.symmetric(horizontal: 14.0),
          decoration: const BoxDecoration(color: kPrimaryDarkColor, boxShadow: [
            BoxShadow(
              color: kBlackColor,
              offset: Offset(1, 1),
              blurRadius: 2,
            )
          ]),
          child: GNav(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              style: GnavStyle.google,
              tabBorderRadius: 30,
              selectedIndex: CustomBottomNavBarController.selectedIndex.value,
              onTabChange: controller.onItemSelect,
              curve: Curves.bounceIn,
              duration: const Duration(milliseconds: 100),
              gap: 3,
              color: kGreyColor,
              activeColor: kPrimaryColor,
              iconSize: 24,
              tabBackgroundColor: kCardColor,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              tabs: const [
                GButton(
                  icon: Icons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.call,
                  text: 'Call',
                ),
                GButton(
                  icon: Icons.location_on_outlined,
                  text: 'Location',
                ),
              ]),
        ));
  }
}
