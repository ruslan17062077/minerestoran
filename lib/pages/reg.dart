import 'package:flutter/material.dart';
import 'package:minerestoran/database/auth/service.dart';
import 'package:minerestoran/database/collection/UserCollection.dart';
import 'package:toast/toast.dart';

class RegPage extends StatefulWidget {
  const RegPage({super.key});

  @override
  State<RegPage> createState() => _RegPageState();
}

class _RegPageState extends State<RegPage> {
  bool visibility1 = false;
  bool visibility2 = false;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordControlletr = TextEditingController();
  TextEditingController password1Controlletr = TextEditingController();
  AuthService authservice = AuthService();
  UserCollection userCollection = UserCollection();

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "images/logo.png",
                height: MediaQuery.of(context).size.height * 0.2,
                width: MediaQuery.of(context).size.width * 0.4,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: TextField(
                  style: const TextStyle(color: Colors.white),
                  cursorColor: Colors.white,
                  decoration: const InputDecoration(
                      labelText: "Имя",
                      hintText: "Имя",
                      hintStyle: TextStyle(color: Colors.white),
                      labelStyle: TextStyle(color: Colors.white),
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.elliptical(10, 10)),
                          borderSide: BorderSide(color: Colors.white)),
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.white,
                      )),
                  controller: nameController,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: TextField(
                  cursorColor: Colors.white,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
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
                  controller: emailController,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: TextField(
                  style: const TextStyle(color: Colors.white),
                  cursorColor: Colors.white,
                  decoration: const InputDecoration(
                      labelText: "Phone",
                      hintText: "Phone",
                      hintStyle: TextStyle(color: Colors.white),
                      labelStyle: TextStyle(color: Colors.white),
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.elliptical(10, 10)),
                          borderSide: BorderSide(color: Colors.white)),
                      prefixIcon: Icon(
                        Icons.phone,
                        color: Colors.white,
                      )),
                  controller: phoneController,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: TextField(
                  cursorColor: Colors.white,
                  style: const TextStyle(color: Colors.white),
                  obscureText: !visibility1,
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
                              visibility1 = !visibility1;
                            });
                          },
                          icon: const Icon(Icons.visibility,
                              color: Colors.white))),
                  controller: passwordControlletr,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.07,
                child: TextField(
                  style: TextStyle(color: Colors.white),
                  cursorColor: Colors.white,
                  obscureText: !visibility2,
                  decoration: InputDecoration(
                      labelText: "Repeat Password",
                      hintText: "Repeat Password",
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
                      suffix: IconButton(
                          onPressed: () {
                            setState(() {
                              visibility2 = !visibility2;
                            });
                          },
                          icon: const Icon(Icons.visibility,
                              color: Colors.white))),
                  controller: password1Controlletr,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.55,
                height: MediaQuery.of(context).size.height * 0.06,
                child: ElevatedButton(
                  onPressed: () async {
                    if (nameController.text.isEmpty ||
                        emailController.text.isEmpty ||
                        phoneController.text.isEmpty ||
                        password1Controlletr.text.isEmpty ||
                        passwordControlletr.text.isEmpty) {
                      Toast.show("Введите коректную информацию");
                    } else {
                      if (password1Controlletr.text ==
                          passwordControlletr.text) {
                        var user = await authservice.createIn(
                            emailController.text, passwordControlletr.text);
                        if (user != null) {
                          await UserCollection().addUserCollection(
                              user.id.toString(),
                              emailController.text,
                              nameController.text,
                              phoneController.text,
                              password1Controlletr.text);
                        } else {
                          Toast.show("Проверте данные");
                        }
                      } else {
                        Toast.show("Пароли не одинаковые!");
                      }
                    }
                  },
                  child: const Text("Зарегестрироваться"),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              InkWell(
                child: const Text(
                  "Есть аккаунт? Войти",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onTap: () {
                  Navigator.popAndPushNamed(context, "/");
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
