import 'dart:developer';

import 'package:d_input/d_input.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/profile_data.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final nameController = TextEditingController();
  late final ProfileData profileData;

  void saveName() async {
    if (nameController.text.isEmpty) return;
    final success = await profileData.saveName(nameController.text);
    log('saveName: $success');
  }

  void removeName() async {
    final success = await profileData.removeName();
    log('removeName: $success');
    if (success) nameController.clear();
  }

  initProfile() async {
    final pref = await SharedPreferences.getInstance();
    profileData = ProfileData(pref);

    final name = await profileData.fetchName();
    log('initProfile');
    log('name: $name');
    nameController.text = name ?? '';
  }

  @override
  void initState() {
    initProfile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          DInputMix(
            controller: nameController,
            title: 'Name',
            hint: 'No Name',
            inputPadding: EdgeInsets.symmetric(vertical: 16),
            prefixIcon: IconSpec(
              icon: Icons.save,
              onTap: saveName,
            ),
            suffixIcon: IconSpec(
              icon: Icons.delete,
              onTap: removeName,
            ),
          ),
        ],
      ),
    );
  }
}
