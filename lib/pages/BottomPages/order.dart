import 'package:flutter/material.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Card(
            child: ListTile(
              title: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Text("Заказ")],
              ),
              subtitle: const Column(
                children: [Text("Дата"), Text("Сумма")],
              ),
              leading: Image.asset("images/logo.png"),
              onTap: () {
              },
            ),
          )
        ],
      ),
    );
  }
}
