import 'dart:io';
import 'package:excise_e_auction/controllers/custom_widget_controllers/custom_bottom_nav_bar_controller.dart';
import 'package:excise_e_auction/ui/custom_widgets/custom_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:excise_e_auction/ui/custom_widgets/custom_app_bar.dart';
import 'package:excise_e_auction/utils/app_colors.dart';
import 'custom_dialogs.dart';

/*Created By: Amjad Jamali on 05-Aug-2023*/
class CustomScaffold extends StatefulWidget {

  final Widget body;
  final String className,screenName;
  final Function? onWillPop,
      gestureDetectorOnTap,
      onBackButtonPressed,
      gestureDetectorOnPanDown,
      onAddPressed,
      onNotificationListener;
  final Future<void> Function()? onRefresh;
  final ScrollController? scrollController;
  final double horizontalPadding;
  final GlobalKey<ScaffoldState> scaffoldKey;
  final double appBarHeight;
  final PreferredSize? bottomSheet;
  final bool showBottomNavBar;


  const CustomScaffold({super.key,
    required this.className,
    required this.screenName,
    this.onWillPop,
    this.onBackButtonPressed,
    this.gestureDetectorOnPanDown,
    this.gestureDetectorOnTap,
    this.onNotificationListener,
    this.onAddPressed,
    this.onRefresh,
    required this.scaffoldKey,
    required this.body,
    this.scrollController,
    this.horizontalPadding=20,
    this.appBarHeight = 80,
    this.bottomSheet,
    this.showBottomNavBar = true,
  });

  @override
  _CustomScaffoldState createState() => _CustomScaffoldState();
}

class _CustomScaffoldState extends State<CustomScaffold> {

  @override
  Widget build(BuildContext context) {

    return WillPopScope(
        onWillPop: (){
          CustomBottomNavBarController.selectedIndex.value = 0;
          if(widget.className == "DashboardScreen"|| widget.className == "LoginScreen"){
            if(widget.scaffoldKey.currentState!.isDrawerOpen){
              Get.back();
            }else {
              CustomDialogs().showAwesomeConfirmationDialog("Are you sure you want to exit?",onOkBtnPressed: ()=>exit(0));
            }
            return Future.value(false);
          }else{
            if(widget.onWillPop!=null) {
              return widget.onWillPop!();
            } else {
              return Future.value(true);
            }
          }
        },
        child: GestureDetector(
          onTap: (){
            if(widget.gestureDetectorOnTap != null){
              widget.gestureDetectorOnTap!();
            }
          },
          onPanDown: (panDetails){
            if(widget.gestureDetectorOnPanDown!= null){
              widget.gestureDetectorOnPanDown!(panDetails);
            }
          },
          child: NotificationListener(
            onNotification: (notificationInfo){
              if(widget.onNotificationListener!=null) {
                return widget.onNotificationListener!(notificationInfo);
              } else {
                return false;
              }
            },
            child: Scaffold(
              backgroundColor: kPrimaryDarkColor,
              // extendBody: true,
              resizeToAvoidBottomInset: true,
              key: widget.scaffoldKey,
              appBar: CustomAppbar(screenName: widget.screenName, scaffoldKey: widget.scaffoldKey, appBarHeight: widget.appBarHeight, bottomSheet: widget.bottomSheet,onBackButtonPress: widget.onBackButtonPressed),
              body: Container(
                height: Get.height,
                width: Get.width,
                decoration: const BoxDecoration(
                  color: kPrimaryDarkColor,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40)),
                ),
                child: Stack(
                children: [
                widget.onRefresh != null
                    ? RefreshIndicator(
                    onRefresh: widget.onRefresh!,
                  color: kPrimaryColor,
                  child: ListView(
                    controller: widget.scrollController,
                      // physics: const BouncingScrollPhysics(),
                      padding: EdgeInsets.only(bottom:  widget.onAddPressed == null ? 16 : 64, left: widget.horizontalPadding, right: widget.horizontalPadding),
                    children: [
                      widget.body
                    ],
                  ),
                ) : SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.only(bottom:  widget.onAddPressed == null ? 16 : 64, left: widget.horizontalPadding, right: widget.horizontalPadding),
                  child:widget.body,
                ),
                // bottomNavigationBar: const CustomBottomNavBar(),
                // endDrawer: isDrawerVisible ?const CustomNavigationDrawer():null,
                ]
                ),
              ),
              floatingActionButton: widget.onAddPressed == null ? null : FloatingActionButton(
                onPressed:()=> widget.onAddPressed!(),
                backgroundColor: kButtonColor,
                shape: const CircleBorder(),
                child: const Icon(Icons.add,color: kWhiteColor, size: 32),
              ),
              bottomNavigationBar: widget.showBottomNavBar? const CustomBottomNavBar():null,
              // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
            ) ,
          ),
        ));
  }

}