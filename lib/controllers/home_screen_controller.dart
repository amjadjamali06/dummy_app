import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:excise_e_auction/utils/constants.dart';

class HomeScreenController extends GetxController {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();


  Future<void> onHomeCardTap(String title) async {
    switch (title) {
      case "Registration":
        Get.toNamed(kRegistrationScreenRoute);
    }
  }

  List<Map<String,dynamic>> homeCards = [
    {
      "title": "Plate Category",
      "iconPath": "assets/icons/plate-1.png",
      "subTitle": "PLATINUM",
    },
    {
      "title": "Desired Charachters",
      "iconPath": "assets/icons/plate-2.png",
      "subTitle": "AHMED07",
    },
    {
      "title": "Bid Start Date and Time",
      "iconPath": "assets/icons/calander.png",
      "subTitle": "02 JAN 2024 | 11:59",
    },
    {
      "title": "Bid End Date and Time",
      "iconPath": "assets/icons/calander.png",
      "subTitle": "02 FEB 2024 | 11:59",
    },
    {
      "title": "Starting bid amount",
      "iconPath": "assets/icons/price.png",
      "subTitle": "11,123,1",
    },
    {
      "title": "Current highest bid",
      "iconPath": "assets/icons/auction.png",
      "subTitle": "1,231,1",
    }
   
  ];

}