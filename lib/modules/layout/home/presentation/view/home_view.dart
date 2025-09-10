import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:movies_app/core/constant/assets/assets.dart';
import 'package:movies_app/modules/layout/home/presentation/view/home_data.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Assets.homeBackground),
          fit: BoxFit.cover,
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 30),
            Image.asset(Assets.availableNowText),
            CarouselSlider(
              options: CarouselOptions(
                // onPageChanged: onPageChanged,
                height: MediaQuery.sizeOf(context).height * .35,

                // aspectRatio: 1 / 2,
                viewportFraction: .50,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: true,
                enlargeCenterPage: true,
                enlargeFactor: 0.20,
                scrollDirection: Axis.horizontal,
              ),
              items: HomeData.featuredMovies.map((index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadiusGeometry.circular(16),
                        child: Image.asset(
                          height: 300,
                          index["image"]!,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Positioned(
                        top: 10,
                        left: 10,
                        child: Container(
                          padding: EdgeInsets.all(6),
                          color: Colors.black54,
                          child: Text(
                            "⭐ ${index["rating"]}",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
            Image.asset(Assets.watchNowText),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Action",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  TextButton(
                    onPressed: () {
                      // Navigator.pushNamed(context, PagesRoutesName.action);
                    },
                    child: Text(
                      "See More >",
                      style: TextStyle(color: Colors.yellow, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 10),

            SizedBox(
              height: 300,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: HomeData.actionMovies.length,
                itemBuilder: (context, index) {
                  final movie = HomeData.actionMovies[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset(
                                movie["image"]!,
                                width: 120,
                                height: 160,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              top: 6,
                              left: 8,
                              child: Container(
                                padding: EdgeInsets.all(4),
                                color: Colors.black54,
                                child: Text(
                                  "⭐ ${movie["rating"]}",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 5),
                        Text(
                          movie["title"]!,
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
