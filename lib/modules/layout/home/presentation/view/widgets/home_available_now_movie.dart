import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/widgets/movie_item.dart';
import 'package:movies_app/modules/layout/home/domin/entities/movie.dart';

class HomeAvailableNowMovies extends StatelessWidget {
  const HomeAvailableNowMovies({super.key, required this.myMovies});

  final List<MovieEntity> myMovies;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: MediaQuery.sizeOf(context).height * .35,
        viewportFraction: .50,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: true,
        enlargeCenterPage: true,
        enlargeFactor: 0.20,
        scrollDirection: Axis.horizontal,
      ),
      items: myMovies.map((movie) => MovieItem(movie: movie)).toList(),
    );
  }
}
