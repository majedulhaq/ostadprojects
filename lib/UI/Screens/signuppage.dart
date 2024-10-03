import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ostadprojects/UI/Screens/loginpage.dart';

class SignUpPage extends StatefulWidget {
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          SvgPicture.asset(
            'assets/images/background.svg',
            fit: BoxFit.cover,
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Join With Us',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  _signinForm(),
                  const SizedBox(height: 15),
                  next_page_move_button(),
                  const SizedBox(height: 35),
                  SizedBox(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 2,
                        ),
                        RichText(
                            text: TextSpan(
                                text: 'have an account?',
                                style: const TextStyle(color: Colors.black),
                                children: [
                              TextSpan(
                                text: ' Sign In',
                                style: const TextStyle(color: Colors.green),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    // Navigate to another page when "Sign in" is tapped
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => LoginPage()),
                                    );
                                  },
                              ),
                            ]))
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget next_page_move_button() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)))),
        onPressed: () {},
        child: const Padding(
          padding: EdgeInsets.all(10.0),
          child: Icon(
            Icons.arrow_forward_ios_rounded,
            color: Colors.white,
            size: 20,
          ),
        ),
      ),
    );
  }

  Widget _signinForm() {
    return Column(
      children: [
        TextFormField(
          decoration: const InputDecoration(
            label: Text('Email'),
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 10),
        TextFormField(
          decoration: const InputDecoration(
            label: Text('First Name'),
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 10),
        TextFormField(
          decoration: const InputDecoration(
            label: Text('Last Name'),
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 10),
        TextFormField(
          decoration: const InputDecoration(
            label: Text('Mobile'),
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 10),
        TextFormField(
          obscureText: true,
          decoration: const InputDecoration(
            label: Text('Password'),
            border: OutlineInputBorder(),
          ),
        ),
      ],
    );
  }
}
