import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:excise_e_auction/utils/constants.dart';

class DashboardScreenController extends GetxController{
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  Future<void> onDashboardCardTap(String title) async {
    switch (title) {
      case "Dashboard":
        // Get.toNamed();
        break;
    }
  }
} 