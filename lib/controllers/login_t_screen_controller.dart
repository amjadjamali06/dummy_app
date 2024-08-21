/*Created by Afaque Ali on 21-Aug-2024*/

import 'dart:async';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:excise_e_auction/ui/custom_widgets/custom_dialogs.dart';
import 'package:excise_e_auction/utils/common_code.dart';
import 'package:excise_e_auction/utils/user_session.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/constants.dart';

class LoginTScreenController extends GetxController with GetSingleTickerProviderStateMixin{
  RxString emailString = ''.obs;
  RxBool isRememberMe = false.obs;

  RxString emailStr = "".obs,
      passwordStr = "".obs,
      emailErrorMsg = "Email is required".obs;
  RxBool isEmailErrorMsgVisible = false.obs,
      isPasswordErrorMsgVisible = false.obs,
      isPasswordTextObscure = true.obs;
  bool isFirstTimeOnScreen = true;
  UserSession _userSession = UserSession();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  late AnimationController controllerOfAnimation;
  late Animation<double> animation;
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  RxInt top = (-100).obs;
  RxInt left = (-100).obs;

  List<String> _emailList = [];

  @override
  void onInit() {

    if (isFirstTimeOnScreen) {
      _userSession.isUserLoggedIn().then((isRem) {
        if (isRem) {
          isRememberMe.value = isRem;
        } else {
          isRememberMe.value = false;
        }
      });
      isFirstTimeOnScreen = false;
    }

    controllerOfAnimation = AnimationController(
      duration: const Duration(seconds: 30), // Adjust the duration as needed
      vsync: this,
    )..repeat(); // Repeat the animation forever

    animation = Tween<double>(
      begin: 0,
      end: 1, // Move the image to the left
    ).animate(
        CurvedAnimation(parent: controllerOfAnimation, curve: Curves.linear));

    super.onInit();
  }

  @override
  void dispose() {
    passwordFocusNode.dispose();
    emailFocusNode.dispose();
    emailController.dispose();
    emailString.value = '';
    super.dispose();
  }

  // void onEmailSubmit(String value){
  //   if (emailFocusNode.hasFocus) {
  //     emailFocusNode.unfocus();
  //     if (!passwordFocusNode.hasFocus) {
  //       passwordFocusNode.requestFocus();
  //     }
  //   }
  // }

  /// This method will respond any change in the email field and check whether email is valid or not.
  void onEmailChange(String value){
    if ('@'.allMatches(value.trim()).length > 1) {
      //value = emailStr;
    } else {
      emailStr.value = value.trim();
    }
    if (emailStr.value.isEmpty) {
      emailErrorMsg.value = "Email is required";
      isEmailErrorMsgVisible.value = true;
      passwordController.value =
          passwordController.value.copyWith(
            selection: TextSelection.fromPosition(
                TextPosition(offset: 0)),
            text: "",);

    } else {

      if ('@'.allMatches(value.trim()).length >
          1) {
        _updateEmailLength(
            emailStr.value,
            emailController
                .selection.baseOffset,
            false);
      } else {
        _updateEmailLength(
            value,
            emailController
                .selection.baseOffset,
            true);
      }
      Pattern pattern =
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@'
          r'((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
      RegExp regex = new RegExp(pattern.toString());
      if (regex
          .hasMatch(emailController.text)) {
        isEmailErrorMsgVisible.value = false;
      } else {
        emailErrorMsg.value = "Invalid Email";
        isEmailErrorMsgVisible.value = true;
      }

    }
  }

  /// This method will respond any change in the email field and check whether email is valid or not.
  void _updateEmailLength(String text, int cursorPosition, bool isMoveCursor) {
    if (text.isNotEmpty) {
      String emailFistPart = '', emailLastPart = '', textFieldValue = '';
      List<String> splitValues = text.split('@');
      if (splitValues.length > 0) {
        emailFistPart = splitValues[0];
        if (splitValues.length > 1) {
          emailLastPart = splitValues[1];
          _emailList.add(text);
        } else {
          // get Last email Part
          String lastTypeEmail =
          _emailList.length > 0 ? _emailList[_emailList.length - 1] : '';
          if (lastTypeEmail.contains('@')) {
            if (!lastTypeEmail.endsWith('@')) {
              // check here
              // get position of cursor from last Email
              int index = lastTypeEmail.indexOf('@');
              emailLastPart = emailFistPart.substring(index);
              emailFistPart = emailFistPart.substring(0, index);
            }
          }
        }
        if (emailFistPart.length > 64) {
          String value = '';
          if (cursorPosition < emailFistPart.length) {
            //means new item is insert in middle
            value = emailFistPart.substring(0, cursorPosition - 1) +
                emailFistPart.substring(cursorPosition, emailFistPart.length);
            emailFistPart = value;
            cursorPosition--;
          } else {
            emailFistPart = emailFistPart.substring(0, 64);
            cursorPosition--;
          }
        }
        if (emailLastPart.length > 191) {
          emailLastPart = emailLastPart.substring(0, 191);
        }
        int currentPosition = emailController.value.selection.start;
        if ('@'.allMatches(text).length > 1) {
          textFieldValue = emailString.value;
          emailStr = emailString;
          currentPosition = currentPosition - 1;
        } else {
          textFieldValue = emailLastPart.length > 0
              ? (emailFistPart + "@" + emailLastPart)
              : text.contains('@') ? emailFistPart + '@' : emailFistPart;
          emailString.value = textFieldValue;
          emailStr = emailString;
          if (!isMoveCursor) {
            currentPosition = currentPosition - 1;
          }
        }
        emailController.value = emailController.value.copyWith(
            text: textFieldValue,
            selection: TextSelection.collapsed(offset: currentPosition),
            composing: TextRange.empty);
      }
    }
  }

  /// This method will respond any change in the password field and check whether password is valid or not.
  void onPasswordChange(String value){
    passwordStr.value = value.trim();
    if (passwordStr.value.length == 0) {
      if (value.endsWith(' ')) {
        passwordController.clear();
      }
      isPasswordErrorMsgVisible.value = true;
    } else {
      if (value.endsWith(' ')) {
        passwordController.text =
            passwordController.text.trim();
        passwordController.selection =
            TextSelection.fromPosition(
                TextPosition(
                    offset: passwordController
                        .text.length));
      } else if (value.contains(" ")) {
        int currentPosition = value.indexOf(" ");
        passwordController.text =
            passwordController.text
                .replaceAll(" ", "");

        passwordController.selection =
            TextSelection.collapsed(
                offset: currentPosition);
        passwordStr.value = passwordController.text;
      }
      isPasswordErrorMsgVisible.value = false;

    }
  }

  /// This method will respond when user taps on remember me checkbox.
  void onRememberMeTap(bool newValue){
    isRememberMe.value = newValue;
  }

  /// This method will navigate user to forget password screen.
  void goToForgotPasswordScreen(){}

  /// This method will respond when user presses login button.
  Future<void> loginUser() async{
    Get.toNamed(kDashboardScreenRoute);
  }

  /// This method will respond when user presses login button.
  void onLoginTap(){
    removeFocus();
    CommonCode().checkInternetConnection().then((internet) {
      if (internet) {
        loginUser();
      } else {
        CustomDialogs().showDialog('Alert',
            'Please connect to internet', DialogType.error);
      }
    });
  }


  /// This method will remove focus from email / password or captcha focus node.
  void removeFocus(){
    if(emailFocusNode.hasFocus){
      emailFocusNode.unfocus();
    }
    if(passwordFocusNode.hasFocus){
      passwordFocusNode.unfocus();
    }
  }
}