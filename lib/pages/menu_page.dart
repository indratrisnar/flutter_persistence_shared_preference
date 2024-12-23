import 'package:flutter/material.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Counter'),
            onTap: () {
              Navigator.pushNamed(context, '/counter');
            },
            trailing: Icon(Icons.navigate_next),
          ),
          ListTile(
            title: const Text('Profile'),
            onTap: () {
              Navigator.pushNamed(context, '/profile');
            },
            trailing: Icon(Icons.navigate_next),
          ),
        ],
      ),
    );
  }
}
