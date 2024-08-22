/*Created by Afaque Ali on 21-Aug-2024*/

import 'package:excise_e_auction/controllers/registration_screen_controller.dart';
import 'package:excise_e_auction/ui/custom_widgets/custom_scaffold.dart';
import 'package:excise_e_auction/ui/custom_widgets/general_button.dart';
import 'package:excise_e_auction/ui/custom_widgets/general_date_picker_field.dart';
import 'package:excise_e_auction/ui/custom_widgets/general_text_field.dart';
import 'package:excise_e_auction/utils/app_colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegistrationScreen extends GetView<RegistrationScreenController> {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      scaffoldKey: controller.scaffoldKey,
      className: runtimeType.toString(),
      screenName: '',
      gestureDetectorOnTap: controller.removeFocus,
      onNotificationListener: (detail){
        if(detail is UserScrollNotification) {
          controller.removeFocus();
        }
        return true;
      },
      body: getBody(context),
    );
  }

  Widget getBody(BuildContext context){
    return Column(children: [
      Container(
        margin: const EdgeInsets.only(top: 20,bottom: 20),
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
      GeneralButton(onPressed: (){controller.onRegister();},color: kBlackColor,text: 'Register',),
      SizedBox(height:MediaQuery.of(context).viewInsets.bottom),
    ],);
  }
}
