import 'package:appmetrica_plugin/appmetrica_plugin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:knitwit/router/router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');
  runApp(const KnitwitApp());
  _initAppMetric();
}

class KnitwitApp extends StatefulWidget {
  const KnitwitApp({super.key});


  @override
  State<KnitwitApp> createState() => _KnitwitApp();
}

Future<void> _initAppMetric() async {
  //final appmetric_key = dotenv.env['APPMETRICA_KEY'];

  //print(appmetric_key);
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


