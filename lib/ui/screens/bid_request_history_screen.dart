import 'dart:developer';

import 'package:excise_e_auction/controllers/auctions_list_screen_controller.dart';
import 'package:excise_e_auction/controllers/bid_request_history_screen_controller.dart';
import 'package:excise_e_auction/controllers/premium_number_screen_controller.dart';
import 'package:excise_e_auction/ui/custom_widgets/custom_scaffold.dart';
import 'package:excise_e_auction/utils/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
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
      screenName: "Premium Number",
      scaffoldKey: controller.scaffoldKey,
      horizontalPadding: 0,
      body: Obx(
        () => ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
          shrinkWrap: true,
          itemCount: controller.bidHistory.length,
          itemBuilder: (context, index) {
            final auction = controller.bidHistory[index];
            return BidHistoryCard(
              onTap:(){},
              bidderName: auction.bidderName,
              bidType: auction.bidType,
              date: auction.date,
              status: auction.status,
           );
          },
        ),
      ),
    );
  }
}

class BidHistoryCard extends StatelessWidget {
  final String bidderName;
  final String bidType;
  final String date;
  final String status;
  final void Function() onTap;
  const BidHistoryCard({
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
                blurRadius: 1,
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
                      style: const TextStyle(fontSize: 11),
                    ),
                  ],
                ),
              ),
              Expanded(
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