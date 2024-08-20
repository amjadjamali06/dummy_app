import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:excise_e_auction/controllers/login_screen_controller.dart';
import 'package:excise_e_auction/ui/custom_widgets/custom_heading_text.dart';
import 'package:excise_e_auction/ui/custom_widgets/custom_scaffold.dart';
import 'package:excise_e_auction/ui/custom_widgets/general_button.dart';
import 'package:excise_e_auction/utils/app_colors.dart';
import '../../utils/constants.dart';
import '../../utils/text_field_manager.dart';

class LoginScreen extends GetView<LoginScreenController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(className: runtimeType.toString(),
      screenName: '',
      scaffoldKey: controller.scaffoldKey,
      gestureDetectorOnTap: controller.removeFocus,
      onNotificationListener: (detail) {
        if(detail is UserScrollNotification) {
          controller.removeFocus();
        }
        return true;
      },
      body: _getBody());
  }

  Widget _getBody(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: Get.height*0.1),
        const CustomHeadingText(text: 'Sign In',headingColor: kBlackColor),
        SizedBox(height: Get.height*0.04),
        buildPasswordTextField(tfManager: controller.usernameTFMController,prefixIcon:'assets/icons/user_icon.png',suffixIcon: false ),
        const SizedBox(height: 24),
        buildPasswordTextField(tfManager: controller.passwordTFMController,prefixIcon:'assets/icons/pass_icon.png',suffixIcon: true, obscureText: controller.obscurePassword, ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Remember me next time',style: TextStyle(fontSize: 15,color: kBlackColor,fontWeight: FontWeight.w600),),
            Obx(()=> Switch(
              value: controller.rememberMe.value,
              onChanged: (_) => controller.rememberMe.toggle(),
            )),
        ],
      ),
        const SizedBox(height: 24),
        GeneralButton(onPressed: (){controller.onSignInPressed();},text: 'SIGN IN',color: kButtonGreenColor),
        const SizedBox(height: 16),
        const Text('Forgot your password?',style: TextStyle(fontSize: 16,color:  Color(0xff1560B7)),),
        const SizedBox(height: 40),


       // if(Platform.isIOS) biometricButton(onTab:()=> controller.onFaceIDPressed(), iconImage: 'assets/icons/face_verification.png',isVisible: BiometricAuth.isDeviceSupported ),
        // const SizedBox(height: 10),
        // Obx(()=> BiometricAuth.isDeviceSupported.value ? const Text('OR',style: TextStyle(fontSize: 25)):const SizedBox()),
        // const SizedBox(height: 10),
       // if(Platform.isAndroid) biometricButton(onTab:()=> controller.onFingerPrintPressed(), iconImage: 'assets/icons/biometric.png',isVisible: BiometricAuth.isDeviceSupported)
    ],);
}

  // Widget biometricButton({required String iconImage,required RxBool isVisible,Function()? onTab}) => Obx(()=>isVisible.value ? InkWell(onTap: onTab, child: Image.asset(iconImage,height: 70,width: 70)):const SizedBox());

  Widget buildPasswordTextField({
    Key? key, RxBool? obscureText,
    required TextFieldManager tfManager,
    required String prefixIcon,
    required bool suffixIcon
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric( vertical: kFieldVerticalMargin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Obx(() => Container(
              width: Get.width,
              margin: const EdgeInsets.only(top: 4),
              padding: const EdgeInsets.only(left: 8, right: 2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(kFieldRadius),
                border: Border.all(color: kFieldBorderColor),
                color: kWhiteColor,
              ),
              child: SizedBox(
                width: Get.width,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                      child: Image.asset(prefixIcon,scale: 1.3,)
                    ),
                    Expanded(
                      child: TextField(
                        keyboardType: tfManager.keyboardType,
                        maxLength: tfManager.length,
                        controller: tfManager.controller,
                        focusNode: tfManager.focusNode,
                        textCapitalization: tfManager.textCapitalization,
                        obscureText: obscureText!=null ? obscureText.value : false,
                        onChanged: (value) {
                          tfManager.validate();
                          // controller.passwordTFMController.errorMessage.value = controller.validatePassword(value);
                        },
                        textInputAction: TextInputAction.done,
                        inputFormatters: tfManager.formatters,
                        decoration: InputDecoration(
                          counterText: '',
                          hintText: tfManager.hint ?? tfManager.fieldName,
                          border: InputBorder.none,
                          hintStyle: const TextStyle(color: kTextHintColor),
                        ),
                        style: const TextStyle(color: kBlackColor),
                      ),
                    ),
                    GestureDetector(
                      onTap: ()=> controller.obscurePassword.value = !controller.obscurePassword.value,
                      child: Visibility(
                        visible: suffixIcon,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 11 ),
                          child: controller.obscurePassword.value ? const Icon(CupertinoIcons.eye_fill, color: kGreyColor) : const Icon(CupertinoIcons.eye_slash_fill, color: kGreyColor),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 4),
          Obx(() => Visibility(
            visible: tfManager.errorMessage.value.isNotEmpty,
            child: Text(
              tfManager.errorMessage.value,
              style: const TextStyle(color: kRequiredRedColor, fontSize: 12),
            ),
          )),
        ],
      ),
    );
  }

}

