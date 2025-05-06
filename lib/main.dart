import 'package:flutter/material.dart';
import 'package:skore/application/app.dart';
import 'package:skore/application/di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initAppModule();
  runApp(MyApp());
}
