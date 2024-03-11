import 'package:flutter/material.dart';
import 'package:minerestoran/database/auth/model.dart';
import 'package:minerestoran/pages/auth.dart';
import 'package:minerestoran/pages/home.dart';
import 'package:provider/provider.dart';

class LadingPage extends StatelessWidget {
  const LadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final UserModel? userModel = Provider.of<UserModel?>(context);
    final bool check = userModel != null;
    return check ? const HomePage() : const AuthPage();
  }
}
