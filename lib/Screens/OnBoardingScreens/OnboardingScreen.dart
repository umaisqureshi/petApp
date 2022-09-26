import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet_app/Screens/OnBoardingScreens/Widgets/widgets.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        body: Column(
          children: [
            const ImageWidget(),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Let\'s Find A New\nLovely Pet Or A Friends ',
                  style: GoogleFonts.nunito(
                      color: Colors.black45,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Now it\'s easier than ever to find a friend or a replacement for the family.',
                  style:
                      GoogleFonts.nunito(color: Colors.black45, fontSize: 15),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.08,
            ),
            const SwpieButton(),
          ],
        ),
      ),
    );
  }
}
