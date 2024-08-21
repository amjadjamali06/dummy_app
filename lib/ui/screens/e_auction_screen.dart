import 'package:excise_e_auction/controllers/e_auction_screen_controller.dart';
import 'package:excise_e_auction/ui/custom_widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../custom_widgets/custom_dashboard_card_widget.dart';

class EAuctionScreen extends GetView<EAuctionScreenController> {
  const EAuctionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        className: runtimeType.toString(),
        screenName: "E-Auction",
        scaffoldKey: controller.scaffoldKey,
        body: _buildBodyNewTheme(),
      horizontalPadding: 8,

    );
  }

  Widget _buildBodyNewTheme() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 100),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomDashboardCardWidget(
                  title: "Place A Bid",
                  iconPath: 'assets/icons/big.png',
                  onTap: () {},
                ),
                CustomDashboardCardWidget(
                  title: "Request History",
                  iconPath: 'assets/icons/icon-5.png',
                  onTap: () {},
            ),
          ]),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomDashboardCardWidget(
                  title: "Auction\n Request",
                  iconPath: 'assets/icons/online-payment 1.png',
                  onTap: () {}),
              CustomDashboardCardWidget(
                  title: "Tag Winning\n Number",
                  iconPath: 'assets/icons/winner-badge.png',
                  onTap: () {}),
            ],
          ),
          SizedBox(height: Get.height * 0.1),
        ],
      ),
    );
  }

  Widget _buildBodyOldTheme() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Stack(
              children: [
                SizedBox(
                  width: Get.width,
                  height: Get.width * 0.55,
                  child: Image.asset(
                    'assets/icons/e-auction-background.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  left: Get.width * 0.125,
                  top: Get.width * 0,
                  child: SizedBox(
                    width: Get.width * 0.75,
                    height: Get.width * 0.55,
                    child: Image.asset(
                      'assets/icons/e-auction_number-plate.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          const Text("E-Auction",
              style: TextStyle(
                  color: Color(0xff231F20),
                  fontSize: 24,
                  fontWeight: FontWeight.w400)),
          const SizedBox(height: 10),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomDashboardCardWidget(
                  title: "Place A Bid",
                  iconPath: 'assets/icons/big.png',
                  onTap: () {},
                ),
                CustomDashboardCardWidget(
                  title: "Request History",
                  iconPath: 'assets/icons/icon-5.png',
                  onTap: () {},
                ),
              ]),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomDashboardCardWidget(
                  title: "Auction\n Request",
                  iconPath: 'assets/icons/online-payment 1.png',
                  onTap: () {}),
              CustomDashboardCardWidget(
                  title: "Tag Winning\n Number",
                  iconPath: 'assets/icons/winner-badge.png',
                  onTap: () {}),
            ],
          ),
          SizedBox(height: Get.height * 0.1),
        ],
      ),
    );
  }
}
