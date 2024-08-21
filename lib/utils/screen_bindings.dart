import 'package:excise_e_auction/controllers/tag_winning_nbr_screen_controller.dart';
import 'package:get/get.dart';
import 'package:excise_e_auction/controllers/custom_widget_controllers/custom_end_drawer_controller.dart';
import 'package:excise_e_auction/controllers/dashboard_screen_controller.dart';
import 'package:excise_e_auction/controllers/home_screen_controller.dart';
import 'package:excise_e_auction/controllers/login_screen_controller.dart';
import 'package:excise_e_auction/controllers/setting_screen_controller.dart';
import 'package:excise_e_auction/controllers/splash_screen_controller.dart';


///Created by Amjad Jamali 03-Aug-2023
class ScreensBindings extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => SplashScreenController());
    Get.lazyPut(() => DashboardScreenController());
    Get.lazyPut(() => HomeScreenController());
    Get.lazyPut(() => LoginScreenController());
    Get.lazyPut(() => SettingScreenController());
    Get.lazyPut(() => CustomEndDrawerController());
    Get.lazyPut(() => TagWinningNbrScreenController());
  }

}
