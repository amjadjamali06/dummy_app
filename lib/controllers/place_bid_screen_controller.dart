import 'dart:async';
import 'package:excise_e_auction/models/placeBidModel.dart';
import 'package:excise_e_auction/ui/custom_widgets/custom_progress_dialog.dart';
import 'package:excise_e_auction/utils/date_time_manager.dart';
import 'package:excise_e_auction/utils/dummy_data.dart';
import 'package:excise_e_auction/utils/string_utils.dart';
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
  TextFieldManager bidAmountTfManager = TextFieldManager('Bid Amount',mandatory: true);

  @override
  void onReady() {
    super.onReady();
    fetchData();
  }

  void fetchData() {
      ProgressDialog().showDialog(title: 'Please wait..');
      Timer(const Duration(seconds: 2), () {
        PlaceBidModel bidData = DummyData.getPlaceBidData();
        plateCategoryTfManager.controller.text = bidData.plateCategory;
        desiredNbrPlateTfManager.controller.text = bidData.nbrPlate;
        bidStartDateManager.formattedDateTime.value = bidData.bidStartDate.formatDate;
        bidEndDateManager.formattedDateTime.value = bidData.bidEndDate.formatDate;
        startingBidAmountTfManager.controller.text = bidData.startingBidAmount;
        currentHighestBidTfManager.controller.text = bidData.currentHighestBid;
        ProgressDialog().dismissDialog();
      });
  }
  void removeFocus(){
    if(bidAmountTfManager.focusNode.hasFocus){
      bidAmountTfManager.focusNode.unfocus();
    }
  }
}