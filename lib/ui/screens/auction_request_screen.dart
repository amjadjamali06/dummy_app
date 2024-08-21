import 'package:excise_e_auction/controllers/auction_request_screen_controller.dart';
import 'package:excise_e_auction/ui/custom_widgets/general_button.dart';
import 'package:excise_e_auction/ui/custom_widgets/general_text_field.dart';
import 'package:excise_e_auction/utils/app_colors.dart';
import 'package:excise_e_auction/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../custom_widgets/custom_scaffold.dart';

class AuctionRequestScreen extends GetView<AuctionRequestScreenController> {
  const AuctionRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      scaffoldKey: controller.scaffoldKey,
      className: runtimeType.toString(),
      screenName: '',
      gestureDetectorOnTap: controller.removeFocus,
      body: getBody(),
    );
  }
  Widget getBody(){
    return Column(children: [
       Container(
        margin: const EdgeInsets.only(top: 20,bottom: 20),
        child: const Text('Tag Winning Number', style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color:kTextColor,
        ),
        ),
      ),
      const SizedBox(height: 20,),
      GeneralTextField.withBorder(tfManager: controller.desiredNbrPlateTfManager),
      GeneralButton(onPressed: (){Get.toNamed(kPlaceBidScreenRoute);},color: kBlackColor,)
    ],);
  }
}
