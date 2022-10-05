// ignore_for_file: use_build_context_synchronously

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet_app/Constants/constants.dart';
import 'package:pet_app/Screens/Auth/registerPage.dart';
import 'package:pet_app/Screens/Auth/widegts.dart';
import 'package:pet_app/Screens/OnBoardingScreens/onboardingScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:pet_app/Services/authServices.dart';
import 'package:pet_app/Services/databaseServices.dart';
import 'package:pet_app/Widgets/widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email = "";
  String password = "";
  bool loading = false;
  final _loginFormKey = GlobalKey<FormState>();
  AuthService authService = AuthService();

  bool isValidEmail(String email) {
    final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return emailRegExp.hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
                image: AssetImage("assets/loginPageImage.jpg"),
                opacity: 0.7,
                fit: BoxFit.cover)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.09,
              ),
              Opacity(
                opacity: 0.9,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.7,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    child: loading
                        ? Center(
                            child: CircularProgressIndicator(
                              color: Theme.of(context).primaryColor,
                            ),
                          )
                        : Form(
                            key: _loginFormKey,
                            child: Column(
                              children: [
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.07,
                                ),
                                Center(
                                  child: Text(
                                    "Hello Again!",
                                    style: GoogleFonts.nunito(
                                        color: Theme.of(context).primaryColor,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Center(
                                  child: Text(
                                    "Welcome Back You've\n        Been Missed!",
                                    style: GoogleFonts.nunito(
                                        // color: Theme.of(context).primaryColor,
                                        color: Colors.black45,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.07,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: TextFormField(
                                    onChanged: (value) {
                                      email = value;
                                      setState(() {});
                                    },
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "This is mandatory";
                                      } else if (!isValidEmail(value)) {
                                        return "Invalid email";
                                      }
                                      return null;
                                    },
                                    style: GoogleFonts.nunito(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                    decoration:
                                        inputDecorationTextField.copyWith(
                                      hintText: "Email",
                                      prefixIcon: const Icon(
                                        Icons.person_outline_rounded,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: TextFormField(
                                    onChanged: (value) {
                                      password = value;
                                      setState(() {});
                                    },
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "This is mandatory";
                                      }
                                      return null;
                                    },
                                    style: GoogleFonts.nunito(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                    decoration:
                                        inputDecorationTextField.copyWith(
                                            prefixIcon: const Icon(
                                              Icons.password,
                                              color: Colors.white,
                                            ),
                                            hintText: "Password"),
                                    obscureText: true,
                                  ),
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.05,
                                ),
                                GestureDetector(
                                  onTap: (() async {
                                    if (_loginFormKey.currentState!
                                        .validate()) {
                                      setState(() {
                                        loading = true;
                                      });
                                    }
                                    await authService
                                        .loginWithUserNameandPassword(
                                            email, password)
                                        .then((value) async {
                                      if (value == true) {
                                        QuerySnapshot snapshot =
                                            await DatabaseServices(
                                                    uid: FirebaseAuth.instance
                                                        .currentUser!.uid)
                                                .gettingUserData(email);
                                        await HelperConstantClass
                                            .saveUserLoggedInStatus(true);
                                        await HelperConstantClass
                                            .saveUserEmailSF(email);
                                        await HelperConstantClass
                                            .saveUserNameSF(
                                                snapshot.docs[0]['fullName']);
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const OnboardingScreen()));
                                      } else {
                                        showSnackbar(
                                            context,
                                            Theme.of(context).primaryColor,
                                            "No User Found With This Email And Password. Please register yourself First!");
                                        setState(() {
                                          loading = false;
                                        });
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const RegisterScreen()));
                                      }
                                    });

                                    // ignore: use_build_context_synchronously
                                  }),
                                  child: Container(
                                    height: 60,
                                    width:
                                        MediaQuery.of(context).size.width * 0.5,
                                    decoration: const BoxDecoration(
                                        color: Colors.black87,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(30),
                                        )),
                                    child: Center(
                                      child: Text(
                                        "Sign In",
                                        style: GoogleFonts.nunito(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                RichText(
                                    text: TextSpan(children: [
                                  TextSpan(
                                    text: "Not a Member? ",
                                    style: GoogleFonts.nunito(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  TextSpan(
                                    text: "Register Now",
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const RegisterScreen()));
                                      },
                                    style: GoogleFonts.nunito(
                                        color: Theme.of(context).primaryColor,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  )
                                ]))
                              ],
                            )),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
