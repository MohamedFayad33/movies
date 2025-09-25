import 'package:flutter/material.dart';
import 'package:movies_app/core/constant/assets/assets.dart';

class BrowseView extends StatelessWidget {
  final List<String> categories = ["Action", "Adventure", "Animation", "Biography"];

  final List<Map<String, dynamic>> movies = [
    {"rating": 7.7, "image": Assets.movie1},
    {"rating": 7.7, "image": Assets.movie2},
    {"rating": 7.7, "image": Assets.movie3},
    {"rating": 7.7, "image": Assets.movie4},
    {"rating": 7.7, "image": Assets.movie5},
    {"rating": 7.7, "image": Assets.movie6}
  ];

  BrowseView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        backgroundColor: const Color(0xFF121312),
        appBar: AppBar(
          backgroundColor: const Color(0xFF121312),
          toolbarHeight: 0,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(65),
            child: TabBar(
              tabAlignment: TabAlignment.start,
              dividerColor: Colors.transparent,
              isScrollable: true,
              labelPadding: const EdgeInsets.symmetric(horizontal: 4),
              indicator: BoxDecoration(
                color: const Color(0xFFF6BD00),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: const Color(0xFFF6BD00), width: 3),
              ),
              labelColor: Colors.black,
              unselectedLabelColor: const Color(0xFFF6BD00),
              tabs: List.generate(
                categories.length,
                    (index) => Container(
                  height: 55,
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xFFF6BD00), width: 3),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      categories[index],
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: List.generate(
            categories.length,
                (index) => GridView.builder(
              padding: const EdgeInsets.all(12),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                childAspectRatio: 0.65,
              ),
              itemCount: movies.length,
              itemBuilder: (context, index) {
                return Stack(
                  children: [
                    InkWell(
                      onTap: () {},
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          movies[index]["image"],
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 10,
                      left: 8,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black54,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.all(5),
                        child: Text(
                          " ${movies[index]["rating"]} ⭐",
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
