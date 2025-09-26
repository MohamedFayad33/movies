import 'package:flutter/material.dart';
import 'package:movies_app/core/widgets/custom_fading.dart';
import 'package:movies_app/core/widgets/movie_item.dart';
import 'package:movies_app/modules/layout/home/domin/entities/movie.dart';

class CustomActionMovies extends StatelessWidget {
  const CustomActionMovies({super.key, required this.myMovies});

  final List<MovieEntity> myMovies;

  @override
  Widget build(BuildContext context) {
    final List<MovieEntity> myMoviesAction = myMovies.reversed.toList();
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: myMoviesAction.length,
      itemBuilder: (context, index) {
        if (myMovies.isEmpty) {
          return CustomFading(
            child: Container(
              color: Colors.grey,

              padding: EdgeInsets.symmetric(horizontal: 200, vertical: 200),
            ),
          );
        }
        return MovieItem(movie: myMoviesAction[index]);
      },
    );
  }
}
