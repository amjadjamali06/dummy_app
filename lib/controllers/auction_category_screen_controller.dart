import 'package:excise_e_auction/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuctionCategoryScreenController extends GetxController{
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  RxInt selectedValue = 0.obs;
  void updateSelectedValue(int? value){
    if(value!=null){
      selectedValue.value = value;
    }
  }


  void onTapItem(String category){

    Get.toNamed(kAuctionsListScreenRoute, arguments: category);
  }
}