import 'dart:async';

import 'package:excise_e_auction/ui/screens/onboard_screen.dart';
import 'package:excise_e_auction/utils/user_session.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:excise_e_auction/utils/constants.dart';

/*Created By: Amjad Jamali on 15-Aug-2023*/

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
    bool isLoggedIn = await UserSession().isUserLoggedIn();

    if(isLoggedIn){
      Get.offAllNamed(kDashboardScreenRoute);
    }else {
      Get.offAll(()=>const OnBoardScreen());
    }
  }

  void onScreenTap() {
    _timer.cancel();
    _screenNavigation();
  }



}
