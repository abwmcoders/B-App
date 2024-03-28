import 'package:flutter/material.dart';

import 'src/app/app.dart';
import 'src/app/di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initAppModule();
  runApp(
    MyApp(),
  );
}
