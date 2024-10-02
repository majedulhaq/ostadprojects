import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ostadprojects/UI/Screens/loginpage.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _movetoNextScreen();
  }

  Future<void> _movetoNextScreen() async {
    await Future.delayed(const Duration(seconds: 2));
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoginPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        SvgPicture.asset(
          'assets/images/background.svg',
          fit: BoxFit.cover,
       
        ),
        Center(
          child: SvgPicture.asset(
            'assets/images/logo.svg',
            fit: BoxFit.cover,
            // height: MediaQuery.sizeOf(context).height,
            // width: MediaQuery.sizeOf(context).width,
          ),
        ),
      ],
    ));
  }
}
