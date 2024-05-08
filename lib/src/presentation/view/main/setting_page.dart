import 'package:commerce/src/app/app_prefs.dart';
import 'package:commerce/src/app/di.dart';
import 'package:commerce/src/data/data_source/local_data_source.dart';
import 'package:commerce/src/presentation/resources/assets_manager.dart';
import 'package:commerce/src/presentation/resources/language_manager.dart';
import 'package:commerce/src/presentation/resources/string_manager.dart';
import 'package:commerce/src/presentation/resources/value_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:math' as math;

import '../../resources/routes_manager.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final AppPreferences _appPreferences = instance<AppPreferences>();
  final LocalDataSource _localDataSource = instance<LocalDataSource>();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(AppPadding.p8),
      children: [
        ListTile(
          title: Text(
            AppStrings.changeLanguage.tr(),
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          leading: SvgPicture.asset(ImageAssets.changeLangIc),
          trailing: Transform(
            alignment: Alignment.center,
            transform: Matrix4.rotationY(isRtl() ? math.pi : 0),
            child: SvgPicture.asset(ImageAssets.settingsRightArrowIc),
          ),
          onTap: () {
            _changeLanguage();
          },
        ),
        ListTile(
          title: Text(
            AppStrings.contactUs.tr(),
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          leading: Transform(
            alignment: Alignment.center,
            transform: Matrix4.rotationY(isRtl() ? math.pi : 0),
            child: SvgPicture.asset(ImageAssets.settingsRightArrowIc),
          ),
          trailing: SvgPicture.asset(ImageAssets.settingsRightArrowIc),
          onTap: () {
            _contactUs();
          },
        ),
        ListTile(
          title: Text(
            AppStrings.inviteYourFriends.tr(),
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          leading: Transform(
            alignment: Alignment.center,
            transform: Matrix4.rotationY(isRtl() ? math.pi : 0),
            child: SvgPicture.asset(ImageAssets.settingsRightArrowIc),
          ),
          trailing: SvgPicture.asset(ImageAssets.settingsRightArrowIc),
          onTap: () {
            _inviteFriends();
          },
        ),
        ListTile(
          title: Text(
            AppStrings.logout.tr(),
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          leading: SvgPicture.asset(ImageAssets.logoutIc),
          onTap: () {
            _logout();
          },
        ),
      ],
    );
  }

  bool isRtl() {
    return context.locale == ARABIC_LOCAL;
  }

  void _changeLanguage() {
    _appPreferences.setLanguageChanged();
    Phoenix.rebirth(context);
  }

  void _contactUs() {}

  void _inviteFriends() {}

  void _logout() {
    _localDataSource.clearCache();
    _appPreferences.logout();
    Navigator.pushReplacementNamed(context, Routes.loginRoute);
  }
}
