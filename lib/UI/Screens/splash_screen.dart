import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ostadprojects/UI/Controllers/auth_controller.dart';
import 'package:ostadprojects/UI/Screens/loginpage.dart';
import 'package:ostadprojects/UI/Screens/main_bottom_nav_bar.dart';
import 'package:ostadprojects/UI/Utils/app_assets.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _movetoNextScreen();
  }

  Future<void> _movetoNextScreen() async {
    await Future.delayed(const Duration(seconds: 2));
    await AuthController.getAccessToken();
    if (AuthController.isLoggedIn()) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => MainBottomNavBar()));
    } else {
         Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoginPage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: SvgPicture.asset(
              Assets.bgImageSvg,
              fit: BoxFit.fill,
            ),
          ),
          Center(
            child: SvgPicture.asset(
              Assets.logoSvg,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}
