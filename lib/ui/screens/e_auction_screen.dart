import 'package:excise_e_auction/controllers/e_auction_screen_controller.dart';
import 'package:excise_e_auction/ui/custom_widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intrinsic_grid_view/intrinsic_grid_view.dart';
import '../custom_widgets/custom_dashboard_card_widget.dart';

class EAuctionScreen extends GetView<EAuctionScreenController> {
  const EAuctionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        className: runtimeType.toString(),
        screenName: "Auction",
        scaffoldKey: controller.scaffoldKey,
        body: _buildBodyOldTheme(),
      horizontalPadding: 0,

    );
  }

  Widget _buildBodyNewTheme() {
    return IntrinsicGridView.vertical(
      columnCount: 2,
      horizontalSpace: 20,
      verticalSpace: 20,
      margin: const EdgeInsets.only(top: 100),
      children: [
        CustomDashboardCardWidget(
          title: "Place A Bid",
          iconPath: 'assets/icons/big.png',
          onTap: controller.onTapItem,
        ),
        CustomDashboardCardWidget(
          title: "Request History",
          iconPath: 'assets/icons/icon-5.png',
          onTap: controller.onTapItem,
        ),
        CustomDashboardCardWidget(
          title: "Auction\nRequest",
          iconPath: 'assets/icons/online-payment 1.png',
          onTap: controller.onTapItem,
        ),
        // const SizedBox(width: 24),
        CustomDashboardCardWidget(
          title: "Tag Winning Number",
          iconPath: 'assets/icons/winner-badge.png',
          onTap: controller.onTapItem,
        ),
      ],);
  }

  Widget _buildBodyOldTheme() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child:  Image.asset(
            'assets/images/auction-banner.png',
            fit: BoxFit.cover,
          ),
        ),
        IntrinsicGridView.vertical(
            columnCount: 2,
            horizontalSpace: 20,
            verticalSpace: 20,
            margin: const EdgeInsets.only(top: 30),
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomDashboardCardWidget(
                title: "Place\nBid",
                iconPath: 'assets/icons/big.png',
                onTap: controller.onTapItem,
              ),
              CustomDashboardCardWidget(
                title: "Request\nHistory",
                iconPath: 'assets/icons/icon-5.png',
                onTap: controller.onTapItem,
              ),
            ]),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CustomDashboardCardWidget(
                title: "Auction\n Request",
                iconPath: 'assets/icons/online-payment 1.png',
              onTap: controller.onTapItem,
            ),
            CustomDashboardCardWidget(
                title: "Tag Winning\n Number",
                iconPath: 'assets/icons/winner-badge.png',
              onTap: controller.onTapItem,
            ),
          ],
        ),
        SizedBox(height: Get.height * 0.1),
      ],
    );
  }
}
