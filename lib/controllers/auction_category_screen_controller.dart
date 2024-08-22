import 'package:excise_e_auction/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuctionCategoryScreenController extends GetxController{
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  List<String> categories = ["silver", "gold", "platinum"];

  RxInt selectedValue = 0.obs;

  String routeTo = Get.arguments??"";

  void onCategorySelected(int index) {
    selectedValue.value = index;
    notifyChildrens();
  }
  // void updateSelectedValue(int? value){
  //   if(value!=null){
  //     selectedValue.value = value;
  //   }
  // }


  void navigateToCategories() {
    if(routeTo == "Request"){
      Get.toNamed(kAuctionRequestScreenRoute, arguments: categories[selectedValue.value]);
    }else {
      Get.toNamed(kAuctionsListScreenRoute, arguments: categories[selectedValue.value]);
    }
  }
}