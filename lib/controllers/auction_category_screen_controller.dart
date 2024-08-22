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
}