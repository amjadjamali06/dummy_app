
import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:excise_e_auction/utils/app_colors.dart';
import '../services/service_urls.dart';


/*Created By: Amjad Jamali on 05-Aug-2023*/
class CommonCode {



  void showToast({required String message}) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: const Color(0xF9454141),
        textColor: Colors.white,
        fontSize: 13.0);
  }



  Future<bool> checkInternetConnection() async {
    var result = await Connectivity().checkConnectivity();
    return result == ConnectivityResult.mobile || result == ConnectivityResult.wifi;
  }

  Future<bool> checkInternetAccess() async {
    try {
      if(await checkInternetConnection()) {
        http.Response response =
        await http.get(Uri.parse("https://www.google.com/"))
            .timeout(const Duration(seconds: 5));
        return response.body.length > 4;
      }
    } catch (_) {}
    return false;
  }

  Future<bool> checkServerConnection() async {
    if(!(await checkInternetConnection())) {
      // showToast(message: kNoInternetMsg);
      return false;
    }
    try {
      http.Response response = (await http.get(Uri.parse(kConnectionCheckURL)).timeout(const Duration(seconds: 5)));
      if(response.statusCode != 200 && (await checkInternetConnection())) {
        CommonCode().showToast(message: "Unable to connect with server");
      }
      return response.statusCode == 200;

    } on TimeoutException catch (_) {
    return  false;
    }
    on Exception catch (_) {
      return false;
    }
  }

  Widget showProgressIndicator(bool visibility, bool isListEmpty) {
    return visibility ? Visibility(
        visible: visibility,
        child:  Padding(
            padding: EdgeInsets.only(top: isListEmpty ? Get.height*0.3 : 10),
            child: Center(child: SizedBox(width: isListEmpty ? null : 20, height: isListEmpty ? null : 20, child: const CircularProgressIndicator(color: kPrimaryColor,strokeWidth: 2))))
    ) : Visibility(
      visible: isListEmpty,
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.only(top: Get.height*0.3),
        child: Column(
          children: [
            Image.asset('assets/icons/empty-list.png', width: 120, color: kFieldShadowColor,),
            const Text('No Data Found!', style: TextStyle(fontSize: 22, color: kFieldShadowColor, fontWeight: FontWeight.bold),),
          ],
        ),
      ),
    );
  }





  ///
  /// This method check for latest version on Database and Navigate user to Play Store for Update Application.
  /// - If version is necessary then Popup will not be removed until App is Updated.
  ///
  // Future<void> checkForUpdate() async {
  //   PackageInfo packageInfo = await PackageInfo.fromPlatform();
  //   String appVersion = packageInfo.version;
  //   VersionCheckModel latestVersion = await GeneralService().getVersionData();
  //   if (Platform.isAndroid && latestVersion.androidVersion.isNotEmpty) {
  //     String version = latestVersion.androidVersion;
  //     if (appVersion.compareTo(version).isNegative) {
  //       CustomDialogs().showDialog(
  //           "Version Update Available",
  //           "New version $version is available.\n${latestVersion.isNecessary?'It is Necessary to':'Please'} Update it.",
  //           DialogType.SUCCES,
  //           const Color(kPrimaryColor),
  //           dismissible: !(latestVersion.isNecessary),
  //           onOkBtnPressed: openStore);
  //     }
  //   }
  // }

  // void openStore() {
  //   launchUrl(//https://play.google.com/store/apps/details?id=pk.gos.spsu.mobileApp
  //     Uri.parse("market://details?id=pk.gos.spsu.mobileApp"),
  //     mode: LaunchMode.externalNonBrowserApplication,
  //   );
  // }


}
