import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:excise_e_auction/controllers/splash_screen_controller.dart';

/*Created By: Amjad Jamali on 05-Aug-2023*/
class SplashScreen extends GetView<SplashScreenController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()=> Future.value(false),
      child: GestureDetector(
        onTap: controller.onScreenTap,
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Column(children: <Widget>[
            Image.asset(
              'assets/images/splash_screen.png',
              fit: BoxFit.fill,
              height: MediaQuery.of(context).size.height,
              repeat: ImageRepeat.noRepeat,
              width: MediaQuery.of(context).size.width,
            ),
          ]),
        ),
      ),
    );
  }
}
