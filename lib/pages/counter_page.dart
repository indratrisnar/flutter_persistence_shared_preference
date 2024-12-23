import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int count = 0;

  void addCount() async {
    count++;

    final pref = await SharedPreferences.getInstance();
    final success = await pref.setInt('count', count);
    log('addCount: $success');

    setState(() {});
  }

  void initCount() async {
    final pref = await SharedPreferences.getInstance();
    final fetchedCount = pref.getInt('count');
    log('initCount: $fetchedCount');
    if (fetchedCount == null) return;

    count = fetchedCount;
    setState(() {});
  }

  @override
  void initState() {
    initCount();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Page'),
      ),
      body: Center(
        child: Text(
          '$count',
          style: TextStyle(
            fontSize: 50,
            color: Colors.black87,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addCount,
        child: Icon(Icons.add),
      ),
    );
  }
}
