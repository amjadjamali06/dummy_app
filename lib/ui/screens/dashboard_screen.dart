import 'dart:io';
import 'package:excise_e_auction/utils/user_session.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:excise_e_auction/controllers/dashboard_screen_controller.dart';
import 'package:excise_e_auction/utils/app_colors.dart';
import 'package:intrinsic_grid_view/intrinsic_grid_view.dart';
import '../custom_widgets/custom_bottom_nav_bar.dart';
import '../custom_widgets/custom_dashboard_card_widget.dart';
import '../custom_widgets/custom_dialogs.dart';
import '../custom_widgets/custom_end_drawer.dart';

class DashboardScreen extends GetView<DashboardScreenController> {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){
        CustomDialogs().showAwesomeConfirmationDialog("Are you sure you want to exit?",onOkBtnPressed: ()=>exit(0));
        return Future.value(false);
      },
      child: GestureDetector(
        onTap: controller.removeFocus,
        child: Scaffold(
          endDrawer: const CustomEndDrawer(),
          key: controller.scaffoldKey,
          appBar: AppBar(
              backgroundColor: kPrimaryColor,
              elevation: 0,
              toolbarHeight: 60,
              automaticallyImplyLeading: false,
              actions: [
                GestureDetector(
                  child:  Stack(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 0, right: 0, top: 20),
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            border: Border.all(color: kWhiteColor),
                            borderRadius: BorderRadius.circular(50)
                        ),
                        child: const Icon(Icons.notifications, color: kWhiteColor,),
                      ),
                      Positioned(
                        right:2,top: 20,
                        child: Container(
                          height: 10,
                          width: 5,
                          decoration: const BoxDecoration(color: kRejectedColor,shape: BoxShape.circle),
                        ),)
                    ],
                  ),
                  onTap: () {

                  },
                ),
                GestureDetector(
                  child:  Container(
                    width: 38,
                    height: 38,
                    margin: const EdgeInsets.only(right: 10, top: 20, left:5),
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        // color: kWhiteColor,
                        border: Border.all(color: kWhiteColor),
                        borderRadius: BorderRadius.circular(50)
                    ),
                    child: Image.asset('assets/icons/menu-new.png', color: kWhiteColor,),
                  ),
                  onTap: () {
                    controller.scaffoldKey.currentState!.openEndDrawer();
                    FocusScope.of(context).requestFocus(FocusNode());
                  },
                ),
              ],
              flexibleSpace:  Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [kPrimaryDarkColor, kPrimaryLightColor],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                ),),
              title: _buildTextField()

          ),
          body: _buildBodyOldTheme(),
          bottomNavigationBar: const CustomBottomNavBar(),
        ),
      ),
    );
  }


  Widget  _buildBodyOldTheme() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Padding(
            padding: EdgeInsets.only(top: Get.height*0.14),
            child: SingleChildScrollView(
              child: IntrinsicGridView.vertical(
                columnCount: 2,
                horizontalSpace: 20,
                verticalSpace: 20,
                margin: const EdgeInsets.only(left: 20, top: 30, right: 20),
                children: [
                  CustomDashboardCardWidget(title: "Online\n Tax Payment", iconPath: 'assets/icons/online-tax-payment.png', onTap: controller.onTapItem),
                  CustomDashboardCardWidget(title: "Vehicle\n Verification",iconPath: 'assets/icons/vehicle-verification.png', onTap: controller.onTapItem,),
                  CustomDashboardCardWidget(title: "Tax\n Calculator",iconPath: 'assets/icons/tax-calculator.png', onTap: controller.onTapItem),
                  CustomDashboardCardWidget(title: "Search\n History",iconPath: 'assets/icons/search-history.png', onTap: controller.onTapItem),
                  CustomDashboardCardWidget(title: "Auction",iconPath: 'assets/icons/online-payment 2.png', onTap: controller.onTapItem),
                ],),
            )
        ),

        Positioned(
          top: -5,
          child: Container(
              height: Get.height* 0.15,
              width: Get.width,
              padding: const EdgeInsets.only(top: 10, left: 15),
              alignment: Alignment.bottomLeft,
              decoration: const BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
                  gradient: LinearGradient(
                      colors: [kPrimaryDarkColor, kPrimaryLightColor],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight
                  )
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Hello,", style:  TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w300,
                    color: kWhiteColor
                  ),),
                  Row(
                    children: [
                      Text(UserSession.userModel.value.name, style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                        color: kWhiteColor
                      ),),
                      Image.asset('assets/icons/waving-hand.png', width: 30,)
                    ],
                  )
                ],
              )
          ),
        )
      ],
    );
  }

  Widget _buildTextField() {
    return Container(
      height: 40,
      width: Get.width * 0.7,
      margin: const EdgeInsets.only(top: 20, left: 0, right: 0),
      decoration: BoxDecoration(
        border: Border.all(color: kWhiteColor),
        borderRadius: BorderRadius.circular(50),
      ),
      child: TextField(
        controller: controller.searchTF.controller,
        focusNode: controller.searchTF.focusNode,
        onChanged: controller.onSearchTFChanged,
        textCapitalization: controller.searchTF.textCapitalization,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          hintText: controller.searchTF.hint ?? controller.searchTF.fieldName,
          contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          border: InputBorder.none,
          hintStyle: const TextStyle(color: kWhiteColor),
        ),
        style: const TextStyle(
          color: kTextColor,
          decorationColor: kPrimaryColor,
        ),
        // textAlign: TextAlign.center, // Center the text horizontally
      ),
    );
  }

}