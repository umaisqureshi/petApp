import 'package:line_icons/line_icon.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet_app/Screens/Home/petDetailPage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.07,
      width: MediaQuery.of(context).size.width * 0.7,
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 238, 237, 237),
        borderRadius: BorderRadius.all(Radius.circular(50)),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            autofocus: false,
            cursorColor: Theme.of(context).primaryColor,
            showCursor: true,
            decoration: InputDecoration(
                border: InputBorder.none,
                hintStyle: GoogleFonts.tajawal(),
                hintText: 'Search Lovely Pet...'),
          ),
        ),
      ),
    );
  }
}

class FilterButtonWidget extends StatelessWidget {
  const FilterButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.07,
      width: MediaQuery.of(context).size.width * 0.2,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(50)),
      ),
      child: const Icon(
        Icons.filter_alt,
        color: Colors.white,
      ),
    );
  }
}

class PetCardWidget extends StatefulWidget {
  late String imagePath;

  PetCardWidget({super.key, required this.imagePath});

  @override
  State<PetCardWidget> createState() => _PetCardWidgetState();
}

class _PetCardWidgetState extends State<PetCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 7,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.1,
        width: MediaQuery.of(context).size.width * 0.25,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          image: DecorationImage(
            fit: BoxFit.contain,
            image: AssetImage(this.widget.imagePath),
          ),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
      ),
    );
  }
}

class PetMainCardWidget extends StatefulWidget {
  late String petName;
  late String petBreed;
  late String petImage;
  PetMainCardWidget(
      {super.key,
      required this.petBreed,
      required this.petImage,
      required this.petName});

  @override
  State<PetMainCardWidget> createState() => _PetMainCardWidgetState();
}

class _PetMainCardWidgetState extends State<PetMainCardWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => PetDetailedPage(
                  petBreed: widget.petBreed,
                  petImage: widget.petImage,
                  petName: widget.petName,
                )));
      },
      child: Card(
        elevation: 2,
        child: Container(
          height: MediaQuery.of(context).size.height * 0.35,
          width: MediaQuery.of(context).size.width * 0.85,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  elevation: 5,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.23,
                    width: MediaQuery.of(context).size.width * 0.79,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(widget.petImage),
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.petName,
                          style: GoogleFonts.nunito(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: Colors.black54),
                        ),
                        Text(
                          widget.petBreed,
                          style: GoogleFonts.nunito(
                              fontSize: 14, color: Colors.black54),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Card(
                          elevation: 2,
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            child: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.phone_enabled_outlined,
                                color: Colors.black38,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Card(
                          elevation: 2,
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            child: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.message,
                                color: Colors.black38,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class IconAndTextWidget extends StatefulWidget {
  Color colorss;
  String name;
  String breed;

  IconAndTextWidget(
      {super.key,
      required this.colorss,
      required this.name,
      required this.breed});

  @override
  State<IconAndTextWidget> createState() => _IconAndTextWidgetState();
}

class _IconAndTextWidgetState extends State<IconAndTextWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20))),
        height: 70,
        width: MediaQuery.of(context).size.width * 0.4,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 35,
                  width: 35,
                  decoration: BoxDecoration(
                      color: widget.colorss,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(30))),
                  child: widget.name == "Breed"
                      ? const Center(
                          child: FaIcon(
                            FontAwesomeIcons.dog,
                            color: Colors.white,
                            size: 20,
                          ),
                        )
                      : const Center(
                          child: FaIcon(
                            FontAwesomeIcons.transgender,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  widget.name,
                  style: GoogleFonts.nunito(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: widget.colorss,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            widget.name == "Breed"
                ? Text(
                    widget.breed,
                    style: GoogleFonts.nunito(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black45,
                    ),
                  )
                : Text(
                    "Male",
                    style: GoogleFonts.nunito(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black45,
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
