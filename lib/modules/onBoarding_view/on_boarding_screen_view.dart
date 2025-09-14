import 'package:flutter/material.dart';
import 'package:movies_app/core/models/on_boarding_data.dart';
import 'package:movies_app/core/theme/color_pallete.dart';
import 'package:movies_app/modules/onBoarding_view/widgets/on_boarding_page.dart';

class OnBoardingScreenView extends StatefulWidget {
  const OnBoardingScreenView({super.key});

  @override
  State<OnBoardingScreenView> createState() => _OnBoardingScreenViewState();
}

class _OnBoardingScreenViewState extends State<OnBoardingScreenView> {
  PageController pageController = PageController();
  int currentIndex = 0;
  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      currentIndex = pageController.page!.toInt();
      setState(() {
        // if(currentIndex==OnBoardingData.onBoardingList.length-1){Timer(Duration(seconds: 1), (){Navigator.pushReplacementNamed(context, PagesRoutesName.login);});}
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPallete.primaryColor,
      body: PageView(
        controller: pageController,
        children: List.generate(
          OnBoardingData.onBoardingList.length,
          (index) => OnBoardingPage(
            onBoardingData: OnBoardingData.onBoardingList[index],
            index: index,
            controller: pageController,
          ),
        ),
      ),
    );
  }
}
