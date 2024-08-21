
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:excise_e_auction/controllers/login_screen_controller.dart';
import 'package:excise_e_auction/ui/custom_widgets/general_button.dart';
import 'package:excise_e_auction/utils/app_colors.dart';
import '../../utils/constants.dart';
import '../../utils/text_field_manager.dart';

class LoginScreen extends GetView<LoginScreenController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(key: controller.scaffoldKey,
      backgroundColor: kPrimaryDarkColor,
      body: _getBody(),
    );
  }

  Widget _getBody(){
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
              child: Image.asset('assets/images/login-header4.png',height: Get.height*0.3,width: Get.width, fit: BoxFit.cover,),
            ),
          ),

          SizedBox(height: Get.height*0.05),

          const Text('Welcome Back',
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color:kWhiteColor,
            ),
          ),
          SizedBox(height: Get.height*0.02),
          const Text('Login to your account',
            style: TextStyle(
              // fontSize: 32,
              // fontWeight: FontWeight.bold,
              color:kWhiteColor,
            ),
          ),
          SizedBox(height: Get.height*0.04),
          buildPasswordTextField(tfManager: controller.usernameTFMController,prefixIcon:Icons.person,suffixIcon: false ),
          const SizedBox(height: 12),
          buildPasswordTextField(tfManager: controller.passwordTFMController,prefixIcon:Icons.lock,suffixIcon: true, obscureText: controller.obscurePassword, ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Remember me next time',style: TextStyle(fontSize: 15,color: kLightGreyColor,fontWeight: FontWeight.w600),),
                Obx(()=> Switch(
                  value: controller.rememberMe.value,
                  onChanged: (_) => controller.rememberMe.toggle(),
                )),
            ],
                  ),
          ),
          const SizedBox(height: 24),
          GeneralButton(onPressed: (){controller.onSignInPressed();},text: 'SIGN IN',color: kButtonColor,margin: 32),
          const SizedBox(height: 12),
          const Text('Forgot Password?',style: TextStyle(fontSize: 16,color: kLightGreyColor,decoration: TextDecoration.underline,decorationColor: kLightGreyColor)),
          const SizedBox(height: 40),


         // if(Platform.isIOS) biometricButton(onTab:()=> controller.onFaceIDPressed(), iconImage: 'assets/icons/face_verification.png',isVisible: BiometricAuth.isDeviceSupported ),
          // const SizedBox(height: 10),
          // Obx(()=> BiometricAuth.isDeviceSupported.value ? const Text('OR',style: TextStyle(fontSize: 25)):const SizedBox()),
          // const SizedBox(height: 10),
         // if(Platform.isAndroid) biometricButton(onTab:()=> controller.onFingerPrintPressed(), iconImage: 'assets/icons/biometric.png',isVisible: BiometricAuth.isDeviceSupported)
      ],),
    );
}

  // Widget biometricButton({required String iconImage,required RxBool isVisible,Function()? onTab}) => Obx(()=>isVisible.value ? InkWell(onTap: onTab, child: Image.asset(iconImage,height: 70,width: 70)):const SizedBox());

  Widget buildPasswordTextField({
    Key? key, RxBool? obscureText,
    required TextFieldManager tfManager,
    required IconData prefixIcon,
    required bool suffixIcon
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric( vertical: kFieldVerticalMargin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Obx(() => Container(
              width: Get.width*0.82,
              margin: const EdgeInsets.only(top: 4),
              padding: const EdgeInsets.only(left: 8, right: 2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(kFieldRadius),
                border: Border.all(color: kFieldBorderColor),
                color: kFieldBGColor,
                // gradient:  const LinearGradient(colors: [kPrimaryLightColor,kPrimaryColor])
              ),
              child: SizedBox(
                width: Get.width,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                      child: Icon(prefixIcon,color: kTextHintColor,size: 32),
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
                        style: const TextStyle(color: kTextColor,decorationColor: kPrimaryColor),
                      ),
                    ),
                    GestureDetector(
                      onTap: ()=> controller.obscurePassword.value = !controller.obscurePassword.value,
                      child: Visibility(
                        visible: suffixIcon,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 11 ),
                          child: controller.obscurePassword.value ? const Icon(CupertinoIcons.eye_fill, color: kTextHintColor) : const Icon(CupertinoIcons.eye_slash_fill, color: kTextHintColor),
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
              style: const TextStyle(color: kRejectedColor, fontSize: 12),
            ),
          )),
        ],
      ),
    );
  }

}

