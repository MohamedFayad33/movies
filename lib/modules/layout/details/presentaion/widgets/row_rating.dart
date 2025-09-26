import 'package:flutter/material.dart';
import 'package:movies_app/core/constant/assets/assets.dart';
import 'package:movies_app/modules/layout/details/domin/entities/movie_details_entity.dart';

class RowRating extends StatelessWidget {
  const RowRating({super.key, required this.movie});

  final MovieDetailsEntity movie;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: Container(
            padding: EdgeInsets.all(7),
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Color(0xff282A28),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset(Assets.heartIcon),
                Text(
                  movie.movieLikeCount?.toString() ?? '0',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 24,
                  ),
                ),
              ],
            ),
          ),
        ),
        Flexible(
          child: Container(
            padding: EdgeInsets.all(7),
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Color(0xff282A28),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset(Assets.timeIcon),
                Text(
                  movie.movieRuntime?.toString() ?? '0',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 24,
                  ),
                ),
              ],
            ),
          ),
        ),
        Flexible(
          child: Container(
            padding: EdgeInsets.all(7),
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Color(0xff282A28),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset(Assets.starIcon),
                Text(
                  movie.movieRating?.toString() ?? '0',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 24,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
