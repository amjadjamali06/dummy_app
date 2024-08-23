import 'package:excise_e_auction/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EAuctionScreenController extends GetxController{
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();


  void onTapItem(String title){
    switch(title){
      case "Place\nBid": Get.toNamed(kAuctionCategoryScreenRoute);break;
      case "Request\nHistory": Get.toNamed(kHistoryListScreenRoute);break;
      case "Auction\n Request": Get.toNamed(kAuctionCategoryScreenRoute, arguments: "Request");break;
      case "Tag Winning\n Number": Get.toNamed(kPremiumNumberListScreenRoute);break;
    }
  }

}