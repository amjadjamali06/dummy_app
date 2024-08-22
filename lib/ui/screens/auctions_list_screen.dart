import 'package:excise_e_auction/controllers/auctions_list_screen_controller.dart';
import 'package:excise_e_auction/ui/custom_widgets/custom_scaffold.dart';
import 'package:excise_e_auction/utils/app_colors.dart';
import 'package:excise_e_auction/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
class AuctionsListScreen extends GetView<AuctionsListScreenController> {
  const AuctionsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      className: runtimeType.toString(),
      screenName: "View Auctions",
      scaffoldKey: controller.scaffoldKey,
      // horizontalPadding: 12,
      horizontalPadding: 0,
      body: Obx(
        () => ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
          shrinkWrap: true,
          itemCount: controller.auctionsList.length,
          itemBuilder: (context, index) {
            final auction = controller.auctionsList[index];
            return AuctionCard(
              onTap: (){ Get.toNamed(kAuctionDetailScreenRoute, arguments:controller.auctionsList[index]);},
              numberPlat: auction.numberPlat,
              bidType: auction.bidType,
              startDate: auction.startDate,
              endDate: auction.endDate,
              bidStartAmount: auction.bidStartAmount,
              bidEndAmount: auction.bidEndAmount,
            );
          },
        ),
      ),
    );
  }
}

class AuctionCard extends StatelessWidget {
  final String numberPlat;
  final String bidType;
  final String startDate;
  final String endDate;
  final String bidStartAmount;
  final String bidEndAmount;
  final void Function() onTap;
  const AuctionCard({
    super.key,
    required this.numberPlat,
    required this.bidType,
    required this.startDate,
    required this.endDate,
    required this.bidStartAmount,
    required this.bidEndAmount,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    final numberPlatColor = bidType == "gold"
        ? const Color(0xff653d00)
        : bidType == "silver"
            ? const Color(0xff3b3b3b)
            : const Color(0xff478321);
    String imageUrl = bidType == "gold"
        ? "assets/images/gold.png"
        : bidType == "silver"
            ? "assets/images/silver.png"
            : "assets/images/platinum.png";
    return GestureDetector(
      onTap:onTap,
      child: Container(
        height: Get.height * 0.17,
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        decoration: BoxDecoration(
          color: kCardColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(24),
            bottomRight: Radius.circular(24),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade500,
              offset: const Offset(0, 1),
              spreadRadius: 1,
              blurRadius: 2,
            )
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: Get.width * 0.22,
              height: Get.height * 0.16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: Get.height * 0.05,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: numberPlatColor,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8),
                      ),
                    ),
                    child: Text(
                      numberPlat,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Container(
                    height: Get.height * 0.05,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(imageUrl),
                        fit: BoxFit.fill,
                      ),
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(8),
                        bottomRight: Radius.circular(8),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        bidType.toUpperCase(),
                        style: const TextStyle(
                          letterSpacing: 0.01,
                          color: kBlackColor,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Bid Start Time',
                              style: TextStyle(
                                letterSpacing: 0,
                                fontSize: 10,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              startDate,
                              style: const TextStyle(
                                fontSize: 12.0,
                                letterSpacing: 0,
                                fontWeight: FontWeight.w600,
                                color: kWhiteColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Bid End Time',
                              style: TextStyle(
                                letterSpacing: 0,
                                fontSize: 10,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              endDate,
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 12.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Divider(thickness: 0.4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Starting Bid Amount',
                              style: TextStyle(
                                letterSpacing: 0,
                                fontSize: 10,
                              ),
                            ),
                            Text(
                              "Rs.$bidStartAmount",
                              style: const TextStyle(
                                fontSize: 18,
                                letterSpacing: 0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Current Highest Bid',
                              style: TextStyle(
                                letterSpacing: 0,
                                fontSize: 10,
                              ),
                            ),
                            Text(
                              "Rs.$bidEndAmount",
                              style: const TextStyle(
                                fontSize: 18,
                                letterSpacing: 0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      )
    );
  }
}