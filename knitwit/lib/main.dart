import 'package:flutter/material.dart';
import 'package:knitwit/router/router.dart';

Future<void> main() async {
  runApp(const KnitwitApp());
}

class KnitwitApp extends StatefulWidget {
  const KnitwitApp({super.key});


  @override
  State<KnitwitApp> createState() => _KnitwitApp();
}

class _KnitwitApp extends State<KnitwitApp> {
  final _router = AppRouter();

  @override
  Widget build(BuildContext context) {
    final primaryColor = Color(0xFF1C202A);

    return MaterialApp.router(
      title: 'KnitWit',
      theme: ThemeData(
        primaryColor: primaryColor,
        scaffoldBackgroundColor: primaryColor,
        colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
        useMaterial3: true,
      ),
      routerConfig: _router.config(),
    );
  }
}


