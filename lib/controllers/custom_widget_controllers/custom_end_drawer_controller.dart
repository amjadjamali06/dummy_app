import 'package:get/get.dart';
import 'package:excise_e_auction/utils/constants.dart';

import '../../ui/custom_widgets/custom_dialogs.dart';
import '../../utils/user_session.dart';

class CustomEndDrawerController extends GetxController{

  Future<void> onTap(String title) async {
    Get.back();
    if(title == 'Logout'){
      CustomDialogs().confirmationDialog(message: "Are you sure want to Logout?", yesFunction: () async{
        await UserSession().logout();
        Get.offAllNamed(kAuctionDetailScreenRoute);
      });
    } else if(title=='Auction' && Get.currentRoute != kEAuctionScreenRoute){
      Get.offAllNamed(kEAuctionScreenRoute, predicate: (r)=>r.isFirst);
    }
  }
}