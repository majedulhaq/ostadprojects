import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ostadprojects/Data/Model/response_data.dart';
import 'package:ostadprojects/Data/Service/network_caller.dart';
import 'package:ostadprojects/Data/utils/urls.dart';
import 'package:ostadprojects/UI/Controllers/auth_controller.dart';
import 'package:ostadprojects/UI/Screens/forgot_password_email.dart';
import 'package:ostadprojects/UI/Screens/main_bottom_nav_bar.dart';
import 'package:ostadprojects/UI/Screens/signuppage.dart';
import 'package:ostadprojects/UI/widgets/snack_bar.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailTeController = TextEditingController();
  final TextEditingController _passwordTeController = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  bool _inprogress = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Positioned.fill(
            child: SvgPicture.asset(
              'assets/images/background.svg',
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: Form(
                key: _formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Get Started With',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Enter you Email";
                        }
                        return null;
                      },
                      controller: _emailTeController,
                      decoration: const InputDecoration(
                        label: Text('Email'),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Enter you password";
                        }
                        if (value.length <= 4) {
                          return "Enter 6 digit password";
                        }
                        return null;
                      },
                      controller: _passwordTeController,
                      decoration: const InputDecoration(
                        label: Text('Password'),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 15),
                    SizedBox(
                      width: double.infinity,
                      child: Visibility(
                        visible: !_inprogress,
                        replacement: const Center(
                          child: CircularProgressIndicator(color: Colors.red),
                        ),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                            ),
                          ),
                          onPressed: _onTapelevatedButton,
                          child: const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 35),
                    SizedBox(
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PasswordEmail()));
                            },
                            child: const Text(
                              'Forgot Password?',
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          const SizedBox(height: 2),
                          RichText(
                            text: TextSpan(
                              text: 'Don\'t have an account?',
                              style: const TextStyle(color: Colors.black),
                              children: [
                                TextSpan(
                                  text: ' Sign Up',
                                  style: const TextStyle(color: Colors.green),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      // Navigate to another page when "Sign in" is tapped
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => SignUpPage()),
                                      );
                                    },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onTapelevatedButton() {
    if (!_formkey.currentState!.validate()) {
      return;
    }
    _logIn();
  }

  Future<void> _logIn() async {
    _inprogress = true;
    setState(() {});

    Map<String, dynamic> requestBody = {
      "email": _emailTeController.text.trim(),
      "password": _passwordTeController.text
    };
    final NetworkResponse response =
        await NetworkCaller.postRequest(url: Urls.LoginUrl, body: requestBody);
    _inprogress = false;
    setState(() {});
    if (response.isSuccess) {
      await AuthController.saveAccessToken(response.responseData['token']);
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => MainBottomNavBar()),
          (value) => false);
    } else {
      showSnackBarMessage(context, response.errorMassage, true);
    }
  }
}
