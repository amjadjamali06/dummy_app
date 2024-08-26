import 'package:excise_e_auction/controllers/place_bid_screen_controller.dart';
import 'package:excise_e_auction/ui/custom_widgets/general_date_picker_field.dart';
import 'package:excise_e_auction/utils/common_code.dart';
import 'package:excise_e_auction/utils/string_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/app_colors.dart';
import '../custom_widgets/custom_scaffold.dart';
import '../custom_widgets/general_button.dart';
import '../custom_widgets/general_text_field.dart';

class PlaceBidScreen extends GetView<PlaceBidScreenController> {
  const PlaceBidScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      scaffoldKey: controller.scaffoldKey,
      className: runtimeType.toString(),
      screenName: 'Place Bid',
      gestureDetectorOnTap: controller.removeFocus,
      onNotificationListener: (detail){
        if(detail is UserScrollNotification) {
          controller.removeFocus();
        }
        return true;
      },
      body: getBody(context),
    );
  }

  Widget getBody(BuildContext context){
    return Column(
      children: [
      SizedBox(height: Get.height*0.05),
        expiryTimeWidget(),
      GeneralTextField(tfManager: controller.plateCategoryTfManager,readOnly: true,),
      GeneralTextField(tfManager: controller.desiredNbrPlateTfManager,readOnly: true,),
      GeneralTextField(tfManager: controller.bidStartDateManager,readOnly: true,),
      GeneralTextField(tfManager: controller.bidEndDateManager,readOnly: true,),
      GeneralTextField(tfManager: controller.startingBidAmountTfManager,readOnly: true,),
      GeneralTextField(tfManager: controller.currentHighestBidTfManager,readOnly: true,),
      GeneralTextField(tfManager: controller.amountInWordsManager,readOnly:true,),
      GeneralTextField(tfManager: controller.bidAmountTfManager,onChange: (value){
        controller.amountInWordsManager.controller.text = CommonCode().convert(value: value.toDouble);
        controller.bidAmountTfManager.controller.text = controller.bidAmountTfManager.controller.text.toAmount;
      },),
      GeneralButton(onPressed: (){
        controller.onPlaceBidPressed();
      }),
      SizedBox(height:MediaQuery.of(context).viewInsets.bottom),
    ],);
  }

  Widget expiryTimeWidget() {
    return SizedBox(
      height: Get.height * .09,
      width: Get.width,
      child: Obx(
        () => Padding(
          padding: EdgeInsets.only(top: Get.height * .02,bottom: Get.height * .02,left: Get.width * .03),
          child: controller.isAuctionExpired.isFalse
              ? Text.rich(
                  TextSpan(
                    text: 'Expires In: ',
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: kPrimaryColor),
                    children: <InlineSpan>[
                      TextSpan(
                        text: '${controller.auctionModel.expiryTime}',
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.red),
                      ),
                    ],
                  ),
                )
              : const Text(
                  "Auction Expired",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.red),
                ),
        ),
      ),
    );
  }
}
