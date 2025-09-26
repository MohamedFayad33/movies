import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/constant/assets/assets.dart';
import 'package:movies_app/core/constant/constant/constant.dart';
import 'package:movies_app/core/widgets/custom_button.dart';
import 'package:movies_app/core/widgets/custom_fading.dart';
import 'package:movies_app/modules/layout/details/domin/entities/movie_details_entity.dart';
import 'package:movies_app/modules/layout/details/presentaion/widgets/custom_app_bar.dart';
import 'package:movies_app/modules/layout/details/presentaion/widgets/row_rating.dart';

class DetailsMovieShow extends StatelessWidget {
  const DetailsMovieShow({super.key, required this.movie});
  final MovieDetailsEntity movie;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              CachedNetworkImage(
                height: height * .7,
                width: width,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    CustomFading(child: Container(color: Colors.grey)),
                errorWidget: (context, url, error) => Icon(Icons.error),
                fit: BoxFit.cover,
                imageUrl: movie.movieImage ?? Constant.ifImageNull,
              ),
              Container(
                height: height * .7,
                width: width,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xff121312).withValues(alpha: .1),
                      Color(0xff121312).withValues(alpha: 1.1),
                    ],
                  ),
                ),
                child: Image.asset(Assets.playVideoIcon),
              ),
              CustomAppBar(),
              Positioned.fill(
                bottom: -550,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        movie.movieTitle ?? 'No Name',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        ' ${movie.movieYear ?? "No Year"} ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: CustomButton(
              onPressed: () {},
              color: Color(0xffE82626),
              child: Text(
                'Watch',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                ),
              ),
            ),
          ),
          RowRating(movie: movie),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Text(
              'Screen Shots',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          DetailsMovieScreenShoot(movie: movie),
        ],
      ),
    );
  }
}

class DetailsMovieScreenShoot extends StatelessWidget {
  const DetailsMovieScreenShoot({super.key, required this.movie});
  final MovieDetailsEntity movie;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: MediaQuery.sizeOf(context).height * .2,
          width: double.infinity,
          child: ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(12),
            child: Image.network(
              movie.background ?? Constant.ifImageNull,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}
