import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:excise_e_auction/utils/constants.dart';

class DashboardScreenController extends GetxController{
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  void onTapItem(String title){
    switch(title){
      case "E-Auction": Get.toNamed(kEAuctionScreenRoute);break;
    }
  }
} 