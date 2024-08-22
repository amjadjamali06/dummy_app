import 'dart:async';
import 'package:excise_e_auction/models/auction_model.dart';
import 'package:excise_e_auction/ui/custom_widgets/custom_progress_dialog.dart';
import 'package:excise_e_auction/utils/constants.dart';
import 'package:excise_e_auction/utils/date_time_manager.dart';
import 'package:excise_e_auction/utils/string_utils.dart';
import 'package:excise_e_auction/utils/text_filter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
  AuctionModel auctionArgsData = AuctionModel.empty();
  AuctionModel? args;

  @override
  void onReady() {
    super.onReady();
    args= Get.arguments;
    if(args != null) {
      auctionArgsData= args!;
      fetchData();
    }
  }

  void fetchData() {
      ProgressDialog().showDialog(title: 'Please wait..');
      Timer(const Duration(seconds: 2), () {
        plateCategoryTfManager.controller.text = args!.bidType;
        desiredNbrPlateTfManager.controller.text = args!.numberPlat;
        bidStartDateManager.formattedDateTime.value = args!.startDate.formatDate;
        bidEndDateManager.formattedDateTime.value = args!.endDate.formatDate;
        startingBidAmountTfManager.controller.text = args!.bidStartAmount;
        currentHighestBidTfManager.controller.text = args!.bidEndAmount;
        ProgressDialog().dismissDialog();
      });
  }
  void removeFocus(){
    if(bidAmountTfManager.focusNode.hasFocus){
      bidAmountTfManager.focusNode.unfocus();
    }
  }

  void placeBid() {
    Get.offAllNamed(kHistoryListScreenRoute,predicate: (rout)=>rout.isFirst);
  }
}