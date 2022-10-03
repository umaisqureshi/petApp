import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet_app/Screens/Auth/Widegts.dart';

class MainLoginScreen extends StatefulWidget {
  const MainLoginScreen({super.key});

  @override
  State<MainLoginScreen> createState() => _MainLoginScreenState();
}

class _MainLoginScreenState extends State<MainLoginScreen> {
  @override
  void dispose() {
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              opacity: 0.7,
              image: AssetImage(
                "assets/LoginIcon2.jpg",
              ),
              fit: BoxFit.cover),
        ),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.07,
            ),
            Center(
              child: Text(
                "Create Your Profile",
                style: GoogleFonts.nunito(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 2,
            ),
            Center(
              child: Text(
                "Easily Manage Your Profile With Some Easy Steps",
                style: GoogleFonts.nunito(color: Colors.white, fontSize: 14),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.25,
            ),
            const LogicScreenCardWidget()
          ],
        ),
      ),
    );
  }
}
