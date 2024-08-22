import 'package:excise_e_auction/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuctionCategoryScreenController extends GetxController{
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  List<String> categories = ["silver", "platinum", "gold"];

  RxInt selectedValue = 0.obs;


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
    Get.toNamed(kAuctionsListScreenRoute, arguments: {"category":categories[selectedValue.value]});
  }
}