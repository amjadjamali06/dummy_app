
import 'package:excise_e_auction/utils/custom_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:excise_e_auction/utils/app_colors.dart';
import 'package:excise_e_auction/utils/constants.dart';
import 'package:excise_e_auction/utils/route_management.dart';
import 'package:excise_e_auction/utils/screen_bindings.dart';

// import 'utils/ssl_http_protocol.dart';

/*Modified By: Amjad Jamali on 02-Aug-2023*/
void main() async {
  ErrorWidget.builder = (FlutterErrorDetails details) => Scaffold(
    backgroundColor: kPrimaryDarkColor,
    body: Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          details.summary.name??'',
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          '${details.summary.value}',
          style: const TextStyle(
            fontSize: 14,
          ),
        ),
      ],
    ),
  );
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  // HttpOverrides.global = new MyHttpOverrides();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    // statusBarIconBrightness: Brightness.dark
    // statusBarIconBrightness: Brightness.dark,// For Android (dark icons)
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: kAppName,
      initialRoute: kSplashScreenRoute,
      initialBinding: ScreensBindings(),
      getPages: RouteManagement.getPages(),
      themeMode: ThemeMode.dark,
      theme: ThemeData(
        applyElevationOverlayColor:false,
        primaryColorLight: kPrimaryColor,
        primaryColorDark: kPrimaryDarkColor,
        fontFamily: 'Roboto',
        scaffoldBackgroundColor: kWhiteColor,
        dialogBackgroundColor: kPrimaryDarkColor,
        shadowColor: kPrimaryDarkColor,
        appBarTheme: CustomTheme.appBarTheme,
        textTheme: CustomTheme.darkTextTheme,
        buttonTheme: CustomTheme.darkButtonTheme,
        primaryColor: kPrimaryColor,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}


