import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet_app/Screens/Auth/loginPage.dart';
import 'package:pet_app/Screens/Auth/registerPage.dart';
import 'package:pet_app/Screens/OnBoardingScreens/onboardingScreen.dart';

class LogicScreenCardWidget extends StatelessWidget {
  const LogicScreenCardWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Opacity(
        opacity: 0.8,
        child: Container(
          height: MediaQuery.of(context).size.height * 0.4,
          width: double.infinity,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(30))),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Container(
                  height: 80,
                  width: 80,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                            "assets/LoginScreen.jpg",
                          ),
                          fit: BoxFit.cover),
                      color: Colors.blue,
                      borderRadius: BorderRadius.all(Radius.circular(50))),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                "Welcome To Pet App",
                style: GoogleFonts.nunito(
                    color: Theme.of(context).primaryColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const LoginScreen()));
                    },
                    child: Container(
                      color: Theme.of(context).primaryColor,
                      width: MediaQuery.of(context).size.width * 0.461,
                      height: 50,
                      child: Center(
                        child: Text(
                          "Sign In",
                          style: GoogleFonts.nunito(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const RegisterScreen()));
                    },
                    child: Container(
                      color: Colors.black,
                      width: MediaQuery.of(context).size.width * 0.461,
                      height: 50,
                      child: Center(
                        child: Text(
                          "Sign Up",
                          style: GoogleFonts.nunito(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "--- IF FEEL LAZY --",
                style: GoogleFonts.nunito(
                    color: Theme.of(context).primaryColor,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                              "assets/FacebookIcon.jpg",
                            ),
                            fit: BoxFit.cover),
                        color: Colors.blue,
                        borderRadius: BorderRadius.all(Radius.circular(50))),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Container(
                    height: 60,
                    width: 60,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                              "assets/GoogleIcon.png",
                            ),
                            fit: BoxFit.cover),
                        color: Colors.blue,
                        borderRadius: BorderRadius.all(Radius.circular(50))),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

InputDecoration inputDecorationTextField = InputDecoration(
  focusColor: const Color(0xff49C2E1),
  border: OutlineInputBorder(
    borderSide: const BorderSide(color: Color(0xff49C2E1), width: 1.0),
    borderRadius: BorderRadius.circular(15.0),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: const BorderSide(color: Color(0xff49C2E1), width: 5.0),
    borderRadius: BorderRadius.circular(15.0),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: const BorderSide(color: Color(0xff49C2E1), width: 1.0),
    borderRadius: BorderRadius.circular(15.0),
  ),
  fillColor: const Color(0xff49C2E1),
  filled: true,
  hintStyle: GoogleFonts.nunito(
      color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
);
