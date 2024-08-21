import 'package:excise_e_auction/controllers/login_t_screen_controller.dart';
// import 'package:excise_e_auction/ui/screens/e_auction_screen.dart';
import 'package:excise_e_auction/ui/screens/login_t_screen.dart';
import 'package:excise_e_auction/ui/screens/premium_number_list_screen.dart';
import 'package:excise_e_auction/ui/screens/registration_screen.dart';
import 'package:excise_e_auction/ui/screens/auctions_list_screen.dart';
import 'package:excise_e_auction/ui/screens/auction_request_screen.dart';
import 'package:excise_e_auction/ui/screens/place_bid_screen.dart';
// import 'package:excise_e_auction/ui/screens/e_auction_screen.dart';
import 'package:excise_e_auction/ui/screens/auction_category_screen.dart';
import 'package:excise_e_auction/ui/screens/auction_request_category_screen.dart';
import 'package:excise_e_auction/ui/screens/setting_screen.dart';
import 'package:excise_e_auction/ui/screens/splash_screen.dart';
import 'package:excise_e_auction/ui/screens/tag_winning_nbr_screen.dart';
import 'package:get/get.dart';
import 'package:excise_e_auction/ui/screens/dashboard_screen.dart';
import 'package:excise_e_auction/ui/screens/home_screen.dart';
import 'package:excise_e_auction/ui/screens/login_screen.dart';
import 'package:excise_e_auction/utils/constants.dart';
import 'package:excise_e_auction/utils/screen_bindings.dart';

/*Created By: Amjad Jamali on 03-Aug-2023
* Last Modified by Afaque Ali on 21-Aug-2024*/

class RouteManagement {
  static List<GetPage> getPages() {
    // const duration = Duration(milliseconds: 500);
    return [
      GetPage(
        name: kSplashScreenRoute,
        page: () => const SplashScreen(),
        binding: ScreensBindings(),
      ),
      GetPage(
        name: kDashboardScreenRoute,
        page: () => const DashboardScreen(),
        binding: ScreensBindings(),
      ),
      GetPage(
        name: kSettingScreenRoute,
        page: () => const SettingScreen(),
        binding: ScreensBindings(),
      ),
      GetPage(
        name: kHomeScreenRoute,
        page: () => const HomeScreen(),
        binding: ScreensBindings(),
      ),
      GetPage(
        name: kLoginScreenRoute,
        page: ()=> const LoginScreen(),
        binding: ScreensBindings()
      ),
      GetPage(
        name: kAuctionsListScreenRoute,
        page: ()=> const AuctionsListScreen(),
        binding: ScreensBindings()
      ),
      GetPage(
          name: kPremiumNumberListScreenRoute,
          page: ()=> const PremiumNumberListScreen(),
          binding: ScreensBindings()
      ),
      // GetPage(name: kEAuctionScreenRoute,
      //     page: ()=> const EAuctionScreen(),
      //     binding: ScreensBindings()
      // ),
      GetPage(
          name: kAuctionCategoryScreenRoute,
          page: ()=> const AuctionCategoryScreen(),
          binding: ScreensBindings()
      ),
      GetPage(
          name: kAuctionRequestCategoryScreenRoute,
          page: ()=> const AuctionRequestCategoryScreen(),
          binding: ScreensBindings()
      ),
      /*GetPage(name: kEAuctionScreenRoute,
          page: ()=> const EAuctionScreen(),
          binding: ScreensBindings()
      ),*/
      GetPage(name: kTagWinningNbrScreenRoute,
          page: ()=> const TagWinningNbrScreen(),
          binding: ScreensBindings()
      ),
      GetPage(name: kAuctionRequestScreenRoute,
          page: ()=> const AuctionRequestScreen(),
          binding: ScreensBindings()
      ),
      GetPage(name: kPlaceBidScreenRoute,
          page: ()=> const PlaceBidScreen(),
          binding: ScreensBindings()
      ),
      GetPage(
          name: kRegistrationScreenRoute,
          page: () => const RegistrationScreen(),
          binding: ScreensBindings()),
      GetPage(
          name: kLoginTScreenRoute,
          page: () => LoginTScreen(),
          binding: ScreensBindings()),
    ];
  }
}
