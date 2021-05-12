import 'package:crypto_app/helpers/ColorConstants.dart';
import 'package:crypto_app/repositories/shared_prefs.dart';
import 'package:crypto_app/ui/CoinDetailsScreen.dart';
import 'package:crypto_app/ui/HomeScreen.dart';
import 'package:crypto_app/ui/MainScreen.dart';
import 'package:crypto_app/ui/MyWalletScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: bgTopColor
    ));

    return MaterialApp(
      routes: {
        SplashScreen.route : (context) => SplashScreen(),
        MainScreen.route : (context) => MainScreen(),
        CoinDetailsScreen.route : (context) => CoinDetailsScreen(),
        MyWalletScreen.route : (context) => MyWalletScreen(),
        HomeScreen.route : (context) => HomeScreen()
      },
      initialRoute: SplashScreen.route,
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}


class SplashScreen extends StatefulWidget {
  static var route = "SplashScreen";
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {

  @override
  void initState() {
    attachController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    PreferenceUtils.init();

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          child: Center(
            child: Lottie.asset("assets/lotties/bitcoin_lottie.json",repeat: false),
          ),
        ),
      ),
    );

  }



  @override
  void dispose() {
    super.dispose();
  }


  attachController() {
    Future.delayed(Duration(milliseconds: 4000),(){
      Navigator.pushNamedAndRemoveUntil(context, HomeScreen.route, (Route<dynamic> route) => false);
    });
  }




}








