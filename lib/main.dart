import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping/adapter/cart_hive_adapter.dart';
import 'package:shopping/view/splash_page.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  //async{
  Hive..initFlutter()..registerAdapter(CartAdapter())
  ..registerAdapter(RatingAdapter());
  //widgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return Sizer(builder: (context, orientation, deviceType) {
      return new GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            brightness: Brightness.light,
            primaryColor: Color(0xff465bd8),
            scaffoldBackgroundColor: Colors.white,
          textTheme: GoogleFonts.montserratTextTheme(
            Theme.of(context).textTheme,
          ),),
        defaultTransition: Transition.zoom,
        home: SplashPage(),
      );
    });
  }
}
