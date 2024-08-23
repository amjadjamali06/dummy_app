import 'dart:math';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:excise_e_auction/models/auction_request_model.dart';
import 'package:excise_e_auction/ui/custom_widgets/custom_dialogs.dart';
import 'package:excise_e_auction/utils/constants.dart';
import 'package:excise_e_auction/utils/dummy_data.dart';
import 'package:excise_e_auction/utils/user_session.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../ui/custom_widgets/custom_progress_dialog.dart';
import '../utils/text_field_manager.dart';

class AuctionRequestScreenController extends GetxController{
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  TextFieldManager desiredNbrPlateTfManager = TextFieldManager('',hint: 'AAAAAAA');

  String category = "${Get.arguments}".toLowerCase();



  @override
  void onInit() {
    desiredNbrPlateTfManager.length = category=="silver"?7:category=="gold"?5:3;
    desiredNbrPlateTfManager.hint = "Numbers for Plate '${"AAAAAAAAAAA".substring(0,desiredNbrPlateTfManager.length)}'";
    super.onInit();
  }

  void removeFocus(){
    if(desiredNbrPlateTfManager.focusNode.hasFocus){
      desiredNbrPlateTfManager.focusNode.unfocus();
    }
  }

  Future<void> onTapRequestAuction() async {

    if(validateAll()){
      removeFocus();
      String result = "";
      ProgressDialog().showDialog();
      await Future.delayed(const Duration(seconds: 2), (){
        int randomNo =  Random().nextInt(1000);
        final DateFormat formatter = DateFormat('dd/MM/yyyy');
        final auctionRequestModel = AuctionRequestModel(
          id: "ID-$randomNo",
          numberPlate: desiredNbrPlateTfManager.text,
          bidType: category,
          status: "pending",
          date: formatter.format(DateTime.now()),
        );
        DummyData.auctionRequestList.addNonNull(auctionRequestModel);
        DummyData.auctionRequestList.refresh();
        result = "Success";
      });
      ProgressDialog().dismissDialog();
      if(result == "Success") {
        CustomDialogs().showDialog(
          "Success",
          "Request has been submitted successfully!",
          DialogType.success,
          onOkBtnPressed: (){
            Get.offAllNamed(kHistoryListScreenRoute, predicate: (rout)=>rout.isFirst);
          },
        );
      } else {
        result = "Cannot submit request";
        CustomDialogs().showDialog(
          "Error",
          result,
          DialogType.error,
          onOkBtnPressed: (){
            return;
          },
        );
      }

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