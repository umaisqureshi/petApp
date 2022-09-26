import 'dart:async';

import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet_app/Screens/OnBoardingScreens/OnboardingScreen.dart';

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
    Timer(const Duration(seconds: 5), (() {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const OnboardingScreen()));
    }));
    animation = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _fadeInFadeOut = Tween<double>(begin: 1.0, end: 0.5).animate(animation);
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
    super.dispose();
    animation.dispose();
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
      body: Container(
        color: Theme.of(context).primaryColor,
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.6,
              child: Center(
                child: Lottie.asset(
                  fit: BoxFit.cover,
                  'assets/splashScreen.json',
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            FadeTransition(
              opacity: _fadeInFadeOut,
              child: Text(
                "Pet App",
                style: GoogleFonts.nunito(
                    color: Color.fromARGB(255, 246, 246, 246), fontSize: 50),
              ),
            )
          ],
        ),
      ),
    );
  }
}
