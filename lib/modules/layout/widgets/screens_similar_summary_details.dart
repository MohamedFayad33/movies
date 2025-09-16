import 'package:flutter/material.dart';
import 'package:movies_app/core/constant/assets/assets.dart';
import 'package:movies_app/core/constant/strings.dart';
class ScreensSimilarSummaryDetails extends StatelessWidget {
   ScreensSimilarSummaryDetails({super.key});

  final List<String> screenshots = [
    Assets.screenshot1,
    Assets.screenshot2,
    Assets.screenshot3
  ];

  final List<Map> similarMovies = [
    {
      'rating': '7.7',
      'image': Assets.similarMovies1
    },
    {
      'rating': '7.7',
      'image': Assets.similarMovies2
    },
    {
      'rating': '7.7',
      'image': Assets.similarMovies3
    },
    {
      'rating': '7.7',
      'image': Assets.similarMovies4
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Screen Shots',
            style: TextStyle(color: Colors.white,fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 14),
          Column(
            children: List.generate(
              screenshots.length,
                  (index) => Column(
                children: [
                  InkWell(onTap:() {} ,
                    child: Container(
                      width: 400,
                      height: 140,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        image: DecorationImage(
                          image: AssetImage(screenshots[index]),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 14),
                ],
              ),
            ),
          ),
          Text(
            'Similar',
            style: TextStyle(color: Colors.white,fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            children: List.generate(
              similarMovies.length,
                  (index) => Column(
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: InkWell(
                          onTap: () {},
                          child: Image.asset(
                            similarMovies[index]["image"],
                            width: 180,
                            height: 280,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 6,
                        left: 8,
                        child: Container(
                          padding: EdgeInsets.all(4),
                          color: Colors.black54,
                          child: Text(
                            "⭐ ${similarMovies[index]["rating"]}",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 24),
          Text(
            'Summary',
            style: TextStyle(color: Colors.white,fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(Strings.descriptionMovie,
            style: TextStyle(fontSize: 16, color: Colors.white,fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}

