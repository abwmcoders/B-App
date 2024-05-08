import 'package:commerce/src/app/di.dart';
import 'package:commerce/src/domain/model/model.dart';
import 'package:commerce/src/presentation/common/state_renderer/state_renderer_implementer.dart';
import 'package:commerce/src/presentation/resources/string_manager.dart';
import 'package:commerce/src/presentation/resources/value_manager.dart';
import 'package:commerce/src/presentation/view/store_details/store_details_viewmodel.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../resources/color_manager.dart';

class StoreDetailsView extends StatefulWidget {
  const StoreDetailsView({super.key});

  @override
  State<StoreDetailsView> createState() => _StoreDetailsViewState();
}

class _StoreDetailsViewState extends State<StoreDetailsView> {
  final StoreDetailsViewModel _storeDetailsViewModel =
      instance<StoreDetailsViewModel>();

  @override
  void initState() {
    _bind();
    super.initState();
  }

  _bind() {
    _storeDetailsViewModel.start();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<FlowState>(
        stream: _storeDetailsViewModel.outputState,
        builder: (context, snapshot) {
          return Scaffold(
            body: snapshot.data?.getScreenWidget(context, _getScreenContent(),
                    () {
                  _storeDetailsViewModel.start();
                }) ??
                Container(),
          );
        },
      ),
    );
  }

  Widget _getScreenContent() {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBar(
        title: const Text(AppStrings.storeDetails).tr(),
        elevation: AppSize.s0,
        iconTheme: IconThemeData(
          color: ColorManager.white,
        ),
        backgroundColor: ColorManager.primary,
        centerTitle: true,
      ),
      body: Container(
        constraints: const BoxConstraints.expand(),
        color: ColorManager.white,
        child: SingleChildScrollView(
          child: StreamBuilder<StoreDetails>(
            stream: _storeDetailsViewModel.outputStoreDetailsData,
            builder: ((context, snapshot) {
              return _getItems(snapshot.data!);
            }),
          ),
        ),
      ),
    );
  }

  Widget _getItems(StoreDetails? storeDetails) {
    if (storeDetails != null) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Image.network(
              storeDetails.image!,
              fit: BoxFit.cover,
              width: double.infinity,
              height: AppSize.s250,
            ),
          ),
          _getSection(AppStrings.details.tr()),
          _getInfoText(storeDetails.details!),
          _getSection(AppStrings.services.tr()),
          _getInfoText(storeDetails.services!),
          _getSection(AppStrings.about.tr()),
          _getInfoText(storeDetails.about!),
        ],
      );
    } else {
      return Container();
    }
  }

  Widget _getSection(String text) {
    return Padding(
      padding: const EdgeInsets.only(
        top: AppPadding.p12,
        left: AppPadding.p12,
        right: AppPadding.p12,
        bottom: AppPadding.p2,
      ),
      child: Text(
        text,
        style: Theme.of(context).textTheme.headlineMedium,
      ),
    );
  }

  Widget _getInfoText(String info) {
    return Padding(
      padding: const EdgeInsets.all(AppSize.s12),
      child: Text(
        info,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
    );
  }

  @override
  void dispose() {
    _storeDetailsViewModel.dispose();
    super.dispose();
  }
}
