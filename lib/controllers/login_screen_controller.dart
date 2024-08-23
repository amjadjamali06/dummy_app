import 'dart:math';

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

  TextFieldManager usernameTFMController = TextFieldManager('',hint:'Email Address' ,filter: TextFilter.email,mandatory: true);
  TextFieldManager passwordTFMController = TextFieldManager('',hint: 'Password', filter: TextFilter.password,mandatory: true);
  TextFieldManager captchaTFMController = TextFieldManager('',hint: 'Captcha', filter: TextFilter.alphaNumeric,mandatory: true,length: 4,);
  RxBool rememberMe = false.obs;

  RxDouble randomPaddingTop = 0.0.obs;
  RxDouble randomPaddingBottom = 0.0.obs;
  RxString captchaVal1 = "".obs,
      captchaVal2 = "".obs,
      captchaVal3 = "".obs,
      captchaVal4 = "".obs;
  RxInt rotation1 = 0.obs,
      rotation2 = 0.obs,
      rotation3 = 0.obs,
      rotation4 = 0.obs;
  static final List<String> numbersAndAlphabet = [];

  RxString captchaStr = "".obs/*,
      captchaErrorMsg = "Captcha is required".obs*/;
  RxBool isCaptchaGenerated = false.obs,
      isCaptchaErrorMsgVisible = false.obs,
      isCaptchaValid = false.obs/*,
      isPasswordTextObscure = true.obs*/;
  // TextEditingController captchaController = TextEditingController();
  // FocusNode captchaFocusNode = FocusNode();

  @override
  void onInit(){
    if (!isCaptchaGenerated.value) {
      generateCaptcha();
    }

    super.onInit();
  }

  void onSignInPressed() async {
    if(usernameTFMController.validate() & passwordTFMController.validate()){
      removeFocus();
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

  /// This method will Generate a random captcha of four digits.
  void generateCaptcha() {
    String storeGeneratedCaptcha = "";
    List<String> captchaList = getCaptchaList(4);
    if (captchaList.length > 0) {
      for (int i = 0; i < captchaList.length; i++) {
        storeGeneratedCaptcha = storeGeneratedCaptcha + captchaList[i];
        if (i == 0) {
          captchaVal1.value = captchaList[i] + " ";
        } else if (i == 1) {
          captchaVal2.value = captchaList[i] + " ";
        } else if (i == 2) {
          captchaVal3.value = captchaList[i] + " ";
        } else if (i == 3) {
          captchaVal4.value = captchaList[i] + " ";
        }
      }
      int randomTopPadding = new Random().nextInt(10);
      int randomBottomPadding = new Random().nextInt(10);
      randomPaddingTop.value = randomTopPadding.toDouble();
      randomPaddingBottom.value = randomBottomPadding.toDouble();
    }
  }

  /// This method will Generate a random captcha list of four digits from which captcha will be shown.
  static List<String> getCaptchaList(int length) {
    List<String> list1 = [];
    String captcha = "";
    Random random = new Random();
    numbersAndAlphabet.clear();
    numbersAndAlphabet.addAll({
      "A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U", "V","W","X","Y","Z",
      "0","1","2","3","4","5","6","7","8","9",
      "a","b","c","d","e","f","g","h","i","j", "k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"
    });
    int i = 0;
    while (i < length) {
      int randomNo = random.nextInt(numbersAndAlphabet.length-1);
      // if (randomNo >= 0 && randomNo < numbersAndAlphabet.length) {
      String val = numbersAndAlphabet[randomNo];
      if (!captcha.contains(val)) {
        captcha = captcha + val;
        list1.add(val);
        i++;
      }
      // }
    }
    return list1;
  }
  /// This method will respond any change in the captcha field and check whether captcha is valid or not.
  void onCaptchaChange(String value){
    captchaStr.value = value.trim();
    if (captchaStr.value.isEmpty) {
      captchaTFMController.errorMessage.value = "Captcha is required";
      isCaptchaErrorMsgVisible.value = true;
      isCaptchaValid.value = false;
    }
    else {
      if (captchaStr.value.length == 1) {
        if (captchaVal1
            .trim()
            .compareTo(value) ==
            0) {
          isCaptchaErrorMsgVisible.value = false;
        } else {
          captchaTFMController.errorMessage.value = "Invalid captcha";
          isCaptchaErrorMsgVisible.value = true;
        }
        isCaptchaValid.value = false;
      } else if (captchaStr.value.length == 2) {
        if ((captchaVal1.trim() +
            captchaVal2.trim())
            .compareTo(value) ==
            0) {
          isCaptchaErrorMsgVisible.value = false;
        } else {
          captchaTFMController.errorMessage.value = "Invalid captcha";
          isCaptchaErrorMsgVisible.value = true;
        }
        isCaptchaValid.value = false;
      } else if (captchaStr.value.length == 3) {
        if ((captchaVal1.trim() +
            captchaVal2.trim() +
            captchaVal3.trim())
            .compareTo(value) ==
            0) {
          isCaptchaErrorMsgVisible.value = false;
        } else {
          captchaTFMController.errorMessage.value = "Invalid captcha";
          isCaptchaErrorMsgVisible.value = true;
        }
        isCaptchaValid.value = false;
      } else if (captchaStr.value.length == 4) {
        if ((captchaVal1.trim() +
            captchaVal2.trim() +
            captchaVal3.trim() +
            captchaVal4.trim())
            .compareTo(value) ==
            0) {
          isCaptchaErrorMsgVisible.value = false;
          isCaptchaValid.value = true;
        } else {
          captchaTFMController.errorMessage.value = "Invalid captcha";
          isCaptchaErrorMsgVisible.value = true;
          isCaptchaValid.value = false;
        }
      } else if (captchaStr.value.length > 4) {
        int currentPosition = captchaTFMController.controller
            .value.selection.start;
        captchaTFMController.controller.text =
            captchaStr.substring(0, 4);
        captchaTFMController.controller.selection =
            TextSelection.collapsed(
                offset: currentPosition);
        //Added by Kamran on 6-May-2020
        if ((captchaVal1.trim() +
            captchaVal2.trim() +
            captchaVal3.trim() +
            captchaVal4.trim())
            .compareTo(
            captchaTFMController.controller.text) ==
            0) {
          isCaptchaErrorMsgVisible.value = false;
          isCaptchaValid.value = true;
        } else {
          captchaTFMController.errorMessage.value = "Invalid captcha";
          isCaptchaErrorMsgVisible.value = true;
          isCaptchaValid.value = false;
        }
      }
    }
  }

  /// This method will respond if user taps on screen and check whether captcha is valid or not.
  void onTapGesture(){
    if (!isCaptchaGenerated.value) {
      generateCaptcha();
    }
    isCaptchaGenerated.value = false;
    if (captchaStr.value.isNotEmpty) {
      captchaTFMController.errorMessage.value = "Invalid captcha";
      isCaptchaErrorMsgVisible.value =
      true;
      isCaptchaValid.value = false;
    }
  }

  void onCaptchaSubmit(String value){
    if (!captchaTFMController.focusNode.hasFocus) {
      captchaTFMController.focusNode.unfocus();
    }
  }

}