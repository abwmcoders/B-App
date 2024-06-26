import 'dart:async';

import 'package:commerce/src/app/app_prefs.dart';
import 'package:commerce/src/app/di.dart';
import 'package:commerce/src/presentation/resources/color_manager.dart';
import 'package:commerce/src/presentation/resources/routes_manager.dart';
import 'package:flutter/material.dart';

import '../../resources/assets_manager.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Timer? _timer;
  final AppPreferences _appPreferences = instance<AppPreferences>();
  
  _startDelay() {
    _timer = Timer(const Duration(seconds: 4), _goNext);
  }

  _goNext() async {
    _appPreferences.isUserLoggedIn().then(
          (isUserLoggedIn) => {
            if (isUserLoggedIn)
              {
                Navigator.pushReplacementNamed(
                  context,
                  Routes.mainRoute,
                )
              }
            else
              {
                _appPreferences.isOnBoardingScreenViewed().then(
                      (isOnbaordingViewed) => {
                        if (isOnbaordingViewed)
                          {
                            Navigator.pushReplacementNamed(
                              context,
                              Routes.loginRoute,
                            )
                          }
                        else
                          {
                            Navigator.pushReplacementNamed(
                              context,
                              Routes.onBoardingRoute,
                            )
                          },
                      },
                    ),
              },
          },
        );
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: const Center(
        child: Image(
          image: AssetImage(
            ImageAssets.splashLogo,
          ),
        ),
      ),
    );
  }
}
