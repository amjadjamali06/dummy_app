import 'dart:async';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:excise_e_auction/models/auction_model.dart';
import 'package:excise_e_auction/models/auction_bid_model.dart';
import 'package:excise_e_auction/services/web_services/general_service.dart';
import 'package:excise_e_auction/ui/custom_widgets/custom_progress_dialog.dart';
import 'package:excise_e_auction/utils/constants.dart';
import 'package:excise_e_auction/utils/string_utils.dart';
import 'package:excise_e_auction/utils/text_filter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../ui/custom_widgets/custom_dialogs.dart';
import '../utils/text_field_manager.dart';

class PlaceBidScreenController extends GetxController{
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  TextFieldManager plateCategoryTfManager = TextFieldManager('',mandatory: false, hint: 'Plate Category');
  TextFieldManager desiredNbrPlateTfManager = TextFieldManager('',hint: 'Desired Characters or Numbers for the Plate',);
  TextFieldManager bidStartDateManager = TextFieldManager('',mandatory: false, hint: 'Bid Start Date and Time',);
  TextFieldManager bidEndDateManager = TextFieldManager('',mandatory: false, hint: 'Bid End Date and Time');
  TextFieldManager startingBidAmountTfManager = TextFieldManager('' ,mandatory: false, hint: 'Starting Bid Amount');
  TextFieldManager currentHighestBidTfManager = TextFieldManager('',mandatory: false, hint: 'Current Highest Bid');
  TextFieldManager bidAmountTfManager = TextFieldManager('',mandatory: true,filter: TextFilter.number, hint: 'Bid Amount',length: 10);
  TextFieldManager amountInWordsManager = TextFieldManager("",mandatory:false,hint: 'Amount in Words');
  TextFieldManager auctionExpiresIn = TextFieldManager("",mandatory:false,hint: '0:0:0');
  RxBool isAuctionExpired = true.obs;
  AuctionModel auctionModel = AuctionModel.empty();

  @override
  void onInit() {
    super.onInit();
    if(Get.arguments != null && Get.arguments is AuctionModel) {
      auctionModel= Get.arguments;
      populateData();
    }
  }

  Future<void> populateData() async {
    // ProgressDialog().showDialog(title: 'Please wait..');
    // await Future.delayed(const Duration(seconds: 1));
    // ProgressDialog().dismissDialog();

    plateCategoryTfManager.controller.text = auctionModel.bidType;
    desiredNbrPlateTfManager.controller.text = auctionModel.numberPlat;
    bidStartDateManager.controller.text = auctionModel.startDate.formatDate;
    bidEndDateManager.controller.text = auctionModel.endDate.formatDate;
    startingBidAmountTfManager.controller.text = auctionModel.bidStartAmount.toAmount;
    currentHighestBidTfManager.controller.text = auctionModel.bidEndAmount.toAmount;

    if (!hasAuctionExpired(auctionModel)) {
      final DateFormat dateFormat = DateFormat("dd MMM, yyyy HH:mm");
      DateTime expiryTime = DateTime.now();
      try {
        expiryTime = dateFormat.parse(auctionModel.endDate);
      } on Exception catch (e) {}
      auctionModel.expiryDuration = expiryTime.difference(DateTime.now());
      auctionModel.timer = Timer.periodic(const Duration(seconds: 1), (_) => startTimer(auctionModel) );
    }
    amountInWordsManager.controller.text = "Zero";
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
          bidDate: bidEndDateManager.controller.text,
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

  bool hasAuctionExpired(AuctionModel auctionModel){
    final DateFormat dateFormat = DateFormat("dd MMM, yyyy HH:mm");
    DateTime expiryTime = DateTime.now();
    try {
      expiryTime = dateFormat.parse(auctionModel.endDate);
    } on Exception catch (e) {}

    if(DateTime.now().isAfter(expiryTime)) {
      isAuctionExpired.value = true;
      return true;
    }
    isAuctionExpired.value = false;
    return false;
  }

  void startTimer(AuctionModel auctionModel){
    var seconds = auctionModel.expiryDuration!.inSeconds - 1;
    auctionModel.expiryDuration = Duration(seconds:seconds);
    auctionModel.expiryTime.value = formatDuration(auctionModel.expiryDuration ?? const Duration(seconds: 0));
  }

  void cancelTimers() {
    if (auctionModel.timer != null) {
      auctionModel.timer!.cancel();
    }
    auctionModel.endDate = '';
  }

  void goBack(){
    cancelTimers();
    Get.back();
  }

  /// Returns a formatted string for the given Duration [d] to be DD:HH:mm:ss
  /// and ignore if 0.
  String formatDuration(Duration d) {
    var seconds = d.inSeconds;
    final days = seconds~/Duration.secondsPerDay;
    seconds -= days*Duration.secondsPerDay;
    final hours = seconds~/Duration.secondsPerHour;
    seconds -= hours*Duration.secondsPerHour;
    final minutes = seconds~/Duration.secondsPerMinute;
    seconds -= minutes*Duration.secondsPerMinute;

    final List<String> tokens = [];
    if (days != 0) {
      tokens.add('${days}d');
    }
    if (tokens.isNotEmpty || hours != 0){
      tokens.add('${hours}h');
    }
    if (tokens.isNotEmpty || minutes != 0) {
      tokens.add('${minutes}m');
    }
    tokens.add('${seconds}s');
    return tokens.join(':');
  }
}