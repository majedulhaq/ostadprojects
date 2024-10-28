import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ostadprojects/Data/Model/response_data.dart';
import 'package:ostadprojects/Data/Service/network_caller.dart';
import 'package:ostadprojects/Data/utils/urls.dart';
import 'package:ostadprojects/UI/Screens/loginpage.dart';
import 'package:ostadprojects/UI/widgets/snack_bar.dart';

class SignUpPage extends StatefulWidget {
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final TextEditingController _emailTEcontroller = TextEditingController();
  final TextEditingController _firstNameTEcontroller = TextEditingController();
  final TextEditingController _lastNameTEcontroller = TextEditingController();
  final TextEditingController _passwordTEcontroller = TextEditingController();
  final TextEditingController _mobileTEcontroller = TextEditingController();
  bool _inprogress = false;

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
                  _signUpForm(),
                  const SizedBox(height: 15),
                  next_page_elevated_button(),
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

  Widget next_page_elevated_button() {
    return SizedBox(
      width: double.infinity,
      child: Visibility(
        visible: !_inprogress,
        replacement: const Center(child: CircularProgressIndicator()),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)))),
          onPressed: _onTapElevatedButton,
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
    );
  }

  Widget _signUpForm() {
    return Form(
      key: _formkey,
      child: Column(
        children: [
          TextFormField(
            controller: _emailTEcontroller,
            decoration: const InputDecoration(
              label: Text('Email'),
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'write Your Email';
              }
              return null;
            },
            autovalidateMode: AutovalidateMode.onUserInteraction,
          ),
          const SizedBox(height: 10),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'write First Name';
              }
              return null;
            },
            controller: _firstNameTEcontroller,
            decoration: const InputDecoration(
              label: Text('First Name'),
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 10),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'write Last Name';
              }
              return null;
            },
            controller: _lastNameTEcontroller,
            decoration: const InputDecoration(
              label: Text('Last Name'),
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 10),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'write Mobile Number';
              }
              return null;
            },
            controller: _mobileTEcontroller,
            decoration: const InputDecoration(
              label: Text('Mobile'),
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 10),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'write the Password';
              }
              return null;
            },
            controller: _passwordTEcontroller,
            obscureText: true,
            decoration: const InputDecoration(
              label: Text('Password'),
              border: OutlineInputBorder(),
            ),
          ),
        ],
      ),
    );
  }

  void _onTapElevatedButton() {
    if (_formkey.currentState!.validate()) {
      _signin();
    }
  }

  Future<void> _signin() async {
    _inprogress = true;
    setState(() {});
    Map<String, dynamic> responseBody = {
      "email": _emailTEcontroller.text.trim(),
      "firstName": _firstNameTEcontroller.text.trim(),
      "lastName": _lastNameTEcontroller.text.trim(),
      "mobile": _mobileTEcontroller.text.trim(),
      "password": _passwordTEcontroller.text,
      "photo": ''
    };
    NetworkResponse response = await NetworkCaller.postRequest(
      url: Urls.RegUrl,
      body: responseBody,
    );
    _inprogress = false;
    setState(() {});
    if (response.isSuccess) {
      return showSnackBarMessage(context, 'New user created');
    } else {
      return showSnackBarMessage(context, response.errorMassage, true);
    }
  }

  void _clearTextFields() {
    _emailTEcontroller.clear();
    _firstNameTEcontroller.clear();
    _lastNameTEcontroller.clear();
    _mobileTEcontroller.clear();
    _passwordTEcontroller.clear();
  }

  @override
  void dispose() {
    _emailTEcontroller.dispose();
    _firstNameTEcontroller.dispose();
    _lastNameTEcontroller.dispose();
    _mobileTEcontroller.dispose();
    _passwordTEcontroller.dispose();
    super.dispose();
  }
}
