import 'package:commerce/src/presentation/resources/language_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

import 'src/app/app.dart';
import 'src/app/di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await initAppModule();
  runApp(
    EasyLocalization(
      supportedLocales: const [
        ENGLISH_LOCAL,
        ARABIC_LOCAL,
      ],
      path: ASSETS_PATH_LOCALISATIONS,
      child: Phoenix(
        child: MyApp(),
      ),
    ),
  );
}
