
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
import 'package:intl/intl.dart';
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

  String convert({required double value}) {
    String TEMPLATE = '';
    String FORMATTEDVALUE =NumberFormat.currency(locale: 'en_us', decimalDigits: 2, name: '')
        .format(value)
        .replaceAll(',', '')
        .trim();
    for (int k = 0; k < 18 - FORMATTEDVALUE.length; k++) {
      TEMPLATE += '0';
    }
    TEMPLATE += FORMATTEDVALUE;
    String CONVERTEDNUMBER = '';
    for (int k = 0; k <= 15; k += 3) {
      double currentValue =double.parse((TEMPLATE[k] + TEMPLATE[k + 1] + TEMPLATE[k + 2]));
      CONVERTEDNUMBER += numberConverter(value: currentValue);
      if (k == 0 && CONVERTEDNUMBER != '') {
        int _val = int.parse((TEMPLATE[0] + TEMPLATE[1] + TEMPLATE[2]));
        if (_val == 1) {
          CONVERTEDNUMBER += ' Trillion' +
              (NextNumbers().getTrillion(template: TEMPLATE) > 0
                  ? ' and '
                  : '');
        } else if (_val > 1) {
          CONVERTEDNUMBER += ' Trillion' +
              (NextNumbers().getTrillion(template: TEMPLATE) > 0
                  ? ' and '
                  : '');
        }
      } else if (k == 3 && CONVERTEDNUMBER != '') {
        int _val = int.parse((TEMPLATE[3] + TEMPLATE[4] + TEMPLATE[5]));
        if (_val == 1) {
          CONVERTEDNUMBER += ' Billion' +
              (NextNumbers().getBillion(template: TEMPLATE) > 0
                  ? ' and '
                  : '');
        } else if (_val > 1) {
          CONVERTEDNUMBER += ' Billion' +
              (NextNumbers().getBillion(template: TEMPLATE) > 0
                  ? ' and '
                  : '');
        }
      } else if (k == 6 && CONVERTEDNUMBER != '') {
        int _val = int.parse((TEMPLATE[6] + TEMPLATE[7] + TEMPLATE[8]));
        if (_val == 1) {
          CONVERTEDNUMBER += ' Million' +
              (NextNumbers().getMillion(template: TEMPLATE) > 0
                  ? ' and '
                  : '');
        } else if (_val > 1) {
          CONVERTEDNUMBER += ' Million' +
              (NextNumbers().getMillion(template: TEMPLATE) > 0
                  ? ' and '
                  : '');
        }
      } else if (k == 9 && CONVERTEDNUMBER != '') {
        int _val = int.parse((TEMPLATE[9] + TEMPLATE[10] + TEMPLATE[11]));
        if (_val > 0) {
          if (CONVERTEDNUMBER.toUpperCase().contains('One')) {
            CONVERTEDNUMBER = 'One Thousand' +
                (NextNumbers().getThousand(template: TEMPLATE) > 0
                    ? ' and '
                    : '');
          } else {
            CONVERTEDNUMBER += ' Thousand' +
                (NextNumbers().getThousand(template: TEMPLATE) > 0
                    ? ' and '
                    : '');
          }
        }
      } else if (k == 12) {
        int _cents = int.parse((TEMPLATE[16] + TEMPLATE[17])); //CENTS
        if (_cents > 0 && CONVERTEDNUMBER != '') {
          CONVERTEDNUMBER += ' and ';
        }
      } else if (k == 15) {
        int _val = int.parse((TEMPLATE[16] + TEMPLATE[17]));
        if (_val == 1) {
          CONVERTEDNUMBER += ' CENT';
        } else if (_val > 1) {
          CONVERTEDNUMBER += ' CENTS';
        }
      }
    }
    return CONVERTEDNUMBER;
  }
  String numberConverter({required double value}) {
    if (value < 0) {
      return '';
    }
    else if(value ==0){

      return '';
    }
    String AGGREGATER = '';
    if (value > 0 && value < 1) {
      value *= 100;
    }
    String TEMPLATE = '';
    String FORMATTEDVALUE =
    NumberFormat.currency(locale: 'en_us', decimalDigits: 0, name: '')
        .format(value)
        .replaceFirst(',', '')
        .replaceFirst('.', '')
        .trim();
    int leng = ('000'.length - FORMATTEDVALUE.length);
    if (leng < 0 || leng == 0) {
      TEMPLATE = FORMATTEDVALUE;
    } else {
      for (int k = 0; k <= leng - 1; k++) {
        TEMPLATE += '0';
      }
      TEMPLATE += FORMATTEDVALUE;
    }
    int a = int.parse(TEMPLATE[0]);
    int b = int.parse(TEMPLATE[1]);
    int c = int.parse(TEMPLATE[2]);
    if (a == 1) {
      AGGREGATER += (b + c == 0) ? 'One Hundred' : 'One Hundred';
    } else if (a == 2) {
      AGGREGATER += 'Two Hundred';
    } else if (a == 3) {
      AGGREGATER += 'Three Hundred';
    } else if (a == 4) {
      AGGREGATER += 'Four Hundred';
    } else if (a == 5) {
      AGGREGATER += 'Five Hundred';
    } else if (a == 6) {
      AGGREGATER += 'Six Hundred';
    } else if (a == 7) {
      AGGREGATER += 'Seven Hundred';
    } else if (a == 8) {
      AGGREGATER += 'Eight Hundred';
    } else if (a == 9) {
      AGGREGATER += 'Nine Hundred';
    }
    if (b == 1) {
      if (c == 0) {
        AGGREGATER += ((a > 0) ? ' and ' : '') + 'Ten';
      }
      if (c == 1) {
        AGGREGATER += ((a > 0) ? ' and ' : '') + 'Eleven';
      }
      if (c == 2) {
        AGGREGATER += ((a > 0) ? ' and ' : '') + 'Twelve';
      }
      if (c == 3) {
        AGGREGATER += ((a > 0) ? ' and ' : '') + 'Thirteen';
      }
      if (c == 4) {
        AGGREGATER += ((a > 0) ? ' and ' : '') + 'Fourteen';
      }
      if (c == 5) {
        AGGREGATER += ((a > 0) ? ' and ' : '') + 'Fifteen';
      }
      if (c == 6) {
        AGGREGATER += ((a > 0) ? ' and ' : '') + 'Sixteen';
      }
      if (c == 7) {
        AGGREGATER += ((a > 0) ? ' and ' : '') + 'Seventeen';
      }
      if (c == 8) {
        AGGREGATER += ((a > 0) ? ' and ' : '') + 'Eighteen';
      }
      if (c == 9) {
        AGGREGATER += ((a > 0) ? ' and ' : '') + 'Nineteen';
      }
    } else if (b == 2) {
      AGGREGATER += ((a > 0 ? ' and ' : '') + 'Twenty');
    } else if (b == 3) {
      AGGREGATER += ((a > 0 ? ' and ' : '') + 'Thirty');
    } else if (b == 4) {
      AGGREGATER += ((a > 0 ? ' and ' : '') + 'Forty');
    } else if (b == 5) {
      AGGREGATER += ((a > 0 ? ' and ' : '') + 'Fifty');
    } else if (b == 6) {
      AGGREGATER += ((a > 0 ? ' and ' : '') + 'Sixty');
    } else if (b == 7) {
      AGGREGATER += ((a > 0 ? ' and ' : '') + 'Seventy');
    } else if (b == 8) {
      AGGREGATER += ((a > 0 ? ' and ' : '') + 'Eighty');
    } else if (b == 9) {
      AGGREGATER += ((a > 0 ? ' and ' : '') + 'Ninety');
    }
    if (b != 1 && c != 0 && AGGREGATER != '') {
      AGGREGATER += '  ';
    }
    if (b != 1) {
      if (c == 1) {
        AGGREGATER += 'One';
      } else if (c == 2) {
        AGGREGATER += 'Two';
      } else if (c == 3) {
        AGGREGATER += 'Three';
      } else if (c == 4) {
        AGGREGATER += 'Four';
      } else if (c == 5) {
        AGGREGATER += 'Five';
      } else if (c == 6) {
        AGGREGATER += 'Six';
      } else if (c == 7) {
        AGGREGATER += 'Seven';
      } else if (c == 8) {
        AGGREGATER += 'Eight';
      } else if (c == 9) {
        AGGREGATER += 'Nine';
      }
    }
    return AGGREGATER;
  }

}

class NextNumbers {
  static final NextNumbers _instance = NextNumbers._start();
  NextNumbers._start();
  factory NextNumbers() => _instance;
  double getTrillion({required String template}) {
    double _trillion = 0;
    return _trillion += double.parse(template[3] +
        template[4] +
        template[5] +
        template[6] +
        template[7] +
        template[8] +
        template[9] +
        template[10] +
        template[11] +
        template[12] +
        template[13] +
        template[14]);
  }
  double getBillion({required String template}) {
    double _billion = 0;
    return _billion += double.parse(template[6] +
        template[7] +
        template[8] +
        template[9] +
        template[10] +
        template[11] +
        template[12] +
        template[13] +
        template[14]);
  }
  double getMillion({required String template}) {
    double _million = 0;
    return _million += double.parse(template[9] +
        template[10] +
        template[11] +
        template[12] +
        template[13] +
        template[14]);
  }
  double getThousand({required String template}) {
    double _thousand = 0;
    return _thousand +=
        double.parse(template[12] + template[13] + template[14]);
  }
}