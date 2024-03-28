import 'package:commerce/src/app/app.dart';
import 'package:flutter/material.dart';

class SrcTest extends StatelessWidget {
  const SrcTest({super.key});

  void updateAppState() {
    MyApp.instance.appState = 10;
  }

  void getAppState() {
    MyApp.instance.appState = 0;
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
