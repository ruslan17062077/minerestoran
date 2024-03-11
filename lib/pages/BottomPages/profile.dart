import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
      child: Center(
          child: Container(
        height: MediaQuery.of(context).size.height * 0.6,
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(
            border: Border.all(color: const Color(0xff808080)),
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            color: Colors.blueGrey),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.account_box,
              color: Colors.white,
              size: 100,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Имя:   ",
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
                Text(
                  "Имя",
                  style: TextStyle(fontSize: 25, color: Colors.white),
                )
              ],
            ),
            const Padding(padding: EdgeInsets.all(5)),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Email:   ",
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
                Text(
                  "Email",
                  style: TextStyle(fontSize: 25, color: Colors.white),
                )
              ],
            ),
            const Padding(padding: EdgeInsets.all(5)),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Телефон:   ",
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
                Text(
                  "Телефон",
                  style: TextStyle(fontSize: 25, color: Colors.white),
                )
              ],
            ),
            const Padding(padding: EdgeInsets.all(5)),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Пароль:   ",
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
                Text(
                  "Пароль",
                  style: TextStyle(fontSize: 25, color: Colors.white),
                )
              ],
            ),
            const Padding(padding: EdgeInsets.all(30)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  child: const Text("Выйти"),
                  onPressed: () {
                    Navigator.pushNamed(context, "/");
                  },
                ),
              ],
            )
          ],
        ),
      )),
    ));
  }
}
