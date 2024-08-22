import 'package:excise_e_auction/models/auction_model.dart';
import 'package:excise_e_auction/utils/dummy_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:excise_e_auction/utils/constants.dart';

class AuctionsListScreenController extends GetxController {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  RxList<AuctionModel> auctionsList = RxList([]);



  @override
  void onInit() {
    super.onInit();
    var args = Get.arguments??{};
    String category = args["category"]??"";
    auctionsList.value = DummyData().getAuctionCategoryWiseList(category);

  }




}