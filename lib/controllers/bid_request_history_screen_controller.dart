import 'package:excise_e_auction/models/auction_model.dart';
import 'package:excise_e_auction/models/bid_request_model.dart';
import 'package:excise_e_auction/models/my_bid_model.dart';
import 'package:excise_e_auction/utils/dummy_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:excise_e_auction/utils/constants.dart';

import '../models/premium_number_model.dart';

class BidRequestHistoryScreenController extends GetxController {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  RxList<MyBidModel> bidHistory = RxList([]);
  RxList<BidRequestModel> myRequests = RxList([]);

  RxInt selectedTabIndex = RxInt(1);



  @override
  void onInit() {
    super.onInit();
    bidHistory.value = DummyData().myPlacedBids;
    myRequests.value = DummyData().myBidRequests;
  }

  void onTabIndexChanged(int index) {
    selectedTabIndex.value = index;
  }

}