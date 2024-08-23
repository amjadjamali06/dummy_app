import 'package:excise_e_auction/controllers/bid_request_history_screen_controller.dart';
import 'package:excise_e_auction/models/auction_bid_model.dart';
import 'package:excise_e_auction/ui/custom_widgets/custom_scaffold.dart';
import 'package:excise_e_auction/utils/app_colors.dart';
import 'package:excise_e_auction/utils/string_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/auction_request_model.dart';
import '../custom_widgets/tab_bar_widget.dart';
enum BidStatus {
  pending,
  accepted,
  rejected
}
class BidRequestHistoryScreen extends GetView<BidRequestHistoryScreenController> {
  const BidRequestHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      className: runtimeType.toString(),
      screenName: "Request History",
      scaffoldKey: controller.scaffoldKey,
      horizontalPadding: 0,
      appBarHeight: Get.height * 0.16,
      bottomSheet: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: Obx(
          () => Padding(
          padding: const EdgeInsets.symmetric(horizontal:8.0),
            child: Row(
              children: [
                Expanded(
                  child: TabBarCard(
                    onTap: (){
                      controller.onTabIndexChanged(0);
                    },
                    title: "My Requests",
                    isSelected: controller.selectedTabIndex.value == 0,
                  ),
                ),
                Expanded(
                  child: TabBarCard(
                    onTap: (){
                      controller.onTabIndexChanged(1);
                    },
                    title: "My Bids",
                    isSelected: controller.selectedTabIndex.value == 1
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      body: Obx((){
        if(controller.selectedTabIndex.value == 0) {
          return MyRequestsWidget(bidHistory: controller.myRequests);
        } else {
          return MyBidsWidget(bidHistory: controller.bidHistory);
        }
      }),
    );
  }
}

class MyBidsWidget extends StatelessWidget {
  final List<AuctionBidModel> bidHistory;
  const MyBidsWidget({super.key, required this.bidHistory});

  @override
  Widget build(BuildContext context) {
    return Obx(()=> ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        itemCount: bidHistory.length,
        itemBuilder: (context, index) {
          final auction = bidHistory[index];
          return BidHistoryCard(
            onTap:(){},
            bidderName: auction.nbrPlate,
            bidType: auction.plateCategory,
            date: auction.bidDate,
            amount: auction.bidAmount,
          );
        },
      ),
    );
  }
}

class MyRequestsWidget extends StatelessWidget {
  final List<AuctionRequestModel> bidHistory;
  const MyRequestsWidget({super.key, required this.bidHistory});

  @override
  Widget build(BuildContext context) {
    return Obx(()=> ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        shrinkWrap: true,
        itemCount: bidHistory.length,
        itemBuilder: (context, index) {
          final auction = bidHistory[index];
          return MyBidRequestCard(
            onTap:(){},
            bidderName: auction.numberPlate,
            bidType: auction.bidType,
            date: auction.date,
            status: auction.status,
          );
        },
      ),
    );
  }
}

class BidHistoryCard extends StatelessWidget {
  final String bidderName;
  final String bidType;
  final String date;
  final String amount;
  final void Function() onTap;
  const BidHistoryCard({
    super.key,
    required this.bidderName,
    required this.bidType,
    required this.date,
    required this.amount,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    final height = Get.height;
    final width = Get.width;
    String imageUrl = bidType == "gold"
        ? "assets/images/gold.png"
        : bidType == "silver"
            ? "assets/images/silver.png"
            : "assets/images/platinum.png";
    return GestureDetector(
        onTap:onTap,
        child: Container(
          height: height * 0.10,
          margin: const EdgeInsets.symmetric(vertical: 8),
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: kWhiteColor,
            borderRadius: BorderRadius.circular(12),
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
                width: width * 0.24,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: height * 0.024,
                      width: width * 0.18,
                      margin: const EdgeInsets.only(bottom: 2),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(imageUrl),
                          fit: BoxFit.fill,
                        ),
                        borderRadius: BorderRadius.circular(1),
                      ),
                    ),
                    Text(
                      bidType.toUpperCase(),
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      bidderName,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      date,
                      style: const TextStyle(fontSize: 11, color: kGreyColor),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      amount.toAmount,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        color: kPrimaryDarkColor,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      "Bid Amount",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: kGreyColor,
                        fontSize: 12,
                      ),
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

class MyBidRequestCard extends StatelessWidget {
  final String bidderName;
  final String bidType;
  final String date;
  final String status;
  final void Function() onTap;
  const MyBidRequestCard({
    super.key,
    required this.bidderName,
    required this.bidType,
    required this.date,
    required this.status,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    final height = Get.height;
    final width = Get.width;
    String imageUrl = bidType == "gold"
        ? "assets/images/gold.png"
        : bidType == "silver"
        ? "assets/images/silver.png"
        : "assets/images/platinum.png";
    final statusColor = status == "approved"
        ? Colors.green
        : status == "pending"
        ? Colors.yellow
        : Colors.red;
    IconData statusIcon = status == "approved"
        ? Icons.check_circle_outline
        : status == "pending"
        ? Icons.pending_outlined
        : CupertinoIcons.multiply_circle;
    return GestureDetector(
        onTap:onTap,
        child: Container(
          height: height * 0.10,
          margin: const EdgeInsets.symmetric(vertical: 8),
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: kWhiteColor,
            borderRadius: BorderRadius.circular(12),
            boxShadow: const [
              BoxShadow(
                color: kCardShadowColor,
                offset: Offset(0, 1),
                spreadRadius: 1,
                blurRadius: 2,
              )
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: width * 0.24,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: height * 0.024,
                      width: width * 0.18,
                      margin: const EdgeInsets.only(bottom: 2),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(imageUrl),
                          fit: BoxFit.fill,
                        ),
                        borderRadius: BorderRadius.circular(1),
                      ),
                    ),
                    Text(
                      bidType.toUpperCase(),
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                flex: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      bidderName,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      date,
                      style: const TextStyle(fontSize: 11),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(statusIcon,color: statusColor),
                    const SizedBox(height: 4),
                    Text(
                      status.capitalizeFirst.toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: statusColor,
                        fontSize: 12,
                      ),
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



