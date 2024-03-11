// ignore_for_file: prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:minerestoran/database/auth/service.dart';
import 'package:minerestoran/routes/routes.dart';
import 'package:minerestoran/themes/themeDark.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
    apiKey: 'AIzaSyC02dD1Bt8iV9bC7S08R3mHXE0tG_qI-oE',
    appId: '1:985225477081:ios:98984a5dca5fde958eb7c8',
    messagingSenderId: '9`85225477081',
    projectId: 'minerestoran',
    storageBucket: 'minerestoran.appspot.com',
    iosBundleId: 'com.example.minerestoran',
  ));
  runApp(const ThemeAppMenu());
}

class ThemeAppMenu extends StatelessWidget {
  const ThemeAppMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
      initialData: null,
      value: AuthService().currentUser,
      child: MaterialApp(
        initialRoute: '/',
        routes: routes,
        theme: themes,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
