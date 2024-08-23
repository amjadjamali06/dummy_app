import 'dart:async';
import 'package:excise_e_auction/models/auction_bid_model.dart';
import 'package:excise_e_auction/models/bid_request_model.dart';
import 'package:excise_e_auction/ui/custom_widgets/custom_progress_dialog.dart';
import 'package:excise_e_auction/utils/dummy_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BidRequestHistoryScreenController extends GetxController {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  RxList<AuctionBidModel> bidHistory = RxList([]);
  RxList<BidRequestModel> myRequests = RxList([]);
  RxInt selectedTabIndex = RxInt(0);

  @override
  void onInit() {
    super.onInit();
    dynamic args= Get.arguments;
    if(args!=null && args is int){
      selectedTabIndex.value=args;
    }
  }
  @override
  void onReady() {
  fetchData();
  }

  void fetchData(){
    ProgressDialog().showDialog(title: 'Please wait...');
    super.onReady();
    Timer(const Duration(seconds: 2),() {
      bidHistory.value = DummyData.bidsList;
      myRequests.value = DummyData().myBidRequests;
      ProgressDialog().dismissDialog();
    },);
  }

  void onTabIndexChanged(int index) {
    selectedTabIndex.value = index;
  }

}