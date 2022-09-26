import 'package:flutter/material.dart';

import 'package:pet_app/Screens/Home/Widgets/Widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet_app/Widgets/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 13.0),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    SearchBarWidget(),
                    FilterButtonWidget(),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Catagory",
                  style: GoogleFonts.nunito(
                      fontSize: 25,
                      fontWeight: FontWeight.w400,
                      color: Colors.black45),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    PetCardWidget(
                      imagePath: "assets/cat.png",
                    ),
                    PetCardWidget(
                      imagePath: "assets/dog.png",
                    ),
                    PetCardWidget(
                      imagePath: "assets/birds.png",
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                    child: ListView(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: [
                    PetMainCardWidget(
                      petBreed: "Persian Cat",
                      petImage: "assets/lab.jpg",
                      petName: "Simbha",
                    ),
                    PetMainCardWidget(
                      petBreed: "Persian Cat",
                      petImage: "assets/cat1.jpg",
                      petName: "Mano",
                    ),
                    PetMainCardWidget(
                      petBreed: "Persian Cat",
                      petImage: "assets/lab.jpg",
                      petName: "Tiger",
                    ),
                    PetMainCardWidget(
                      petBreed: "Persian Cat",
                      petImage: "assets/cat1.jpg",
                      petName: "Queen",
                    ),
                  ],
                )),
              ],
            ),
          ),
        ),
        // bottomNavigationBar: const BottomBarWidget(),
      ),
    );
  }
}
