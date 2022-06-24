import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:notes_keeper/pages/email_login_view.dart';
import 'package:notes_keeper/pages/homepage.dart';
import 'package:notes_keeper/pages/register_view.dart';
import 'package:notes_keeper/pages/verify_email.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'notes keeper',
    theme: ThemeData.dark().copyWith(
        primaryColor: Colors.white,
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.white),
        scaffoldBackgroundColor: Color(0xff070706)),
    home: const LoginView(),
    routes: {
      'login': (context) => const LoginView(),
      '/register/': (context) => const RegisterView(),
      'homepage': (context) => const HomePage(),
      'verify': (context) => const verifyEmailView(),
    },
  ));
}

