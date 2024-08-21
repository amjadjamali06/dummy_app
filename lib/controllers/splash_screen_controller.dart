import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:excise_e_auction/utils/constants.dart';
import 'package:excise_e_auction/utils/user_session.dart';

/*Created By: Amjad Jamali on 15-Aug-2023
* Last Modified by Afaque Ali on 21-Aug-2024*/

class SplashScreenController extends GetxController {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  late Timer _timer;

  @override
  void onInit() {
    _timer = Timer(const Duration(seconds: 5), () {
      _screenNavigation();
    });
    super.onInit();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _screenNavigation() async {
    Get.offAllNamed(kLoginTScreenRoute);
  }

  void onScreenTap() {
    _timer.cancel();
    _screenNavigation();
  }



}
