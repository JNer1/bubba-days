import 'package:bubba_days/views/homepage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const shade850 = Color(0xFF303030);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bubba Days',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          titleTextStyle: GoogleFonts.workSans(
            textStyle:
                const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          backgroundColor: shade850,
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
          ),
        ),
        scaffoldBackgroundColor: Colors.grey.shade900,
        primarySwatch: Colors.indigo,
        textTheme: GoogleFonts.workSansTextTheme(ThemeData.dark().textTheme),
      ),
      home: const HomePage(),
    );
  }
}

class AuthenticationWrapper extends StatelessWidget {
  const AuthenticationWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
