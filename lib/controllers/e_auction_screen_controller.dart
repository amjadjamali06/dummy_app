import 'package:excise_e_auction/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EAuctionScreenController extends GetxController{
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();


  void onTapItem(String title){
    switch(title){
      case "Place A Bid": Get.toNamed(kAuctionCategoryScreenRoute);break;
      case "Request History": Get.toNamed(kAuctionCategoryScreenRoute);break;
      case "Auction\nRequest": Get.toNamed(kAuctionCategoryScreenRoute);break;
      case "Tag Winning Number": Get.toNamed(kPremiumNumberListScreenRoute);break;
    }
  }

}