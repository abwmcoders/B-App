import 'package:commerce/src/presentation/common/state_renderer/state_renderer_implementer.dart';
import 'package:commerce/src/presentation/resources/color_manager.dart';
import 'package:commerce/src/presentation/view/forget_password/forget_password_viewmodel.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/svg.dart';

import '../../../app/di.dart';
import '../../resources/assets_manager.dart';
import '../../resources/routes_manager.dart';
import '../../resources/string_manager.dart';
import '../../resources/value_manager.dart';

class ForgetPasswordView extends StatefulWidget {
  const ForgetPasswordView({super.key});

  @override
  State<ForgetPasswordView> createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState extends State<ForgetPasswordView> {
  //
  final ForgetPasswordViewModel _forgotPasswordViewModel =
      instance<ForgetPasswordViewModel>();
  //
  final TextEditingController _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  _bind() {
    _forgotPasswordViewModel.start();
    _emailController.addListener(
      () => _forgotPasswordViewModel.setEmail(
        _emailController.text,
      ),
    );
    SchedulerBinding.instance.addPersistentFrameCallback(
      (_) {
        Navigator.of(context).pushReplacementNamed(Routes.loginRoute);
      },
    );
  }

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
        stream: _forgotPasswordViewModel.outputState,
        builder: (context, snapshot) {
          return snapshot.data?.getScreenWidget(
                context,
                _forgotPasswordContentWidget(),
                () {
                  _forgotPasswordViewModel.forgetPassword();
                },
              ) ??
              _forgotPasswordContentWidget();
        },
      ),
    );
  }

  Widget _forgotPasswordContentWidget() {
    return Container(
      padding: const EdgeInsets.only(top: AppPadding.p100),
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
                child: StreamBuilder<bool>(
                  stream: _forgotPasswordViewModel.isEmailValidOutput,
                  builder: (context, snapshot) {
                    return TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: _emailController,
                      decoration: InputDecoration(
                        hintText: AppStrings.emailHint.tr(),
                        labelText: AppStrings.username.tr(),
                        errorText: (snapshot.data ?? true)
                            ? null
                            : AppStrings.usernameError.tr(),
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
                child: StreamBuilder<bool>(
                  stream: _forgotPasswordViewModel.isAllOutputValid,
                  builder: (context, snapshot) {
                    return SizedBox(
                      width: double.infinity,
                      height: AppSize.s40,
                      child: ElevatedButton(
                        onPressed: (snapshot.data ?? false)
                            ? () {
                                _forgotPasswordViewModel.forgetPassword();
                              }
                            : null,
                        child: const Text(AppStrings.forgetPassword).tr(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _forgotPasswordViewModel.dispose();
    super.dispose();
  }
}
