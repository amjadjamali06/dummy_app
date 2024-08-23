// ignore_for_file: public_member_api_docs, sort_constructors_first
/* Created By Bilawal Mehmood  on 25-JAN-2024*/
import 'package:excise_e_auction/models/auction_model.dart';
import 'package:excise_e_auction/ui/custom_widgets/general_button.dart';
import 'package:excise_e_auction/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:excise_e_auction/controllers/auction_detail_screen_controller.dart';
import 'package:excise_e_auction/ui/custom_widgets/custom_scaffold.dart';
import 'package:excise_e_auction/utils/app_colors.dart';

class AuctionDetailScreen extends GetView<AuctionDetailScreenController> {
  final AuctionModel auctionModel;
  const AuctionDetailScreen({
    super.key,
    required this.auctionModel,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      className: runtimeType.toString(),
      screenName: "Auction Details",
      scaffoldKey: controller.scaffoldKey,
      body: buildBody,
      horizontalPadding: 20,
    );
  }

  Widget get buildBody {
    return Padding(
      padding: EdgeInsets.only(top: Get.height * 0.05),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: Get.width * 0.4,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                gradient: const LinearGradient(
                    colors: [kPrimaryDarkColor, kPrimaryColor],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter),
                boxShadow: const [
                  BoxShadow(
                      blurRadius: 0.5,
                      color: kLightGreyColor,
                      offset: Offset(1, -1))
                ],
                borderRadius: BorderRadius.circular(10)),
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Auction ID",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.white.withOpacity(0.6)),
                ),
                Text(
                  auctionModel.id,
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ),
              ],
            )),
          ),
          SizedBox(height: Get.height * 0.05),
          GridView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.4,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16),
            children: [
              auctionDetailCard(
                onTap: () {},
                title: "Plate Category",
                subTitle: auctionModel.bidType.capitalizeFirst.toString(),
                iconPath: "assets/icons/plate-1.png",
              ),
               auctionDetailCard(
                onTap: () {},
                title: "Desired Charachters",
                subTitle: auctionModel.numberPlat,
                iconPath: "assets/icons/plate-2.png",
              ),
              auctionDetailCard(
                onTap: () {},
                title: "Bid Start Date and Time",
                subTitle: auctionModel.startDate,
                iconPath: "assets/icons/calander.png",
                size: 25,
              ),
               auctionDetailCard(
                onTap: () {},
                title: "Bid End Date and Time",
                subTitle: auctionModel.endDate,
                iconPath: "assets/icons/calander.png",
                size: 25,
              ),
               auctionDetailCard(
                onTap: () {},
                title: "Starting bid amount",
                subTitle: auctionModel.bidStartAmount,
                iconPath: "assets/icons/price.png",
              ),
               auctionDetailCard(
                onTap: () {},
                title: "Current highest bid",
                subTitle: auctionModel.bidEndAmount,
                iconPath: "assets/icons/auction.png",
              )
            ],
          ),
          SizedBox(height: Get.height * 0.05),
          GeneralButton(onPressed: () {Get.toNamed(kPlaceBidScreenRoute,arguments: auctionModel);}, text: "Place a Bid")
        ],
      ),
    );
  }

  Widget auctionDetailCard(
      {String title = "Title",
      String subTitle = "Title",
      String iconPath = 'assets/icons/l_plate.png',
      double size = 30,
      required Function() onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: Get.width,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: kCardColor,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
            color: Colors.grey.shade500,
            offset: const Offset(0, 1),
            spreadRadius: 1,
            blurRadius: 2,
          )
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Image.asset(
                iconPath,
                height: size,
                width: size,
                fit: BoxFit.contain,
                color: kTextLightColor,
              ),
            ),
            const SizedBox(height: 8),
            Text(title,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: kPrimaryColor)),
            Text(subTitle,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: kTextColor))
          ],
        ),
      ),
    );
  }
}
