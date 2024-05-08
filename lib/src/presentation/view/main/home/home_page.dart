import 'package:carousel_slider/carousel_slider.dart';
import 'package:commerce/src/app/di.dart';
import 'package:commerce/src/domain/model/model.dart';
import 'package:commerce/src/presentation/common/state_renderer/state_renderer_implementer.dart';
import 'package:commerce/src/presentation/resources/color_manager.dart';
import 'package:commerce/src/presentation/resources/string_manager.dart';
import 'package:commerce/src/presentation/resources/value_manager.dart';
import 'package:commerce/src/presentation/view/main/home/home_viewmodel.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../resources/routes_manager.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeViewModel _homeViewModel = instance<HomeViewModel>();

  @override
  void initState() {
    _bind();
    super.initState();
  }

  _bind() {
    _homeViewModel.start();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: StreamBuilder<FlowState>(
            stream: _homeViewModel.outputState,
            builder: (context, snapshot) {
              return snapshot.data?.getScreenWidget(context, getHomeContent(),
                      () {
                    _homeViewModel.start();
                  }) ??
                  Container();
            }),
      ),
    );
  }

  Widget getHomeContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _getBannersCarousel(),
        _getSection(
          AppStrings.services.tr(),
        ),
        _getServices(),
        _getSection(
          AppStrings.stores.tr(),
        ),
        _getStores(),
      ],
    );
  }

  Widget _getBannersCarousel() {
    return StreamBuilder<HomeData>(
      stream: _homeViewModel.outputHomeData,
      builder: (context, snapshot) {
        return _getBanners(snapshot.data!.banners);
      },
    );
  }

  Widget _getBanners(List<Banners>? banners) {
    if (banners != null) {
      return CarouselSlider(
        items: banners
            .map((banner) => SizedBox(
                  width: double.infinity,
                  child: Card(
                    elevation: AppSize.s1_5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        AppSize.s12,
                      ),
                      side: BorderSide(
                        color: ColorManager.white,
                        width: AppSize.s1_5,
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(
                        AppSize.s12,
                      ),
                      child: Image.network(
                        banner.image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ))
            .toList(),
        options: CarouselOptions(
          height: AppSize.s190,
          autoPlay: true,
          enableInfiniteScroll: true,
          enlargeCenterPage: true,
        ),
      );
    } else {
      return Container();
    }
  }

  Widget _getSection(String title) {
    return Padding(
      padding: const EdgeInsets.only(
          top: AppPadding.p12,
          left: AppPadding.p12,
          right: AppPadding.p12,
          bottom: AppPadding.p2),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headlineMedium,
      ),
    );
  }

  Widget _getServices() {
    return StreamBuilder<HomeData>(
      stream: _homeViewModel.outputHomeData,
      builder: (context, snapshot) {
        return _getServicesItems(snapshot.data!.services);
      },
    );
  }

  Widget _getServicesItems(List<Services>? services) {
    if (services != null) {
      return Padding(
        padding:
            const EdgeInsets.only(left: AppPadding.p12, right: AppPadding.p12),
        child: Container(
          height: AppSize.s140,
          margin: const EdgeInsets.symmetric(
            vertical: AppMargin.m12,
          ),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: services
                .map(
                  (service) => Card(
                    elevation: AppSize.s4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        AppSize.s12,
                      ),
                      side: BorderSide(
                        color: ColorManager.white,
                        width: AppSize.s1_5,
                      ),
                    ),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(
                            AppSize.s12,
                          ),
                          child: Image.network(
                            service.image,
                            fit: BoxFit.cover,
                            width: AppSize.s120,
                            height: AppSize.s100,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: AppPadding.p8,
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              service.title,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      );
    } else {
      return Container();
    }
  }

  Widget _getStores() {
    return StreamBuilder<HomeData>(
      stream: _homeViewModel.outputHomeData,
      builder: (context, snapshot) {
        return _getStoresItems(snapshot.data!.stores);
      },
    );
  }

  Widget _getStoresItems(List<Stores>? stores) {
    if (stores != null) {
      return Padding(
        padding: const EdgeInsets.only(
          left: AppPadding.p12,
          right: AppPadding.p12,
          top: AppPadding.p12,
        ),
        child: Flex(
          direction: Axis.vertical,
          children: [
            GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: AppSize.s8,
              physics: const ScrollPhysics(),
              shrinkWrap: true,
              crossAxisSpacing: AppSize.s8,
              children: List.generate(
                stores.length,
                (index) {
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed(Routes.storeDetailsRoute);
                    },
                    child: Card(
                      elevation: AppSize.s4,
                      child: Image.network(stores[index].image, fit: BoxFit.cover,),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      );
    } else {
      return Container();
    }
  }

  //
  @override
  void dispose() {
    _homeViewModel.dispose();
    super.dispose();
  }
}
