import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet_app/Screens/Auth/mainLoginScreen.dart';
import 'package:pet_app/Screens/OnBoardingScreens/onboardingScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late Animation<double> _fadeInFadeOut;
  late AnimationController animation;

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 6), (() {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const MainLoginScreen()));
    }));
    animation = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    _fadeInFadeOut = Tween<double>(begin: 0.0, end: 1.0).animate(animation);
    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        animation.reverse();
      } else if (status == AnimationStatus.dismissed) {
        animation.forward();
      }
    });
    animation.forward();
  }

  @override
  void dispose() {
    animation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      backgroundColor: Theme.of(context).primaryColor,
      body: Column(
        children: [
          Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.18,
              ),
              Center(
                child: FadeTransition(
                  opacity: _fadeInFadeOut,
                  child: Text(
                    "Pet App",
                    style:
                        GoogleFonts.nunito(color: Colors.white, fontSize: 50),
                  ),
                ),
              ),
              const SizedBox(
                height: 2,
              ),
              Center(
                child: Text(
                  "Beautiful Friend Like Family",
                  style: GoogleFonts.nunito(color: Colors.white, fontSize: 20),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.23,
              ),
            ],
          ),
          Lottie.asset(
            fit: BoxFit.cover,
            'assets/SplashLottie.json',
          ),
        ],
      ),
    );
  }
}
