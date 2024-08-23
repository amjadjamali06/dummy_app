import 'package:excise_e_auction/controllers/auctions_list_screen_controller.dart';
import 'package:excise_e_auction/controllers/premium_number_screen_controller.dart';
import 'package:excise_e_auction/ui/custom_widgets/custom_scaffold.dart';
import 'package:excise_e_auction/utils/app_colors.dart';
import 'package:excise_e_auction/utils/string_utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class PremiumNumberListScreen extends GetView<PremiumNumberListScreenController> {
  const PremiumNumberListScreen({super.key});

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
          itemCount: controller.auctionsList.length,
          itemBuilder: (context, index) {
            final auction = controller.auctionsList[index];
            return PremiumNumberCard(
              onTap:()=>controller.onTapItem(auction),
              numberPlat: auction.numberPlat,
              bidType: auction.bidType,
              date: auction.date,
              purchasePrice: auction.purchasePrice,
           );
          },
        ),
      ),
    );
  }
}

class PremiumNumberCard extends StatelessWidget {
  final String numberPlat;
  final String bidType;
  final String date;
  final String purchasePrice;
  final void Function() onTap;
  const PremiumNumberCard({
    super.key,
    required this.numberPlat,
    required this.bidType,
    required this.date,
    required this.purchasePrice,
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
          height: Get.height * 0.12,
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
                width: Get.width * 0.22,
                height: Get.height * 0.10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: Get.height * 0.04,
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
                      height: Get.height * 0.04,
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
                                'Purchase Price',
                                style: TextStyle(
                                  letterSpacing: 0,
                                  fontSize: 11,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                purchasePrice.toAmount,
                                style: const TextStyle(
                                  fontSize: 14,
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
                                'Date',
                                style: TextStyle(
                                  letterSpacing: 0,
                                  fontSize: 11,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                date,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
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