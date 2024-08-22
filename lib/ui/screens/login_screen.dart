
import 'dart:developer';

import 'package:excise_e_auction/ui/custom_widgets/general_text_field.dart';
import 'package:excise_e_auction/utils/constants.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:excise_e_auction/controllers/login_screen_controller.dart';
import 'package:excise_e_auction/ui/custom_widgets/general_button.dart';
import 'package:excise_e_auction/utils/app_colors.dart';

class LoginScreen extends GetView<LoginScreenController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: controller.removeFocus,
      child: Scaffold(key: controller.scaffoldKey,
        backgroundColor: kPrimaryDarkColor,
        body: _getBody(),
      ),
    );
  }

  Widget _getBody(){
    final height = Get.height;
    final width = Get.width;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: const BoxDecoration(
              boxShadow: [BoxShadow(blurRadius: 5,spreadRadius: 2, color: kFieldBorderColor)],
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(150), bottomRight: Radius.circular(150))
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(150), bottomRight: Radius.circular(150)),
              child: Image.asset('assets/images/login-header4.png',height: Get.height*0.24,width: Get.width, fit: BoxFit.cover,),
            ),
          ),

          SizedBox(height: height*0.05),

          const Text('Welcome Back',
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color:kWhiteColor,
            ),
          ),
          SizedBox(height: height*0.02),
          const Text('Login to your account',
            style: TextStyle(color:kWhiteColor),
          ),
          SizedBox(height: height*0.04),

          GeneralTextField.withBorder(tfManager: controller.usernameTFMController, paddingHorizontal: width * 0.07, prefixIcon: Icons.person),
          const SizedBox(height: 12),
          GeneralTextField.withBorder(tfManager: controller.passwordTFMController, paddingHorizontal: width * 0.07, prefixIcon: Icons.lock),

          const SizedBox(height: 16),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.07),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Remember Me',style: TextStyle(fontSize: 14,color: kLightGreyColor,fontWeight: FontWeight.w600),),
                const SizedBox(width: 4),
                Obx(()=> Switch(
                  activeColor: kPrimaryColor,
                  inactiveThumbColor: kGreyColor,
                  value: controller.rememberMe.value,
                  onChanged: (_) => controller.rememberMe.toggle(),
                )),
                const Spacer(),
                const Text('Forgot Password?',style: TextStyle(fontSize: 14,color: kLightGreyColor, letterSpacing:0, decoration: TextDecoration.underline,decorationColor: kLightGreyColor)),
              ],
            ),
          ),
          const SizedBox(height: 24),
          GeneralButton(onPressed: (){controller.onSignInPressed();},text: 'SIGN IN',color: kButtonColor,margin: width * 0.07, height: 54),
          const SizedBox(height: 12),
          const SizedBox(height: 40),
          RichText(
            textAlign: TextAlign.right,
            text: TextSpan(
              style: const TextStyle(
                  fontFamily: "PoppinsLight",
                  color: kTextLightColor,
              ),
              children: <TextSpan>[
              const TextSpan(text: "New User? Click here to "),
              TextSpan(
                text: "Register",
                style: const TextStyle(
                    height: 1.2,
                    fontSize: 16,
                    letterSpacing: 0.08,
                    fontWeight: FontWeight.w600,
                    fontFamily: "PoppinsLight",
                    color: kPrimaryColor,decoration: TextDecoration.underline),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {Get.toNamed(kRegistrationScreenRoute);},
              ),
            ],
            ),
          ),
          const SizedBox(height: 40),

        ],
      ),
    );
}

}

