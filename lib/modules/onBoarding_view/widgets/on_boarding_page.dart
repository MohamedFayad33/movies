import 'package:flutter/material.dart';
import 'package:movies_app/core/helper/shared_preferences/shared_constanse.dart';
import 'package:movies_app/core/helper/shared_preferences/shared_preferences.dart';
import 'package:movies_app/core/models/on_boarding_data.dart';
import 'package:movies_app/core/routes/pages_routes_name.dart';
import 'package:movies_app/core/theme/color_pallete.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({
    super.key,
    required this.onBoardingData,
    required this.index,
    required this.controller,
  });
  final OnBoardingData onBoardingData;
  final int index;
  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(onBoardingData.imagePath),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 14, horizontal: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: (index == 0) ? Colors.transparent : ColorPallete.primaryColor,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              onBoardingData.title,
              textAlign: TextAlign.center,
              style: (index == 0)
                  ? TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.w700,
                      color: ColorPallete.white,
                    )
                  : TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: ColorPallete.white,
                    ),
            ),
            SizedBox(height: 8),
            if (onBoardingData.description != null)
              Text(
                onBoardingData.description!,
                textAlign: TextAlign.center,
                style: (index == 0)
                    ? TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                      )
                    : TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: ColorPallete.white,
                      ),
              ),
            SizedBox(height: 10),
            if (index == 0)
              ElevatedButton(
                onPressed: () {
                  controller.animateToPage(
                    index + 1,
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeIn,
                  );
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(398, 55),
                  foregroundColor: ColorPallete.primaryColor,
                  backgroundColor: ColorPallete.yellow,
                  textStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                child: Text("Explore Now"),
              )
            else if (index == 1)
              ElevatedButton(
                onPressed: () {
                  controller.animateToPage(
                    index + 1,
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeIn,
                  );
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(398, 55),
                  foregroundColor: ColorPallete.primaryColor,
                  backgroundColor: ColorPallete.yellow,
                  textStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                child: Text("Next"),
              )
            else if (index == OnBoardingData.onBoardingList.length - 1)
              ElevatedButton(
                onPressed: () async {
                  await AppSharedPreferences.prefe.setBool(
                    SharedConstanse.isFirstTime,
                    true,
                  );
                  Navigator.pushReplacementNamed(
                    // ignore: use_build_context_synchronously
                    context,
                    PagesRoutesName.login,
                  );
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(398, 55),
                  foregroundColor: ColorPallete.primaryColor,
                  backgroundColor: ColorPallete.yellow,
                  textStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                child: Text("Finish"),
              )
            else
              Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      controller.animateToPage(
                        index + 1,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.easeIn,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(398, 55),
                      foregroundColor: ColorPallete.primaryColor,
                      backgroundColor: ColorPallete.yellow,
                      textStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    child: Text("Next"),
                  ),
                  SizedBox(height: 14),
                  ElevatedButton(
                    onPressed: () {
                      controller.animateToPage(
                        index - 1,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.easeIn,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(398, 55),
                      foregroundColor: ColorPallete.primaryColor,
                      backgroundColor: ColorPallete.yellow,
                      textStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    child: Text("Back"),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
