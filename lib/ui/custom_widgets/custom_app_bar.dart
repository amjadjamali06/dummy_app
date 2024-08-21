import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/platform/platform_io.dart';

import '../../utils/app_colors.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  final String screenName;
  final double appBarHeight;
  final PreferredSize? bottomSheet;
  final Function? onBackButtonPress;
  const CustomAppbar({
    super.key,
    required this.screenName,
    required this.scaffoldKey,
    required this.onBackButtonPress,
    required this.appBarHeight,
    this.bottomSheet,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 65,
      automaticallyImplyLeading: GeneralPlatform.isWeb,
      leadingWidth: 65,
      leading: (screenName == "Dashboard Screen")?
      Container(
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            border: Border.all(color: kPrimaryColor),
            borderRadius: BorderRadius.circular(50)
        ),
        child: Image.asset('assets/icons/user-icon.png', color: kPrimaryColor, width: 18, height: 18,),
      ) : screenName.isNotEmpty ?
         IconButton(onPressed:() {
           if (onBackButtonPress != null) {
             onBackButtonPress!();
           }else{
             Get.back();
           }
         },icon: const Icon(Icons.arrow_back, color: kPrimaryColor, size: 25)):null,
        actions: [
          Padding(
            padding: const EdgeInsets.all(14),
            child: GestureDetector(
              child: Image.asset('assets/icons/menu-icon.png',color: kPrimaryColor, width: 32,),
            ),
          )
        ],
        // GestureDetector(
        //   child:  Padding(
        //     padding: const EdgeInsets.only(left: 12,top: 12),
        //     child: Column(
        //       crossAxisAlignment: CrossAxisAlignment.start,
        //       children: [
        //         Image.asset('assets/icons/menu_icon.png', height: 26, width: 34),
        //         const SizedBox(height: 2),
        //         const Text('Menu',style: TextStyle(fontSize: 10,fontWeight: FontWeight.w400))
        //       ],
        //     ),
        //   ),
        //   onTap: () {
        //     scaffoldKey.currentState!.openDrawer();
        //     FocusScope.of(context).requestFocus(FocusNode());
        //   },
        // ):null,
      title: Text(
        screenName == "Dashboard Screen"? "Excise App" : screenName,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500,  color: kWhiteColor),
      ),
      centerTitle: true,
      actionsIconTheme: const IconThemeData(),
      bottom: bottomSheet,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBarHeight);
}
