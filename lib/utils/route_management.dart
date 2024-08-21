import 'package:excise_e_auction/ui/screens/e_auction_screen.dart';
import 'package:excise_e_auction/ui/screens/setting_screen.dart';
import 'package:excise_e_auction/ui/screens/splash_screen.dart';
import 'package:excise_e_auction/ui/screens/tag_winning_nbr_screen.dart';
import 'package:get/get.dart';
import 'package:excise_e_auction/ui/screens/dashboard_screen.dart';
import 'package:excise_e_auction/ui/screens/home_screen.dart';
import 'package:excise_e_auction/ui/screens/login_screen.dart';
import 'package:excise_e_auction/utils/constants.dart';
import 'package:excise_e_auction/utils/screen_bindings.dart';

/*Created By: Amjad Jamali on 03-Aug-2023*/

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
      GetPage(name: kSignInScreenRoute,
          page: ()=> const LoginScreen(),
          binding: ScreensBindings()
      ),
      GetPage(name: kEAuctionScreenRoute,
          page: ()=> const EAuctionScreen(),
          binding: ScreensBindings()
      ),
      GetPage(name: kTagWinningNbrScreenRoute,
          page: ()=> const TagWinningNbrScreen(),
          binding: ScreensBindings()
      ),
    ];
  }
}
