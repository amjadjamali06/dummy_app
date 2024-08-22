import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:excise_e_auction/models/user_model.dart';
import 'package:excise_e_auction/services/web_services/user_services.dart';
import 'package:excise_e_auction/ui/custom_widgets/custom_dialogs.dart';
import 'package:excise_e_auction/ui/custom_widgets/custom_progress_dialog.dart';
import 'package:excise_e_auction/utils/constants.dart';
import 'package:excise_e_auction/utils/text_field_manager.dart';
import 'package:excise_e_auction/utils/text_filter.dart';
import 'package:excise_e_auction/utils/user_session.dart';

class LoginScreenController extends GetxController{

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  TextFieldManager usernameTFMController = TextFieldManager('',hint:'Email Address' ,filter: TextFilter.email);
  TextFieldManager passwordTFMController = TextFieldManager('',hint: 'Password', filter: TextFilter.password);
  RxBool rememberMe = false.obs;


  void onSignInPressed() async {
    if(usernameTFMController.validate() & passwordTFMController.validate()){
      ProgressDialog().showDialog();
      UserModel user = await UserService().loginUser(username: usernameTFMController.text, password: passwordTFMController.text);
      ProgressDialog().dismissDialog();

      if(user.responseMessage == 'Success'){
        user.isRemembered = rememberMe.value;
        await UserSession().createSession(user: user);
        Get.offAllNamed(kDashboardScreenRoute);
      } else {
        CustomDialogs().showDialog("Login Failed", user.responseMessage, DialogType.error);
      }
    }
  }

  void removeFocus(){
    if(usernameTFMController.focusNode.hasFocus){
      usernameTFMController.focusNode.unfocus();
    }
    if(passwordTFMController.focusNode.hasFocus){
      passwordTFMController.focusNode.unfocus();
    }
  }
}