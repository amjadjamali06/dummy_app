import 'dart:async';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:excise_e_auction/models/auction_model.dart';
import 'package:excise_e_auction/models/auction_bid_model.dart';
import 'package:excise_e_auction/services/web_services/general_service.dart';
import 'package:excise_e_auction/ui/custom_widgets/custom_progress_dialog.dart';
import 'package:excise_e_auction/utils/constants.dart';
import 'package:excise_e_auction/utils/date_time_manager.dart';
import 'package:excise_e_auction/utils/string_utils.dart';
import 'package:excise_e_auction/utils/text_filter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../ui/custom_widgets/custom_dialogs.dart';
import '../utils/text_field_manager.dart';

class PlaceBidScreenController extends GetxController{
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  TextFieldManager plateCategoryTfManager = TextFieldManager('Plate Category',mandatory: false);
  TextFieldManager desiredNbrPlateTfManager = TextFieldManager('Desired Characters or Numbers for the Plate',hint: 'Ahmed-07');
  DateTimeManager bidStartDateManager = DateTimeManager('Bid Start Date and Time');
  DateTimeManager bidEndDateManager = DateTimeManager('Bid End Date and Time');
  TextFieldManager startingBidAmountTfManager = TextFieldManager('Starting Bid Amount');
  TextFieldManager currentHighestBidTfManager = TextFieldManager('Current Highest Bid');
  TextFieldManager bidAmountTfManager = TextFieldManager('Bid Amount',mandatory: true,filter: TextFilter.number);
  AuctionModel auctionModel = AuctionModel.empty();

  @override
  void onReady() {
    super.onReady();
    if(Get.arguments != null && Get.arguments is AuctionModel) {
      auctionModel= Get.arguments;
      populateData();
    }
  }

  Future<void> populateData() async {
    ProgressDialog().showDialog(title: 'Please wait..');
    await Future.delayed(const Duration(seconds: 1));
    ProgressDialog().dismissDialog();

    plateCategoryTfManager.controller.text = auctionModel.bidType;
    desiredNbrPlateTfManager.controller.text = auctionModel.numberPlat;
    bidStartDateManager.formattedDateTime.value = auctionModel.startDate.formatDate;
    bidEndDateManager.formattedDateTime.value = auctionModel.endDate.formatDate;
    startingBidAmountTfManager.controller.text = auctionModel.bidStartAmount.toAmount;
    currentHighestBidTfManager.controller.text = auctionModel.bidEndAmount.toAmount;
  }

  void removeFocus(){
    if(bidAmountTfManager.focusNode.hasFocus){
      bidAmountTfManager.focusNode.unfocus();
    }
  }

  void onPlaceBidPressed()async{
    if(bidAmountTfManager.validate()){
      removeFocus();
      ProgressDialog().showDialog(title: 'Please wait...');
      AuctionBidModel bidModel = AuctionBidModel(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          plateCategory: plateCategoryTfManager.controller.text,
          nbrPlate: desiredNbrPlateTfManager.controller.text,
          bidDate: bidEndDateManager.formattedDateTime.value,
          bidAmount: bidAmountTfManager.controller.text,
          auctionId: auctionModel.id);
      ProgressDialog().showDialog();
      String response = await GeneralService().addAuctionBidToHistory(auctionBidModel: bidModel);
      ProgressDialog().dismissDialog();
      if(response=="Success"){
        CustomDialogs().showDialog("Success", "Registered Successfully.", DialogType.success,onOkBtnPressed: (){
          Get.offAllNamed(kHistoryListScreenRoute,predicate: (rout)=>rout.isFirst,arguments: 1);
        });
      }else{
        CustomDialogs().showDialog("Alert", response, DialogType.error);
      }
    }
  }
}