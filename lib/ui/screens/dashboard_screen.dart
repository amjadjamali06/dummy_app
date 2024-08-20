import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:excise_e_auction/controllers/dashboard_screen_controller.dart';
import 'package:excise_e_auction/utils/app_colors.dart';
import 'package:excise_e_auction/utils/user_session.dart';

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
          toolbarHeight: 90,
          backgroundColor: kPrimaryColor,
          automaticallyImplyLeading: false,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    decoration:  BoxDecoration(color: Colors.white,shape: BoxShape.circle,border: Border.all(color: const Color(0xff4A9F70),width: 1.5) ),
                    child: Center(
                      child: Stack(
                        children: [
                          Image.asset('assets/icons/profile-pic.png', height: 40, width: 40),
                           Positioned(
                            right: 0,top: 0,
                            child: Container(
                            height: 10,
                            width: 10,
                            decoration: const BoxDecoration(color: Color(0xff7FFF3B),shape: BoxShape.circle),
                              ),)
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(UserSession.userModel.value.name,style: const TextStyle(fontSize: 12,fontWeight: FontWeight.w400,color: Colors.white))
                ],
              ),
            )
          ],
           leading: GestureDetector(
              child:  Padding(
                padding: const EdgeInsets.only(left: 10,top: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset('assets/icons/menu_icon.png', height: 26, width: 34),
                    const SizedBox(height: 2),
                    const Text('Menu',style: TextStyle(fontSize: 11,fontWeight: FontWeight.w400,color: kWhiteColor))
                  ],
                ),
              ),
              onTap: () {
                controller.scaffoldKey.currentState!.openDrawer();
                FocusScope.of(context).requestFocus(FocusNode());
              },
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
          padding: EdgeInsets.only(top: Get.height*0.1,left: 20,right: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text("Main Menu",style: TextStyle(color: Color(0xff231F20),fontSize: 24,fontWeight: FontWeight.w400)),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _dashboardCard(title: "Dashboard",iconPath: 'assets/icons/dashboard_icon.png'),
                    const SizedBox(width: 10),
                    _dashboardCard(title: "Intake Registration",iconPath: 'assets/icons/Intake_Registration.png'),
                  ]
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _dashboardCard(title: "Reports",iconPath: 'assets/icons/Reports.png'),
                    const SizedBox(width: 10),
                    _dashboardCard(title: "GRM",iconPath: 'assets/icons/GRM.png'),],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _dashboardCard(title: "E-Memo",iconPath: 'assets/icons/e-memo.png'),
                    const SizedBox(width: 10),
                    _dashboardCard(title: "Task Management",iconPath: 'assets/icons/task_management.png'),],
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
            child: const Text(
            "Dashboard",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500,  color: kWhiteColor),
          ),
          ),
        )
      ],
    );
  }

   Expanded _dashboardCard({String title="Title",Color shadowColor=const Color(0xff0F663E), String iconPath='assets/icons/programs.png'}) {
    return Expanded(
      child: GestureDetector(
        onTap:()=> controller.onDashboardCardTap(title),
        child: Container(
          height: 160,
          decoration: BoxDecoration(color: const Color(0xffF4F3FF),borderRadius: BorderRadius.circular(20),
            boxShadow: [BoxShadow(color: shadowColor,blurRadius: 0,offset: const Offset(8, 6)),BoxShadow(color: shadowColor,blurRadius: 0,offset: const Offset(8, 0))]),
          margin: const EdgeInsets.only(right: 8,top: 20),
          padding: const EdgeInsets.all(10),
          child: Container(
            decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(20),
            boxShadow:  const [BoxShadow(color: Colors.black12,blurRadius: 10,offset: Offset(0, 10))]),
            padding: const EdgeInsets.all(5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(height: 60,width: 60,padding: const EdgeInsets.only(left: 7),child: Image.asset(iconPath)),
                const SizedBox(height: 5),
                Text(title,textAlign: TextAlign.center,overflow: TextOverflow.ellipsis,maxLines: 2,
                  style:  const TextStyle(fontSize: 13,fontWeight: FontWeight.w500,color: Color(0xff000000)))
              ],
            ),
          ),
        ),
      ),
    );
  }

}
