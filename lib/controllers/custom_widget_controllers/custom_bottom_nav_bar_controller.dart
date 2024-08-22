import 'package:excise_e_auction/utils/constants.dart';
import 'package:get/get.dart';

class CustomBottomNavBarController extends GetxController{
  static RxInt selectedIndex=0.obs;


  Future<void> onItemSelect(int index) async {
    selectedIndex.value = index;
    if(selectedIndex.value == 0){
      if(Get.currentRoute != kDashboardScreenRoute) {
        Get.offAllNamed(kDashboardScreenRoute);
      }
    } else if(selectedIndex.value == 1){
      /*if(Get.currentRoute != kEAuctionScreenRoute) {
        Get.offAllNamed(kEAuctionScreenRoute, predicate: (r)=>r.isFirst);
      }*/
    } else if(selectedIndex.value == 2){
      /*if(Get.currentRoute != kSettingsScreenRoute) {
        Get.offAllNamed(kSettingsScreenRoute, predicate: (r)=>r.isFirst);
      }*/
    }
  }

}