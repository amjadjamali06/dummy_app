import 'package:excise_e_auction/controllers/auctions_list_screen_controller.dart';
import 'package:excise_e_auction/ui/custom_widgets/custom_scaffold.dart';
import 'package:excise_e_auction/utils/app_colors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

enum CustomFontFamily {
  Roboto
  // customFontFamily('Roboto');
  // final String name;
  // const CustomFontFamily(this.name);
}

class AuctionsListScreen extends GetView<AuctionsListScreenController> {
  const AuctionsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      className: runtimeType.toString(),
      screenName: "View Auctions",
      scaffoldKey: controller.scaffoldKey,
      horizontalPadding: 12,
      body: Obx(
        () => ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 16),
          shrinkWrap: true,
          itemCount: controller.auctionsList.length,
          itemBuilder: (context, index) {
            final auction = controller.auctionsList[index];
            return AuctionCard(
                numberPlat: auction.numberPlat,
                bidType: auction.bidType,
                startDate: auction.startDate,
                endDate: auction.endDate,
                bidStartAmount: auction.bidStartAmount,
                bidEndAmount: auction.bidEndAmount);
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
  const AuctionCard({
    super.key,
    required this.numberPlat,
    required this.bidType,
    required this.startDate,
    required this.endDate,
    required this.bidStartAmount,
    required this.bidEndAmount,
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
    return Container(
      height: Get.height * 0.17,
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imageUrl),
          fit: BoxFit.fill,
          opacity: 0.7,
        ),
        // color: Colors.black87,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
        // borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            offset: const Offset(0, 2),
            spreadRadius: 2,
            blurRadius: 3,
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
                    style: TextStyle(
                      fontFamily: CustomFontFamily.Roboto.name,
                      color: Colors.white,
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
                      style: TextStyle(
                        fontFamily: CustomFontFamily.Roboto.name,
                        letterSpacing: 0.01,
                        fontSize: 14,
                        color: Colors.black87,
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
                          Text(
                            'Bid Start Time',
                            style: TextStyle(
                              fontFamily: CustomFontFamily.Roboto.name,
                              color: kGreenColor,
                              letterSpacing: 0,
                              fontSize: 10,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            startDate,
                            style: TextStyle(
                              fontFamily: CustomFontFamily.Roboto.name,
                              fontSize: 12.0,
                              letterSpacing: 0,
                              fontWeight: FontWeight.w600,
                              color: kTextColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Bid End Time',
                            style: TextStyle(
                              fontFamily: CustomFontFamily.Roboto.name,
                              color: kRequiredRedColor,
                              letterSpacing: 0,
                              fontSize: 10,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            endDate,
                            style: TextStyle(
                              fontFamily: CustomFontFamily.Roboto.name,
                              fontWeight: FontWeight.w600,
                              fontSize: 12.0,
                              color: kTextColor,
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
                              fontFamily: 'Roboto',
                              letterSpacing: 0,
                              fontSize: 10,
                              color: kTextColor,
                            ),
                          ),
                          Text(
                            "Rs.$bidStartAmount",
                            style: const TextStyle(
                              fontFamily: 'Roboto',
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
                              fontFamily: 'Roboto',
                              letterSpacing: 0,
                              fontSize: 10,
                              color: kTextColor,
                            ),
                          ),
                          Text(
                            "Rs.$bidEndAmount",
                            style: const TextStyle(
                              fontFamily: 'Roboto',
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
    );
  }
}

// class AuctionCard extends StatelessWidget {
//   final String numberPlat;
//   final String bidType;
//   final String startDate;
//   final String endDate;
//   final String bidStartAmount;
//   final String bidEndAmount;
//   const AuctionCard({
//     super.key,
//     required this.numberPlat,
//     required this.bidType,
//     required this.startDate,
//     required this.endDate,
//     required this.bidStartAmount,
//     required this.bidEndAmount,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: Get.height * 0.18,
//       margin: const EdgeInsets.symmetric(vertical: 8),
//       padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(16),
//         boxShadow: [
//           BoxShadow(
//               color: Colors.grey.shade300,
//               offset: const Offset(0, 2),
//               spreadRadius: 2,
//               blurRadius: 3)
//         ],
//       ),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           SizedBox(
//             width: Get.width * 0.2,
//             height: Get.height * 0.2,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Container(
//                   height: Get.height * 0.05,
//                   alignment: Alignment.center,
//                   decoration: BoxDecoration(
//                     color: bidType == "gold"
//                         ? const Color(0xff653d00)
//                         : bidType == "silver"
//                         ? const Color(0xff3b3b3b)
//                         : const Color(0xff478321),
//                     borderRadius: const BorderRadius.only(
//                       topLeft: Radius.circular(8),
//                       topRight: Radius.circular(8),
//                     ),
//                   ),
//                   child: Text(
//                     numberPlat,
//                     style: TextStyle(
//                       fontFamily: CustomFontFamily.Roboto.name,
//                       color: Colors.white,
//                       fontSize: 16,
//                     ),
//                   ),
//                 ),
//                 Container(
//                   height: Get.height * 0.05,
//                   alignment: Alignment.center,
//                   decoration: BoxDecoration(
//                     image: DecorationImage(
//                       image: AssetImage(bidType == "gold"
//                           ? "assets/images/gold.png"
//                           : bidType == "silver"
//                           ? "assets/images/silver.png"
//                           : "assets/images/platinum.png"),
//                       fit: BoxFit.fitHeight,
//                     ),
//                     borderRadius: const BorderRadius.only(
//                       bottomLeft: Radius.circular(8),
//                       bottomRight: Radius.circular(8),
//                     ),
//                   ),
//                   child: Center(
//                     child: Text(
//                       bidType.toUpperCase(),
//                       style: const TextStyle(
//                         fontFamily: 'Roboto',
//                         letterSpacing: 0.01,
//                         fontSize: 14,
//                         color: Colors.black87,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           const SizedBox(width: 8),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       startDate,
//                       style: const TextStyle(
//                         fontFamily: 'Roboto',
//                         fontSize: 12.0,
//                         color: Colors.black87,
//                       ),
//                     ),
//                     Text(
//                       endDate,
//                       style: const TextStyle(
//                         fontFamily: 'Roboto',
//                         fontSize: 12.0,
//                         color: Colors.black87,
//                       ),
//                     ),
//                   ],
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Container(
//                       margin:
//                       const EdgeInsets.only(top: 4, bottom: 4, right: 4),
//                       padding: const EdgeInsets.all(4),
//                       decoration: BoxDecoration(
//                         color: Colors.green[100],
//                         borderRadius: BorderRadius.circular(8.0),
//                       ),
//                       child: const Text(
//                         'Bid Start Date and Time',
//                         style: TextStyle(
//                           fontFamily: 'Roboto',
//                           color: Color(0xff478321),
//                           fontSize: 9,
//                         ),
//                       ),
//                     ),
//                     Container(
//                       alignment: Alignment.center,
//                       margin: const EdgeInsets.only(top: 4, bottom: 4),
//                       padding: const EdgeInsets.all(4),
//                       decoration: BoxDecoration(
//                         color: Colors.red.shade100,
//                         borderRadius: BorderRadius.circular(8.0),
//                       ),
//                       child: const Text(
//                         'Bid End Date and Time',
//                         style: TextStyle(
//                           fontFamily: 'Roboto',
//                           color: Color(0xffff0202),
//                           fontSize: 9,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       bidStartAmount,
//                       style: const TextStyle(
//                         fontFamily: 'Roboto',
//                         fontSize: 20.0,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     Text(
//                       bidEndAmount,
//                       style: const TextStyle(
//                         fontFamily: 'Roboto',
//                         fontSize: 20.0,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ],
//                 ),
//                 const Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       'Current Highest Bid',
//                       style: TextStyle(
//                         fontFamily: 'Roboto',
//                         fontSize: 11,
//                         color: Colors.black54,
//                       ),
//                     ),
//                     Text(
//                       'Starting Bid Amount',
//                       style: TextStyle(
//                         fontFamily: 'Roboto',
//                         fontSize: 11,
//                         color: Colors.black54,
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(width: 4)
//         ],
//       ),
//     );
//   }
// }
