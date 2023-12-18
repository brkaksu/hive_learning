import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_learning/cubit/user_cubit.dart';
import 'package:hive_learning/hive/local_storage_manager.dart';

import 'pages/home/home_view.dart';
import 'pages/splash/splash_view.dart';

Future<void> main() async {
  await Hive.initFlutter();
  await Hive.openBox(LocalStorageManager.boxName);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserCubit(),
      child: MaterialApp(
        title: 'Hive Local Storage',
        theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrangeAccent)),
        routes: {
          '/': (context) => const SplashView(),
          '/homeView': (context) => const HomeView(),
        },
      ),
    );
  }
}
