import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shopping_store/Splash.dart';
import 'package:shopping_store/router_helper.dart';
import 'package:shopping_store/test/all_products_screen.dart';
import 'package:shopping_store/ui/screens/mainScreen.dart';
import 'package:shopping_store/ui/screens/widgt/ExplorScreen/Gadgets/Gadgetsscreen.dart';
import 'package:shopping_store/ui/screens/widgt/profile/person.dart';
import 'package:shopping_store/ui/screens/widgt/profile/profilescreen.dart';
import 'package:shopping_store/ui/screens/widgt/profile/provider.dart';
import 'package:shopping_store/ui/welcom/logain.dart';
import 'firebase/provider/app_provider.dart';





void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await EasyLocalization.ensureInitialized();

  runApp(
      MultiProvider(
        providers: [

          ChangeNotifierProvider<AppProvider>(
            create: (context) {
              return AppProvider();
            },

          ),
          ChangeNotifierProvider<CameraProvider>(
            create: (context) {
              return CameraProvider();
            },

          )

        ],

        child: EasyLocalization(
            supportedLocales: [Locale('en'), Locale('ar')],
            path: 'assets/langs', // <-- change the path of the translation files
            fallbackLocale: Locale('en'),
            child: MyApp()),

      )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key  key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return ScreenUtilInit(
      designSize: Size(411, 820),
      minTextAdapt: true,
      builder: () => MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,

        builder: (context, widget) {

          ScreenUtil.setContext(context);
          return MediaQuery(
            //Setting font does not change with system font size
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: widget,
          );
        },
        routes: RouterHelper.routerHelper.map,
        navigatorKey: RouterHelper.routerHelper.routerKey,
       home: LaunchScreen(),
      ),
    );
  }
}

