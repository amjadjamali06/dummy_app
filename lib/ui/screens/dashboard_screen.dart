import 'package:excise_e_auction/ui/custom_widgets/custom_dashboard_card_widget.dart';
import 'package:excise_e_auction/ui/custom_widgets/custom_scaffold.dart';
import 'package:excise_e_auction/utils/user_session.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:excise_e_auction/controllers/dashboard_screen_controller.dart';
import 'package:excise_e_auction/utils/app_colors.dart';

class DashboardScreen extends GetView<DashboardScreenController> {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        className: runtimeType.toString(),
        screenName: "Dashboard Screen",
        scaffoldKey: controller.scaffoldKey,
        body: _buildBodyNewTheme(),
      horizontalPadding: 24,
    );
  }
Widget  _buildBodyNewTheme() {
    return Container(
      color: kPrimaryDarkColor,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Padding(
            padding: EdgeInsets.only(top: Get.height*0.06),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  RichText(
                    text: TextSpan(
                        text: 'Welcome, ',
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w300
                        ),
                        children: [
                          TextSpan(
                              text: UserSession.userModel.value.name,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                color: kPrimaryColor
                              )
                          )
                        ]
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomDashboardCardWidget(title: "Online\n Tax Payment", iconPath: 'assets/icons/online-tax-payment.png', onTap: controller.onTapItem),
                      // const SizedBox(width: 24),
                      CustomDashboardCardWidget(title: "Vehicle\n Verification",iconPath: 'assets/icons/vehicle-verification.png', onTap: controller.onTapItem,),
                    ],
                  ),
                  const SizedBox(height: 18),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomDashboardCardWidget(title: "Tax\n Calculator",iconPath: 'assets/icons/tax-calculator.png', onTap: controller.onTapItem),
                      // const SizedBox(width: 24),
                      CustomDashboardCardWidget(title: "Search\n History",iconPath: 'assets/icons/search-history.png', onTap: controller.onTapItem),
                    ],
                  ),
                  const SizedBox(height: 18),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: CustomDashboardCardWidget(title: "E-Auction",iconPath: 'assets/icons/online-payment 2.png', onTap: controller.onTapItem),
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     ,
                  //     const SizedBox(width: 24),
                  //     const SizedBox(width: 150),
                  //   ],
                  // ),
                  SizedBox(height: Get.height*0.1),
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }

  Widget  _buildBodyOldTheme() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Padding(
          padding: EdgeInsets.only(top: Get.height*0.1),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text("Home",style: TextStyle(color: Color(0xff231F20),fontSize: 24,fontWeight: FontWeight.w400)),
                const SizedBox(height: 20),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CustomDashboardCardWidget(title: "Online\n Tax Payment", iconPath: 'assets/icons/online-tax-payment.png', onTap: controller.onTapItem),
                      CustomDashboardCardWidget(title: "Vehicle\n Verification",iconPath: 'assets/icons/vehicle-verification.png', onTap: controller.onTapItem,),
                    ]
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomDashboardCardWidget(title: "Tax\n Calculator",iconPath: 'assets/icons/tax-calculator.png', onTap: controller.onTapItem),
                    CustomDashboardCardWidget(title: "Search\n History",iconPath: 'assets/icons/search-history.png', onTap: controller.onTapItem),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const SizedBox(width: 10),
                    CustomDashboardCardWidget(title: "E-Auction",iconPath: 'assets/icons/online-payment 2.png', onTap: controller.onTapItem),
                  ],
                ),
                SizedBox(height: Get.height*0.1),
              ],
            ),
          ),
        ),
        Positioned(
          top: -5,
          child: Container(
              height: Get.height*0.07,
              width: Get.width,
              padding: const EdgeInsets.only(bottom: 20),
              alignment: Alignment.bottomCenter,
              decoration: const BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
              ),
              child: RichText(
                text: TextSpan(
                    text: 'Welcome, ',
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w300
                    ),
                    children: [
                      TextSpan(
                          text: UserSession.userModel.value.name,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold
                          )
                      )
                    ]
                ),
              )
          ),
        )
      ],
    );
  }

}
