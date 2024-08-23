
import 'dart:developer';

import 'package:excise_e_auction/ui/custom_widgets/general_text_field.dart';
import 'package:excise_e_auction/utils/constants.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
        backgroundColor: kWhiteColor,
        body: _getBody(),
      ),
    );
  }

  Widget _getBody(){
    final height = Get.height;
    final width = Get.width;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Image.asset(
                'assets/images/login_header_image_2.png',
                // height: Get.height * 0.24,
                // width: Get.width,
                fit: BoxFit.cover,
              ),
              Container(
                padding: EdgeInsets.only(left: width*0.07,top: height*0.1),
                child: Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: Image.asset("assets/images/sindh_govt_logo.png",width: 71,height: 81,)),
                    const Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Excise, Taxation and Narcotics Control Department",
                            style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600
                                , color: kWhiteColor),
                          ),
                          Text(
                            "Government of Sindh",
                            style:
                                TextStyle(fontSize: 15,fontWeight: FontWeight.w500, color: kTextLightColor),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),

          Padding(
            padding: EdgeInsets.only(left: width*0.07,top: height*0.02),
            child: const Text('Welcome,',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color:kBlackColor,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: width*0.07),
            child: const Text('Sign in to continue!',
              style: TextStyle(color:kLightGreyColor),
            ),
          ),
          SizedBox(height: height*0.04),

          GeneralTextField.withBorder(tfManager: controller.usernameTFMController, paddingHorizontal: width * 0.05,),
          const SizedBox(height: 12),
          GeneralTextField.withBorder(tfManager: controller.passwordTFMController, paddingHorizontal: width * 0.05,),

          //captcha code

          Obx(()=>
              Padding(
                padding: EdgeInsets.only(top: height*0.02, right: 16, left: width*0.07),
                child: Stack(
                  children: <Widget>[
                    Image.asset("assets/images/captcha_image.png"),
                    Container(
                      margin: const EdgeInsets.only(top: 0),
                      padding: EdgeInsets.only(
                          left: 45, right: 0, top: controller.randomPaddingTop.value),
                      child:
                      RotatedBox(
                        quarterTurns: controller.rotation1.value.toInt(),
                        child: Text(
                          controller.captchaVal1.value,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 24.0,
                              fontFamily: "PoppinsSemiBold"),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 68, right: 0, bottom: 4.0, top: 8.0),
                      child:
                      RotatedBox(
                        quarterTurns: controller.rotation2.value.toInt(),
                        child: Text(
                          controller.captchaVal2.value,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 24.0,
                              fontFamily: "PoppinsSemiBold"),
                        ),
                      ),

                    ),
                    Padding(
                      padding:
                      const EdgeInsets.only(left: 90, right: 2, top: 3.0),
                      child:
                      RotatedBox(
                        quarterTurns: controller.rotation3.value.toInt(),
                        child: Text(
                          controller.captchaVal3.value,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 24.0,
                              fontFamily: "PoppinsSemiBold"),
                        ),
                      ),

                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 110, right: 0, top: 12.0),
                      child:
                      RotatedBox(
                        quarterTurns: controller.rotation4.value.toInt(),
                        child: Text(
                          controller.captchaVal4.value,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 24.0,
                              fontFamily: "PoppinsSemiBold"),
                        ),
                      ),

                    ),
                  ],
                ),
              ),),

          GeneralTextField.withBorder(
            tfManager: controller.captchaTFMController,
            paddingHorizontal: width * 0.05,
            onChange: (value) {
              controller.onCaptchaChange(value);
            },
          ),

          Padding(
              padding: EdgeInsets.only(top: 8, left: width*0.07, right: 16),
              child: Align(
                alignment: Alignment.centerLeft,
                child: RichText(
                    text: TextSpan(
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontFamily: "PoppinsLight"),
                        children: <TextSpan>[
                          const TextSpan(
                              text:
                              'can\'t read the image? click '),
                          TextSpan(
                              text: 'here',
                              style: TextStyle(
                                color: Colors.blue[900],
                                decoration:
                                TextDecoration.underline,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  controller.onTapGesture();
                                }),
                          const TextSpan(text: ' to refresh. '),
                        ],), textScaler: TextScaler.linear(MediaQuery.of(Get.context!).textScaleFactor),),
              ),
          ),

          //captcha code
          const SizedBox(height: 16),
          GeneralButton(
              onPressed: () {
                controller.onSignInPressed();
              },
              text: 'Login',
              textColor: kWhiteColor,
              color: kBlackColor,
              margin: width * 0.07,
              height: 40),

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

          Padding(
            padding: EdgeInsets.only(top: height*0.02,left: width*0.07),
            child: RichText(
              textAlign: TextAlign.right,
              text: TextSpan(
                style: const TextStyle(
                    fontFamily: "PoppinsLight",
                    color: kTextLightColor,
                ),
                children: <TextSpan>[
                const TextSpan(text: "Don't have an account? "),
                TextSpan(
                  text: "Sign Up",
                  style: const TextStyle(
                      height: 1.2,
                      fontSize: 16,
                      letterSpacing: 0.08,
                      fontWeight: FontWeight.w600,
                      fontFamily: "PoppinsLight",
                      color: kTextFieldBlueColor,),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {Get.toNamed(kRegistrationScreenRoute);},
                ),
              ],
              ),
            ),
          ),
          const SizedBox(height: 40),

        ],
      ),
    );
}

}

