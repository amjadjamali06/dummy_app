/*Created by Afaque Ali on 21-Aug-2024*/

import 'package:excise_e_auction/controllers/login_t_screen_controller.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:excise_e_auction/utils/app_colors.dart';

class LoginTScreen extends GetView<LoginTScreenController> {
  const LoginTScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kGreyColor,
      body: _getBody(),
    );
  }

  Widget _getBody() {
    return AnimatedBuilder(
      animation: controller.controllerOfAnimation,
      builder: (context, child) {
        return SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Stack(
            children: [
              customAnimationCode(context),
              Container(
                height: Get.height,
                width: Get.width,
                padding: const EdgeInsets.only(top: 15),
                child: Stack(
                  children: [
                    Center(
                      child: Container(
                        padding: const EdgeInsets.only(top: 80),
                        width: Get.width * 0.7,
                        height: Get.height * 0.45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: kBlackColor.withOpacity(0.4),
                        ),
                        child: Column(
                          children: [
                            customTextField(
                              hint: "EMAIL ID",
                              icon: Icons.person,
                              textController: controller.emailController
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            customTextField(
                              hint: "Password",
                              icon: Icons.lock,
                              textController: controller.passwordController
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Expanded(
                                    flex: 2,
                                    child: Container(
                                      padding: const EdgeInsets.only(
                                          top: 0, left: 0, right: 10),
                                      child: Row(
                                        children: <Widget>[
                                          Expanded(
                                            flex: 1,
                                            child: Obx(
                                              () => Checkbox(
                                                value: controller.isRememberMe.value,
                                                activeColor: kWhiteColor,
                                                checkColor: kBlackColor,
                                                onChanged: (bool? newValue) {
                                                  controller.onRememberMeTap(newValue!);
                                                },
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 2,
                                            child: Container(
                                              padding: const EdgeInsets.only(
                                                  top: 3, left: 0, right: 0),
                                              child: const Text(
                                                'Remember Me',
                                                textDirection:
                                                    TextDirection.ltr,
                                                style: TextStyle(
                                                    fontSize: 10,
                                                    height: 1.2,
                                                    fontFamily: "PoppinsLight",
                                                    color: kWhiteColor),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: RichText(
                                      textAlign: TextAlign.right,
                                      text: TextSpan(children: <TextSpan>[
                                        const TextSpan(text: ""),
                                        TextSpan(
                                          text: "Forgot your password?",
                                          style: const TextStyle(
                                              fontSize: 10,
                                              height: 1.2,
                                              letterSpacing: 0.08,
                                              fontFamily: "PoppinsLight",
                                              color: kWhiteColor),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {
                                              controller
                                                  .goToForgotPasswordScreen();
                                            },
                                        ),
                                      ]),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 458,
                      left: 90,
                      child: Container(
                        // padding: const EdgeInsets.only(top: 80),
                        width: Get.width * 0.5,
                        height: Get.height * 0.05,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(10.0),
                              bottomRight: Radius.circular(10.0)),
                          color: kBlackColor.withOpacity(0.4),
                          // border: Border.all(color: kWhiteColor, width: 0.5),
                        ),
                        child: const Center(
                            child: Text(
                          "LOGIN",
                          style: TextStyle(
                              color: kWhiteColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        )),
                      ),
                    ),
                    Positioned(
                      top: 120,
                      left: 130,
                      child: Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          color: kDarkBlueColor,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: const Icon(
                          Icons.person_outlined,
                          size: 70,
                          color: kWhiteColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Positioned customAnimationCode(BuildContext context) {
    return Positioned.fill(
      child: Stack(
        children: [
          Transform.translate(
            offset:
                Offset(-MediaQuery.of(context).size.width * controller.animation.value, 0),
            child: Image.asset(
              "assets/images/red_car.webp",
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
          ),
          Transform.translate(
            offset: Offset(
                -MediaQuery.of(context).size.width * controller.animation.value +
                    MediaQuery.of(context).size.width,
                0),
            child: Image.asset(
              "assets/images/licence_plate_two.png",
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
          ),
        ],
      ),
    );
  }

  Widget customTextField({
    required String hint,
    required IconData icon,
    required TextEditingController textController,
  }) {
    return Container(
      height: Get.width / 8,
      width: Get.width / 1.3,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Container(
            height: Get.width / 8,
            width: Get.width / 8,
            color: kDarkBlueColor,
            child: Icon(
              icon,
              color: kWhiteColor,
            ),
          ),
          // SizedBox(width: 4,),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              color: kTextFieldBlueColor,
              child: TextField(
                onChanged: (value){
                  if(hint.toLowerCase().contains("email")){
                    controller.onEmailChange(value);
                  }
                },
                controller: textController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: hint,
                  hintStyle: const TextStyle(
                      color: kWhiteColor, fontWeight: FontWeight.w400),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
