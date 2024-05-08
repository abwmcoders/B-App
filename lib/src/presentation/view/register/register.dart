import 'dart:io';

import 'package:commerce/src/app/app_prefs.dart';
import 'package:commerce/src/app/di.dart';
import 'package:commerce/src/data/mappers/mapper.dart';
import 'package:commerce/src/presentation/view/register/register_viewmodel.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

import '../../common/state_renderer/state_renderer_implementer.dart';
import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';
import '../../resources/routes_manager.dart';
import '../../resources/string_manager.dart';
import '../../resources/value_manager.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  //
  final AppPreferences _appPreferences = instance<AppPreferences>();
  final RegisterViewModel _registerViewModel = instance<RegisterViewModel>();
  final ImagePicker _imagePicker = instance<ImagePicker>();
  //
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  _bind() {
    _registerViewModel.start();
    //
    _usernameController.addListener(
      () => _registerViewModel.setUsername(_usernameController.text),
    );
    _numberController.addListener(
      () => _registerViewModel.setNumber(_numberController.text),
    );
    _emailController.addListener(
      () => _registerViewModel.setEmail(_emailController.text),
    );
    _passwordController.addListener(
      () => _registerViewModel.setPassword(_passwordController.text),
    );
    _registerViewModel.isUserLoggedInSuccessfully.stream.listen(
      (isSuccessLoggedIn) {
        SchedulerBinding.instance.addPersistentFrameCallback(
          (_) {
            _appPreferences.setUserLoggedIn();
            Navigator.of(context).pushReplacementNamed(Routes.mainRoute);
          },
        );
      },
    );
  }

//

  @override
  void initState() {
    super.initState();
    _bind();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: StreamBuilder<FlowState>(
        stream: _registerViewModel.outputState,
        builder: (context, snapshot) {
          return snapshot.data?.getScreenWidget(context, _getContentWidget(),
                  () {
                _registerViewModel.register();
              }) ??
              _getContentWidget();
        },
      ),
    );
  }

  Widget _getContentWidget() {
    return Container(
      padding: const EdgeInsets.only(top: AppPadding.p60),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SvgPicture.asset(ImageAssets.loginIc),
              const SizedBox(
                height: AppSize.s28,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: AppPadding.p28, right: AppPadding.p28),
                child: StreamBuilder<String?>(
                  stream: _registerViewModel.outputUsernameError,
                  builder: (context, snapshot) {
                    return TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: _usernameController,
                      decoration: InputDecoration(
                        hintText: AppStrings.username.tr(),
                        labelText: AppStrings.username.tr(),
                        errorText: snapshot.data,
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: AppSize.s28,
              ),
              Padding(
                padding: const EdgeInsets.only( // 12 - tp nd bt 
                    left: AppPadding.p28, right: AppPadding.p28),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: CountryCodePicker(
                        onChanged: (country) {
                          _registerViewModel
                              .setCountryCode(country.dialCode ?? empty);
                        },
                        initialSelection: "+234",
                        showCountryOnly: true,
                        showOnlyCountryWhenClosed: true,
                        favorite: const ["+244", "+253", "+39", "+966", "+02"],
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: StreamBuilder<String?>(
                        stream: _registerViewModel.outputMobileNumberError,
                        builder: (context, snapshot) {
                          return TextFormField(
                            keyboardType: TextInputType.visiblePassword,
                            controller: _numberController,
                            decoration: InputDecoration(
                              hintText: AppStrings.mobileNumber.tr(),
                              labelText: AppStrings.mobileNumber.tr(),
                              errorText: snapshot.data,
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: AppSize.s28,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: AppPadding.p28, right: AppPadding.p28),
                child: StreamBuilder<String?>(
                  stream: _registerViewModel.outputEmailError,
                  builder: (context, snapshot) {
                    return TextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      controller: _emailController,
                      decoration: InputDecoration(
                        hintText: AppStrings.emailHint.tr(),
                        labelText: AppStrings.emailHint.tr(),
                        errorText: snapshot.data,
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: AppSize.s28,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: AppPadding.p28, right: AppPadding.p28),
                child: StreamBuilder<String?>(
                  stream: _registerViewModel.outputPasswordError,
                  builder: (context, snapshot) {
                    return TextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      controller: _passwordController,
                      decoration: InputDecoration(
                        hintText: AppStrings.password.tr(),
                        labelText: AppStrings.password.tr(),
                        errorText: snapshot.data,
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: AppSize.s28,
              ),
              //! Profile Pix
              Padding(
                padding: const EdgeInsets.only(
                    left: AppPadding.p28, right: AppPadding.p28),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: ColorManager.lightGrey,
                    ),
                  ),
                  child: GestureDetector(
                    child: _getMediaWidget(),
                    onTap: () {
                      _showPicker(context);
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: AppSize.s28,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: AppPadding.p28, right: AppPadding.p28),
                child: StreamBuilder<bool>(
                  stream: _registerViewModel.isAllOutputValid,
                  builder: (context, snapshot) {
                    return SizedBox(
                      width: double.infinity,
                      height: AppSize.s40,
                      child: ElevatedButton(
                        onPressed: (snapshot.data ?? false)
                            ? () {
                                _registerViewModel.register();
                              }
                            : null,
                        child: const Text(AppStrings.register).tr(),
                      ),
                    );
                  },
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(
                    top: AppPadding.p8,
                    left: AppPadding.p28,
                    right: AppPadding.p28),
                child: Center(
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, Routes.loginRoute);
                    },
                    child: Text(
                      AppStrings.haveAccount.tr(),
                      textAlign: TextAlign.end,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _showPicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SafeArea(
          child: Wrap(
            children: [
              ListTile(
                trailing: const Icon(Icons.arrow_forward),
                leading: const Icon(Icons.camera),
                title: const Text(AppStrings.photoGalley).tr(),
                onTap: () {
                  _imageFromGallery();
                  Navigator.pop(context);
                },
              ),
              ListTile(
                trailing: const Icon(Icons.arrow_forward),
                leading: const Icon(Icons.camera_alt_outlined),
                title: const Text(AppStrings.photoCamera).tr(),
                onTap: () {
                  _imageFromCamera();
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  _imageFromGallery() async {
    var image = await _imagePicker.pickImage(source: ImageSource.gallery);
    _registerViewModel.setProfilePix(
      File(image?.path ?? empty),
    );
  }

  _imageFromCamera() async{
    var image = await _imagePicker.pickImage(source: ImageSource.camera);
    _registerViewModel.setProfilePix(
      File(image?.path ?? empty),
    );
  }

  Widget _getMediaWidget() {
    return Padding(
      padding: const EdgeInsets.only(left: AppPadding.p8, right: AppPadding.p8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: const Text(AppStrings.profilePicture).tr(),
          ),
          Flexible(
            child: StreamBuilder<File?>(
              stream: _registerViewModel.outputProfilePix,
              builder: (context, snapshot) {
                return _imagePickedByUser(snapshot.data);
              },
            ),
          ),
          Flexible(
            child: SvgPicture.asset(ImageAssets.photoCameraIc),
          ),
        ],
      ),
    );
  }

  Widget _imagePickedByUser(File? image) {
    if (image != null && image.path.isNotEmpty) {
      return Image.file(image);
    } else {
      return Container();
    }
  }

  @override
  void dispose() {
    _registerViewModel.dispose();
    super.dispose();
  }
}
