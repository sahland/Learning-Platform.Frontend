import 'package:appmetrica_plugin/appmetrica_plugin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:knitwit/knitwit_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');
  _initAppMetric();
  runApp(const KnitwitApp());
}

Future<void> _initAppMetric() async {
  final appmetric_key = dotenv.env['APPMETRICA_KEY'].toString();
  AppMetrica.activate(AppMetricaConfig(appmetric_key, logs: true));
}



