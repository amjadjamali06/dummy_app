import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../controllers/custom_widget_controllers/custom_end_drawer_controller.dart';
import '../../utils/app_colors.dart';
import '../../utils/user_session.dart';

class CustomEndDrawer extends GetView<CustomEndDrawerController> {
  const CustomEndDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        elevation: 5,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(36))),
        backgroundColor: kPrimaryDarkColor.withAlpha(220),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(right: 15, left: 18, top: 30, bottom: 30),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Center(
                    child: GestureDetector(
                      onTap: () => {},
                      child: Container(
                        width: 72,
                        height: 72,
                        padding: const EdgeInsets.all(6),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border.all(color: kWhiteColor),
                          borderRadius: BorderRadius.circular(60),
                          boxShadow: const [
                            BoxShadow(
                                color: Color(0x44444444),
                                blurRadius: 1.5,
                                spreadRadius: 1.5)
                          ],
                        ),
                        child: const Icon(Icons.person, color: kWhiteColor, size: 60,)
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Obx(() => Text(
                    UserSession.userModel.value.name,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: kWhiteColor
                    ),
                  ),),
                ],
              ),
            ),

            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.only( top: 30, bottom: 20),
                decoration: const BoxDecoration(
                  color: kWhiteColor,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(36), topRight: Radius.circular(36)),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    _getDrawerNavItem(
                        title: "Online Tax Payment", icon: 'assets/icons/online-tax-payment.png', color: kGreyColor),
                    const Divider(indent: 54),
                    _getDrawerNavItem(
                        title: "Vehicle Verification", icon: 'assets/icons/vehicle-verification.png', color: kGreyColor),
                    const Divider(indent: 54),
                    _getDrawerNavItem(
                        title: "Tax Calculator", icon: 'assets/icons/tax-calculator.png', color: kGreyColor),
                    const Divider(indent: 54),
                    _getDrawerNavItem(
                        title: "Search History", icon: 'assets/icons/search-history.png', color: kGreyColor),
                    const Divider(indent: 54),
                    _getDrawerNavItem(
                        title: "Auction", icon: 'assets/icons/online-payment 2.png', color: kGreyColor),
                    const Divider(indent: 54),
                    const Spacer(),
                    const Divider(thickness: 1,),
                    _getDrawerNavItem(title: "Logout", icon: 'assets/icons/logout.png', color: kRejectedColor),
                  ],),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getDrawerNavItem(
      {required String title, required String icon, Color color = kPrimaryDarkColor}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      padding: const EdgeInsets.only(bottom: 2),
      child: GestureDetector(
        onTap: (){
          controller.onTap(title);
        },
        child: Row(
          children: [
            Image.asset(icon, width: title == "Logout" ?30 : 50 ,),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Text(
                title.toUpperCase(),
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: kTextColor,
                  fontSize: title == "Logout" ? 14 : 16,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }



}