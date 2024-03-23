import 'package:flutter/material.dart';
import 'package:minerestoran/database/auth/service.dart';
import 'package:minerestoran/pages/BottomPages/Menu.dart';
import 'package:minerestoran/pages/BottomPages/order.dart';
import 'package:minerestoran/pages/BottomPages/profile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String title = "Меню";
  int index = 0;
  final pages = [const MenuPage(), const OrderPage(), const ProfilePage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () async {
                  await AuthService().logOut();
                  Navigator.pushNamed(context, "/");
                },
                icon: Icon(
                  Icons.logout,
                  color: Colors.orange,
                ))
          ],
          title: Text(
            title,
            style: const TextStyle(color: Colors.white),
          )),
      drawer: null,
      body: pages.elementAt(index),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.menu_book), label: "Меню"),
          BottomNavigationBarItem(
              icon: Icon(Icons.receipt_long), label: "Заказы"),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_box), label: "Профиль")
        ],
        currentIndex: index,
        onTap: (value) {
          setState(() {
            index = value;
            if (index == 0) {
              title = "Меню";
            } else if (index == 1) {
              title = "История заказов";
            } else if (index == 2) {
              title = "Профиль";
            }
          });
        },
      ),
    );
  }
}
