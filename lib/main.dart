import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:menopal/screens/Calendar.dart';
import 'package:menopal/firebase_options.dart';
import 'screens/RegistrationScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MenoPal());
}

class MenoPal extends StatelessWidget {
  const MenoPal({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Meno Pal",
      theme: ThemeData(primarySwatch: Colors.pink),
      home: RegistrationScreen(),
    );
  }
}
