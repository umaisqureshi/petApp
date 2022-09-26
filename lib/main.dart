import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Screens/SplashScreen/SplashScreen.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      title: 'Flutter Demo',
      theme: ThemeData(
          useMaterial3: true,
          primaryColor: const Color.fromARGB(255, 114, 174, 117),
          appBarTheme: AppBarTheme(
              backgroundColor: Colors.white,
              // backgroundColor: const Color.fromARGB(255, 114, 174, 117),
              centerTitle: true,
              elevation: 0,
              titleTextStyle:
                  GoogleFonts.nunito(color: Colors.black, fontSize: 25))),
      home: const SplashScreen(),
    );
  }
}
