import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet_app/Screens/Home/HomePage.dart';
import 'package:pet_app/Screens/Main/MainPage.dart';
import 'package:swipebuttonflutter/swipebuttonflutter.dart';

class SwpieButton extends StatelessWidget {
  const SwpieButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Align(
          alignment: Alignment.center,
          child: SwipingButton(
            text: 'Swipe To Start',
            onSwipeCallback: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const MainPage()));
            },
            iconColor: const Color.fromARGB(255, 244, 244, 244),
            buttonTextStyle:
                GoogleFonts.nunito(color: Colors.white, fontSize: 15),
            backgroundColor: Theme.of(context).primaryColor,
            height: MediaQuery.of(context).size.height * 0.1,
          )),
    );
  }
}

class ImageWidget extends StatelessWidget {
  const ImageWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
            fit: BoxFit.cover, image: AssetImage("assets/onBoardingImage.png")),
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50)),
      ),
    );
  }
}
