import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/modules/layout/details/domin/entities/movie_details_entity.dart';

class DetailsMovieShow extends StatelessWidget {
  const DetailsMovieShow({super.key, required this.movie});
  final MovieDetailsEntity movie;
  final String ifImageNull =
      'https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg';
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return SafeArea(
      child: Column(
        children: [
          Stack(
            children: [
              CachedNetworkImage(
                height: height * .8,
                width: width,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    CircularProgressIndicator(value: downloadProgress.progress),
                errorWidget: (context, url, error) => Icon(Icons.error),
                fit: BoxFit.cover,
                imageUrl: movie.movieImage ?? ifImageNull,
              ),
              Opacity(
                opacity: .5,
                child: Container(
                  height: height * .8,
                  width: width,
                  decoration: BoxDecoration(
                    gradient: RadialGradient(
                      colors: [
                        Color(0xff121312).withValues(alpha: .2),
                        Color(0xff121312),
                      ],
                    ),
                  ),
                ),
              ),
              CustomAppBar(),
              Positioned.fill(
                bottom: -650,
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
        ],
      ),
    );
  }
}

//  app bar
class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: (Navigator.of(context).pop),
            icon: Icon(Icons.arrow_back_ios, color: Colors.white, size: 40),
          ),
          IconButton(
            onPressed: (Navigator.of(context).pop),
            icon: Icon(Icons.bookmark, color: Colors.white, size: 40),
          ),
        ],
      ),
    );
  }
}
