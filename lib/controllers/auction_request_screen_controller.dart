import 'package:excise_e_auction/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/text_field_manager.dart';

class AuctionRequestScreenController extends GetxController{
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  TextFieldManager desiredNbrPlateTfManager = TextFieldManager('Numbers for Plate',hint: 'AAAAAAA');

  String category = "${Get.arguments}".toLowerCase();



  @override
  void onInit() {
    desiredNbrPlateTfManager.length = category=="silver"?7:category=="gold"?5:3;
    desiredNbrPlateTfManager.hint = "'${"AAAAAAAAAAA".substring(0,desiredNbrPlateTfManager.length)}'";
    super.onInit();
  }

  void removeFocus(){
    if(desiredNbrPlateTfManager.focusNode.hasFocus){
      desiredNbrPlateTfManager.focusNode.unfocus();
    }
  }

  void onTapRequestAuction(){

    if(validateAll()){
      Get.offAllNamed(kHistoryListScreenRoute, predicate: (rout)=>rout.isFirst);
    }

  }

  bool validateAll(){

    if(desiredNbrPlateTfManager.validate()){
      if(desiredNbrPlateTfManager.length != desiredNbrPlateTfManager.text.length){
        desiredNbrPlateTfManager.errorMessage.value = "${desiredNbrPlateTfManager.fieldName} must be ${desiredNbrPlateTfManager.length} digits";
      }
    }

    return desiredNbrPlateTfManager.errorMessage.isEmpty;
  }

}