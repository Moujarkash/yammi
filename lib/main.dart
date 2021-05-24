import 'package:flutter/material.dart';
import 'package:yammi/src/app.dart';

import 'core/utils/enviroment.dart';
import 'injection.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await configureInjection(Environment.dev);

  runApp(App());
}