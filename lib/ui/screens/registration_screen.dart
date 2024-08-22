/*Created by Afaque Ali on 21-Aug-2024*/

import 'package:excise_e_auction/controllers/registration_screen_controller.dart';
import 'package:excise_e_auction/ui/custom_widgets/custom_scaffold.dart';
import 'package:excise_e_auction/ui/custom_widgets/general_button.dart';
import 'package:excise_e_auction/ui/custom_widgets/general_date_picker_field.dart';
import 'package:excise_e_auction/ui/custom_widgets/general_text_field.dart';
import 'package:excise_e_auction/utils/app_colors.dart';
import 'package:excise_e_auction/utils/constants.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegistrationScreen extends GetView<RegistrationScreenController> {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // scaffoldKey: controller.scaffoldKey,
      // className: runtimeType.toString(),
      // screenName: '',
      // gestureDetectorOnTap: controller.removeFocus,
      // onNotificationListener: (detail){
      //   if(detail is UserScrollNotification) {
      //     controller.removeFocus();
      //   }
      //   return true;
      // },
      // showBottomNavBar: false,
      body: getBody(context),
    );
  }

  Widget getBody(BuildContext context){
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
      child: Column(children: [
        Container(
          margin: const EdgeInsets.only(top: 30,bottom: 20),
          child: const Text('Create Account', style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color:kTextColor,
          ),
          ),
        ),
        GeneralTextField.withBorder(tfManager: controller.fullNameTfManager,),
        GeneralTextField.withBorder(tfManager: controller.cnicTfManager,),
        GeneralTextField.withBorder(tfManager: controller.emailTfManager,),
        GeneralTextField.withBorder(tfManager: controller.mobileNoTfManager,),
        GeneralTextField.withBorder(tfManager: controller.passwordTfManager,),
        GeneralTextField.withBorder(tfManager: controller.confirmPasswordTfManager,),
        const SizedBox(height: 8),
        GeneralButton(onPressed: (){controller.onRegister();},color: kBlackColor,text: 'Register',height: 54,),
        const SizedBox(height:30),
        RichText(
          textAlign: TextAlign.right,
          text: TextSpan(
            style: const TextStyle(
              fontFamily: "PoppinsLight",
              color: kTextLightColor,
            ),
            children: <TextSpan>[
              const TextSpan(text: "Already have an account? "),
              TextSpan(
                text: "Login",
                style: const TextStyle(
                    height: 1.2,
                    fontSize: 16,
                    letterSpacing: 0.08,
                    fontFamily: "PoppinsLight",
                    fontWeight: FontWeight.w600,
                    color: kPrimaryColor,decoration: TextDecoration.underline),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {Get.toNamed(kLoginScreenRoute);},
              ),
            ],
          ),
        ),
      ],),
    );
  }
}
