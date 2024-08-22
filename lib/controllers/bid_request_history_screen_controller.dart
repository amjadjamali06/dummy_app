import 'package:excise_e_auction/models/auction_model.dart';
import 'package:excise_e_auction/models/bid_request_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:excise_e_auction/utils/constants.dart';

import '../models/premium_number_model.dart';

class BidRequestHistoryScreenController extends GetxController {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  RxList<BidRequestModel> bidHistory = RxList([]);



  @override
  void onInit() {
    super.onInit();
    bidHistory.value = auctionCards;
  }


  List<BidRequestModel> auctionCards = [
    BidRequestModel(
      id: "1",
      bidderId: 'ALI-01',
      bidderName: 'Suhail',
      bidType: 'silver',
      status: "pending",
      date: '20/08/2024',
    ),
    BidRequestModel(
      id: "1",
      bidderId: 'ALI-01',
      bidderName: 'Suhail',
      bidType: 'platinum',
      status: "rejected",
      date: '20/08/2024',
    ),
    BidRequestModel(
      id: "1",
      bidderId: 'ALI-01',
      bidderName: 'Suhail',
      bidType: 'gold',
      status: "approved",
      date: '20/08/2024',
    ),
  ];

}