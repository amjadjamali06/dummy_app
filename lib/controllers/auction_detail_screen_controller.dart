import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:excise_e_auction/utils/constants.dart';

class AuctionDetailScreenController extends GetxController {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  Future<void> onHomeCardTap(String title) async {
    switch (title) {
      case "Registration":
        Get.toNamed(kRegistrationScreenRoute);
    }
  }

}
