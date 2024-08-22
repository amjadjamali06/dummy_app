/*
Created by Afaque Ali on 21-Aug-2024
*/

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:excise_e_auction/models/user_model.dart';
import 'package:excise_e_auction/services/web_services/user_services.dart';
import 'package:excise_e_auction/ui/custom_widgets/custom_dialogs.dart';
import 'package:excise_e_auction/ui/custom_widgets/custom_progress_dialog.dart';
import 'package:excise_e_auction/utils/app_colors.dart';
import 'package:excise_e_auction/utils/constants.dart';
import 'package:excise_e_auction/utils/dummy_data.dart';
import 'package:excise_e_auction/utils/text_field_manager.dart';
import 'package:excise_e_auction/utils/text_filter.dart';
import 'package:excise_e_auction/utils/user_session.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegistrationScreenController extends GetxController{
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  TextFieldManager fullNameTfManager = TextFieldManager('Full Name',hint: "Full Name",mandatory: true);
  TextFieldManager cnicTfManager = TextFieldManager('CNIC',hint: 'CNIC Number',mandatory: true,filter: TextFilter.cnic);
  TextFieldManager emailTfManager = TextFieldManager('Email',hint: "Email Address",mandatory: true,filter: TextFilter.email);
  TextFieldManager mobileNoTfManager = TextFieldManager('Mobile No',hint: "Mobile No.",mandatory: true,filter: TextFilter.mobile);
  TextFieldManager passwordTfManager = TextFieldManager('Password',mandatory: true,filter: TextFilter.password);
  TextFieldManager confirmPasswordTfManager = TextFieldManager('Confirm Password',mandatory: true,filter: TextFilter.password);


  void onRegister() async {
    if (validateUser()) {
      UserModel userModel = UserModel.empty()
        ..id = DateTime.now().millisecondsSinceEpoch.toString()
        ..name= fullNameTfManager.controller.text
        ..cnic= cnicTfManager.controller.text
        ..email= emailTfManager.controller.text
        ..phoneNumber= mobileNoTfManager.controller.text
        ..password= passwordTfManager.controller.text;

      ProgressDialog().showDialog();
      String response = await UserService().registerUser(userModel: userModel);
      ProgressDialog().dismissDialog();

      if(response=="Success"){
        CustomDialogs().showDialog("Success", "Registered Successfully.", DialogType.success,onOkBtnPressed: (){
          Get.offAllNamed(kLoginScreenRoute);
        });
      }else{
        CustomDialogs().showDialog("Alert", response, DialogType.error);
      }
    } else if(passwordTfManager.controller.text != confirmPasswordTfManager.controller.text){
      CustomDialogs().showDialog("Alert", "Password and Confirm password Doesn't Match", DialogType.error);
    }

  }

  bool validateUser() {
    return ((fullNameTfManager.validate() &
            cnicTfManager.validate() &
            emailTfManager.validate() &
            mobileNoTfManager.validate() &
            passwordTfManager.validate() &
            confirmPasswordTfManager.validate()) &
        (passwordTfManager.controller.text ==
            confirmPasswordTfManager.controller.text));
  }

  void removeFocus(){
    if(passwordTfManager.focusNode.hasFocus){
      passwordTfManager.focusNode.unfocus();
    }
  }
}