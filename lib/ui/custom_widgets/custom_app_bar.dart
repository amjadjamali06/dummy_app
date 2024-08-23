import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/platform/platform_io.dart';

import '../../controllers/custom_widget_controllers/custom_bottom_nav_bar_controller.dart';
import '../../utils/app_colors.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  final String screenName;
  final double appBarHeight;
  final PreferredSize? bottomSheet;
  final Function? onBackButtonPress;
  const CustomAppbar({
    super.key,
    required this.screenName,
    required this.scaffoldKey,
    required this.onBackButtonPress,
    required this.appBarHeight,
    this.bottomSheet,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
        toolbarHeight: 65,
        automaticallyImplyLeading: GeneralPlatform.isWeb,
        leadingWidth: 65,
        leading: screenName.isNotEmpty
            ? GestureDetector(
          onTap: () {
            CustomBottomNavBarController.selectedIndex.value = 0;
            if (onBackButtonPress != null) {
              onBackButtonPress!();
            } else {
              Get.back();
            }
          },
          child: Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.all(13),
            padding: const EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: kWhiteColor),
            child: const Icon(Icons.arrow_back_ios, color: kBlackColor),
          ),
        )
            : null,
        actions: [
          GestureDetector(
            child: Stack(
              children: [
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      border: Border.all(color: kWhiteColor),
                      borderRadius: BorderRadius.circular(50)),
                  child: const Icon(Icons.notifications, color: kWhiteColor,),
                ),
                Positioned(
                  right: 2,
                  top: 0,
                  child: Container(
                    height: 10,
                    width: 5,
                    decoration: const BoxDecoration(
                        color: kRejectedColor, shape: BoxShape.circle),
                  ),
                )
              ],
            ),
            onTap: () {},
          ),
          GestureDetector(
            child: Container(
              width: 35,
              height: 35,
              margin: const EdgeInsets.only(right: 10, top: 0, left: 10),
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  border: Border.all(color: kWhiteColor),
                  borderRadius: BorderRadius.circular(50)),
              child: Image.asset(
                'assets/icons/menu-new.png',
                color: kWhiteColor,
              ),
            ),
            onTap: () {
              scaffoldKey.currentState!.openEndDrawer();
              FocusScope.of(context).requestFocus(FocusNode());
            },
          ),
        ],
        titleSpacing: 0.0,
        title: Text(
          screenName,
          style: const TextStyle(
              fontSize: 20, fontWeight: FontWeight.w500, color: kWhiteColor),
        ),
        centerTitle: false,
        actionsIconTheme: const IconThemeData(),
        bottom: bottomSheet,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [kPrimaryDarkColor, kPrimaryLightColor],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
        ));
  }

  @override
  Size get preferredSize => Size.fromHeight(appBarHeight);
}
