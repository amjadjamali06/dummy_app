import 'package:excise_e_auction/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:excise_e_auction/controllers/splash_screen_controller.dart';
import 'package:google_fonts/google_fonts.dart';

/*Created By: Amjad Jamali on 05-Aug-2023*/
class SplashScreen extends GetView<SplashScreenController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: GestureDetector(
        onTap: controller.onScreenTap,
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Column(children: <Widget>[
            Container(
              width: Get.width,
              height: Get.height * 0.6,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Transform.scale(
                      scale: 1.2,
                      child: Image.asset("assets/images/layout.png",
                          fit: BoxFit.fill)),
                  Column(
                    children: [
                      Image.asset("assets/images/bg_assets.png"),
                      Image.asset("assets/images/logo.png"),
                      const SizedBox(height: 20),
                      Text(
                          'Excise, Taxation and Narcotics Control Department'
                              .toUpperCase(),
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins().copyWith(
                              fontSize: 20, fontWeight: FontWeight.w600, color: kWhiteColor)),
                      const SizedBox(height: 10),
                      Text('Government of Sindh',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins().copyWith(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xff9DCDFF)))
                    ],
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
