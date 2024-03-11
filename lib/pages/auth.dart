import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool visibility = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "images/logo.png",
                height: MediaQuery.of(context).size.height * 0.3,
                width: MediaQuery.of(context).size.width * 0.5,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: const TextField(
                  style: TextStyle(color: Colors.white),
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                      labelText: "Email",
                      hintText: "Email",
                      hintStyle: TextStyle(color: Colors.white),
                      labelStyle: TextStyle(color: Colors.white),
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.elliptical(10, 10)),
                          borderSide: BorderSide(color: Colors.white)),
                      prefixIcon: Icon(
                        Icons.email,
                        color: Colors.white,
                      )),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: TextField(
                    style: const TextStyle(color: Colors.white),
                    obscureText: !visibility,
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                        labelText: "Password",
                        hintText: "Password",
                        hintStyle: const TextStyle(color: Colors.white),
                        labelStyle: const TextStyle(color: Colors.white),
                        border: const OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.elliptical(10, 10)),
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        prefixIcon: const Icon(
                          Icons.password,
                          color: Colors.white,
                        ),
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                visibility = !visibility;
                              });
                            },
                            icon: const Icon(
                              Icons.visibility,
                              color: Colors.white,
                            )))),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.55,
                height: MediaQuery.of(context).size.height * 0.06,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.popAndPushNamed(context, "/home");
                  },
                  child: const Text("Войти"),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              InkWell(
                child: const Text(
                  "Нет аккаунта? Регистрация",
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  Navigator.popAndPushNamed(context, "/registration");
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
