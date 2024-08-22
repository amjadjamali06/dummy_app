import 'package:excise_e_auction/controllers/place_bid_screen_controller.dart';
import 'package:excise_e_auction/ui/custom_widgets/general_date_picker_field.dart';
import 'package:excise_e_auction/utils/constants.dart';
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
      screenName: ' ',
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
    return Column(children: [
      Container(
        margin: const EdgeInsets.only(top: 20,bottom: 20),
        child: const Text('Place a Bid', style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color:kTextColor,
        ),
        ),
      ),
      GeneralTextField.withBorder(tfManager: controller.plateCategoryTfManager,readOnly: true,),
      GeneralTextField.withBorder(tfManager: controller.desiredNbrPlateTfManager,readOnly: true,),
      GeneralDatePickerField.withBorder(dateManager: controller.bidStartDateManager,readOnly: true,),
      GeneralDatePickerField.withBorder(dateManager: controller.bidEndDateManager,readOnly: true,),
      GeneralTextField.withBorder(tfManager: controller.startingBidAmountTfManager,readOnly: true,),
      GeneralTextField.withBorder(tfManager: controller.currentHighestBidTfManager,readOnly: true,),
      GeneralTextField.withBorder(tfManager: controller.bidAmountTfManager),
      GeneralButton(onPressed: (){
        controller.placeBid();
      },color: kBlackColor,text: 'Place a Bid',),
      SizedBox(height:MediaQuery.of(context).viewInsets.bottom),
    ],);
  }
}
