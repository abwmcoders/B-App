import 'dart:async';

import 'package:commerce/src/domain/model/model.dart';

import '../../../base/base_viewmodel.dart';
import '../../../resources/assets_manager.dart';
import '../../../resources/string_manager.dart';

class OnBoardingViewModel extends BaseViewModel
    implements OnBoardingViewModelInputs, OnBoardingViewModelOutputs {
  final StreamController _streamController =
      StreamController<SliderViewObject>();

  late final List<SliderObject> _list;
  int _currentIndex = 0;
  List<SliderObject> _getSliderData() => [
        SliderObject(
          image: ImageAssets.onboardingLogo1,
          subTitle: AppStrings.onBoardingSubTitle1,
          title: AppStrings.onBoardingTitle1,
        ),
        SliderObject(
          image: ImageAssets.onboardingLogo2,
          subTitle: AppStrings.onBoardingSubTitle2,
          title: AppStrings.onBoardingTitle2,
        ),
        SliderObject(
          image: ImageAssets.onboardingLogo3,
          subTitle: AppStrings.onBoardingSubTitle3,
          title: AppStrings.onBoardingTitle3,
        ),
        SliderObject(
          image: ImageAssets.onboardingLogo4,
          subTitle: AppStrings.onBoardingSubTitle4,
          title: AppStrings.onBoardingTitle4,
        ),
      ];

  _postDataToView() {
    inputSliderViewObject.add(
      SliderViewObject(
        currentIndex: _currentIndex,
        numberOfSlides: _list.length,
        sliderObject: _list[_currentIndex],
      ),
    );
  }

  @override
  void dispose() {
    _streamController.close();
  }

  @override
  void start() {
    _list = _getSliderData();
    _postDataToView();
  }

  @override
  int goNext() {
    int index = _currentIndex++;
    if (index >= _list.length) {
      _currentIndex = 0;
    }
    return _currentIndex;
  }

  @override
  int goPrev() {
    int index = _currentIndex--;
    if (index == -1) {
      _currentIndex = _list.length - 1;
    }
    return _currentIndex;
  }

  @override
  void onPageChanged(int index) {
    _currentIndex = index;
    _postDataToView();
  }

  @override
  Sink get inputSliderViewObject => _streamController.sink;

  @override
  Stream<SliderViewObject> get outputSliderViewObject =>
      _streamController.stream.map((sliderObject) => sliderObject);
}

abstract class OnBoardingViewModelInputs {
  void goNext();
  void goPrev();
  void onPageChanged(int index);

  Sink get inputSliderViewObject;
}

abstract class OnBoardingViewModelOutputs {
  Stream<SliderViewObject> get outputSliderViewObject;
}

class SliderViewObject {
  SliderObject sliderObject;
  int numberOfSlides;
  int currentIndex;

  SliderViewObject({
    required this.currentIndex,
    required this.numberOfSlides,
    required this.sliderObject,
  });
}
  // https://abwmcode.wiremockapi.cloud/
  // customers/login
//   {
//     "email": "abc",
//     "password": "123456",
//     "imei": "123",
//     "device-type": "samsung"
// }