import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hive_learning/hive/local_storage_manager.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> with LocalStorageManager {
  @override
  void initState() {
    super.initState();
    //Set values in splash view
    setValues();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Splash View',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    );
  }

  Future<void> navigateApp() async {
    await Future.delayed(const Duration(seconds: 2));
    log('home view a gidiyoruz...');
    Navigator.pushNamedAndRemoveUntil(context, '/homeView', (route) => false);
  }

  Future<void> setValues() async {
    await putItem('email', 'example@example.com');
    await putItem('username', 'example username');
    navigateApp();
  }
}
