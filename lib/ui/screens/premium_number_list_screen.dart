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
            borderRadius: BorderRadius.circular(10),
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      numberPlat,
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
                      purchasePrice.toAmount,
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
