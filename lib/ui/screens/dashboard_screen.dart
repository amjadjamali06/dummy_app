import 'dart:io';
import 'package:excise_e_auction/ui/custom_widgets/custom_dashboard_card_widget.dart';
import 'package:excise_e_auction/utils/constants.dart';
import 'package:excise_e_auction/utils/user_session.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:excise_e_auction/controllers/dashboard_screen_controller.dart';
import 'package:excise_e_auction/utils/app_colors.dart';
import '../custom_widgets/custom_dialogs.dart';

class DashboardScreen extends GetView<DashboardScreenController> {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){
        CustomDialogs().showAwesomeConfirmationDialog("Are you sure you want to exit?",onOkBtnPressed: ()=>exit(0));
        return Future.value(false);
      },
      child: Scaffold(
        // drawer: const CustomEndDrawer(),
        key: controller.scaffoldKey,
        appBar: AppBar(
          elevation: 0,
          toolbarHeight: 120,
          backgroundColor: kPrimaryColor,
          automaticallyImplyLeading: false,
          actions: [
            GestureDetector(
              child:  Padding(
                padding: const EdgeInsets.only(right: 10,top: 30),
                child: Image.asset('assets/icons/toggle-white-icon.png', height: 35, width: 34),
              ),
              onTap: () {
                controller.scaffoldKey.currentState!.openDrawer();
                FocusScope.of(context).requestFocus(FocusNode());
              },
            ),

          ],
           title: Container(
             padding: const EdgeInsets.all(5.0),
             decoration:  BoxDecoration(color: Colors.white,shape: BoxShape.circle,border: Border.all(color: const Color(0xff4A9F70),width: 1.5) ),
             child: Stack(
               children: [
                 Image.asset('assets/icons/user-icon.png', height: 55, width: 55),
                 Positioned(
                   right: 0,top: -5,
                   child: Container(
                     height: 20,
                     width: 11,
                     decoration: const BoxDecoration(color: Color(0xff7FFF3B),shape: BoxShape.circle),
                   ),)
               ],
             ),
           ),
        ),
        body: _buildBody(),
      ),
    );
  }
Widget  _buildBody() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Padding(
          padding: EdgeInsets.only(top: Get.height*0.1),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text("Home",style: TextStyle(color: Color(0xff231F20),fontSize: 24,fontWeight: FontWeight.w400)),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomDashboardCardWidget(title: "Online\n Tax Payment", iconPath: 'assets/icons/online-tax-payment.png', onTap: () {},),
                    CustomDashboardCardWidget(title: "Vehicle\n Verification",iconPath: 'assets/icons/vehicle-verification.png', onTap: (){},),
                  ]
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomDashboardCardWidget(title: "Tax\n Calculator",iconPath: 'assets/icons/tax-calculator.png', onTap: (){}),
                    CustomDashboardCardWidget(title: "Search\n History",iconPath: 'assets/icons/search-history.png', onTap: (){}),],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const SizedBox(width: 10),
                    CustomDashboardCardWidget(title: "E-Auction",iconPath: 'assets/icons/online-payment 2.png', onTap: (){Get.toNamed(kEAuctionScreenRoute);}),
                  ],
                ),
                SizedBox(height: Get.height*0.1),
              ],
            ),
          ),
        ),
        Positioned(
          top: -5,
          child: Container(
           height: Get.height*0.07,
           width: Get.width,
           padding: const EdgeInsets.only(bottom: 20),
           alignment: Alignment.bottomCenter,
            decoration: const BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
            ),
            child: RichText(
              text: TextSpan(
                text: 'Welcome, ',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w300
                ),
                children: [
                  TextSpan(
                    text: UserSession.userModel.value.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold
                    )
                  )
                ]
              ),
            )
          ),
        )
      ],
    );
  }


}
