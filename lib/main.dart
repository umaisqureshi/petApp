import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pet_app/Constants/constants.dart';
import 'package:pet_app/Screens/Auth/loginPage.dart';
import 'package:pet_app/Screens/Auth/mainLoginScreen.dart';
import 'package:pet_app/Screens/Auth/registerPage.dart';
import 'package:pet_app/Screens/Home/homePage.dart';

import 'Screens/SplashScreen/splashScreen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isSignedIn = false;

  @override
  void initState() {
    super.initState();
    getUserLoggedInStatus();
  }

  getUserLoggedInStatus() async {
    await HelperConstantClass.getUserLoggedInStatus().then((value) {
      if (value != null) {
        setState(() {
          _isSignedIn = value;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      title: 'Pet App',
      theme: ThemeData(
          useMaterial3: true,
          primaryColor: const Color(0xff49C2E1),
          appBarTheme: AppBarTheme(
              backgroundColor: Colors.white,
              // backgroundColor: const Color.fromARGB(255, 114, 174, 117),
              centerTitle: true,
              elevation: 0,
              titleTextStyle: GoogleFonts.nunito(
                  color: Theme.of(context).primaryColor, fontSize: 25))),
      home: _isSignedIn ? const HomePage() : const SplashScreen(),
    );
  }
}
