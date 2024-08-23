import 'package:excise_e_auction/utils/text_field_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:excise_e_auction/utils/constants.dart';

class DashboardScreenController extends GetxController{
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  TextFieldManager searchTF = TextFieldManager("Search");

  void onTapItem(String title){
    switch(title){
      case "Auction": Get.toNamed(kEAuctionScreenRoute);break;
    }
  }


  void onSearchTFChanged(value){
  }

  void removeFocus(){
    if(searchTF.focusNode.hasFocus){
      searchTF.focusNode.unfocus();
    }
  }
} 