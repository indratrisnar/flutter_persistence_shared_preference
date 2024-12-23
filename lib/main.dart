import 'package:flutter/material.dart';
import 'package:flutter_persistence_shared_preference/data/session.dart';
import 'package:flutter_persistence_shared_preference/pages/counter_page.dart';
import 'package:flutter_persistence_shared_preference/pages/menu_page.dart';
import 'package:flutter_persistence_shared_preference/pages/profile_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

late final Session session;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final pref = await SharedPreferences.getInstance();
  session = Session(pref);
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MenuPage(),
      routes: {
        '/counter': (context) => CounterPage(),
        '/profile': (context) => ProfilePage(),
      },
    );
  }
}
