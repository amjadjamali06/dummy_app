import 'package:excise_e_auction/controllers/onboard_screen_controller.dart';
import 'package:excise_e_auction/ui/custom_widgets/general_button.dart';
import 'package:excise_e_auction/utils/app_colors.dart';
import 'package:excise_e_auction/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class OnBoardScreen extends GetView<OnBoardScreenController> {
  const OnBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardScreenController());
    return Scaffold(
      key: controller.scaffoldKey,
      backgroundColor: kWhiteColor,
      body: _getBody(),
    );
  }

  Widget _getBody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
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
                      style: GoogleFonts.poppins()
                          .copyWith(fontSize: 20, fontWeight: FontWeight.w600, color: kWhiteColor)),
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
        const SizedBox(height: 20),
        GeneralButton(onPressed:() => Get.offAllNamed(kLoginScreenRoute), text: 'Create an Account', margin: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Already have an account?',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins().copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: kTextHintColor)),
            GestureDetector(
              onTap: () => Get.offAllNamed(kLoginScreenRoute),
              child: Text(' Sign In',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins().copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: kPrimaryColor)),
            )
          ],
        ),
        const SizedBox(height: 40)
      ],
    );
  }
}
