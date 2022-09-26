import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet_app/Screens/Home/Widgets/Widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PetDetailedPage extends StatefulWidget {
  late String petName;
  late String petBreed;
  late String petImage;

  PetDetailedPage(
      {super.key,
      required this.petBreed,
      required this.petImage,
      required this.petName});

  @override
  State<PetDetailedPage> createState() => _PetDetailedPageState();
}

class _PetDetailedPageState extends State<PetDetailedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        //  color: Colors.grey[100],
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          fit: StackFit.loose,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(widget.petImage),
                  fit: BoxFit.cover,
                ),
              ),
              height: MediaQuery.of(context).size.height * 0.4,
              width: double.infinity,
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.35,
              child: Card(
                elevation: 0,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.5,
                  width: MediaQuery.of(context).size.width * 0.97,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      color: Colors.white),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Text(
                            widget.petName.toUpperCase(),
                            style: GoogleFonts.nunito(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color:
                                    const Color.fromARGB(255, 107, 107, 107)),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          IconAndTextWidget(
                            colorss: Theme.of(context).primaryColor,
                            name: "Breed",
                            breed: widget.petBreed,
                          ),
                          IconAndTextWidget(
                            colorss: Colors.purple.withOpacity(0.7),
                            name: "Gender",
                            breed: widget.petBreed,
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 15),
                        child: Text(
                          "Labs are friendly, outgoing, and high-spirited companions who have more than enough affection to go around for a family looking for a medium-to-large dog. ",
                          style: GoogleFonts.nunito(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.black.withOpacity(0.6)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: MediaQuery.of(context).size.height * 0.08,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(color: Theme.of(context).primaryColor),
        child: Center(
          child: Text(
            "Adopt Now",
            style: GoogleFonts.nunito(
                fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
