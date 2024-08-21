import 'package:excise_e_auction/controllers/tag_winning_nbr_screen_controller.dart';
import 'package:excise_e_auction/ui/custom_widgets/custom_heading_text.dart';
import 'package:excise_e_auction/ui/custom_widgets/general_button.dart';
import 'package:excise_e_auction/ui/custom_widgets/general_text_field.dart';
import 'package:excise_e_auction/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../custom_widgets/custom_scaffold.dart';

class TagWinningNbrScreen extends GetView<TagWinningNbrScreenController> {
  const TagWinningNbrScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      scaffoldKey: controller.scaffoldKey,
      className: runtimeType.toString(),
      screenName: ' ',
      gestureDetectorOnTap: controller.removeFocus,
      body: getBody(),
    );
  }
  Widget getBody(){
    return Column(children: [
      const CustomHeadingText(text: 'Tag Winning Number',headingColor: Colors.black,),
      GeneralTextField.withBorder(tfManager: controller.winningAuctionIdTfManager,readOnly: true,),
      GeneralTextField.withBorder(tfManager: controller.winningNbrPlateDetailsTfManager,readOnly: true,),
      GeneralTextField.withBorder(tfManager: controller.vehicleRegistrationNbrTfManager),
      GeneralButton(onPressed: (){},text: 'Submit',color: kBlackColor,)
    ],);
  }
}
