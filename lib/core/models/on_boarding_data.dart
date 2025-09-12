import 'package:movies_app/core/constant/assets/assets.dart';
import 'package:movies_app/core/constant/strings.dart';

class OnBoardingData {
  String imagePath, title;
  String? description;
  OnBoardingData({
    required this.imagePath,
    required this.title,
    this.description,
  });

  static List<OnBoardingData> onBoardingList = [
    OnBoardingData(
      imagePath: Assets.onBoarding1img,
      title: Strings.onBoardingTitle1,
      description: Strings.onBoardingDescription1,
    ),
    OnBoardingData(
      imagePath: Assets.onBoarding2img,
      title: Strings.onBoardingTitle2,
      description: Strings.onBoardingDescription2,
    ),
    OnBoardingData(
      imagePath: Assets.onBoarding3img,
      title: Strings.onBoardingTitle3,
      description: Strings.onBoardingDescription3,
    ),
    OnBoardingData(
      imagePath: Assets.onBoarding4img,
      title: Strings.onBoardingTitle4,
      description: Strings.onBoardingDescription4,
    ),
    OnBoardingData(
      imagePath: Assets.onBoarding5img,
      title: Strings.onBoardingTitle5,
      description: Strings.onBoardingDescription5,
    ),
    OnBoardingData(
      imagePath: Assets.onBoarding6img,
      title: Strings.onBoardingTitle6,
    ),
  ];
}
