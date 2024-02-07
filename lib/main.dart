import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_test/firebase_options.dart';
import 'package:firebase_test/homepage.dart';
import 'package:firebase_test/loginpage.dart';
import 'package:flutter/material.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   User? user = FirebaseAuth.instance.currentUser;
//   runApp(MaterialApp(
//     debugShowCheckedModeBanner: false,
//     home: user == null ? const LoginPage() : const HomePage(),
//   ));
// }
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: LoginPage()));
}
