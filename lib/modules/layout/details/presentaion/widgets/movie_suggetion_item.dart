import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/constant/constant/constant.dart';
import 'package:movies_app/core/routes/pages_routes_name.dart';
import 'package:movies_app/modules/layout/details/domin/entities/movie_suggestions_entity.dart';

class MovieSuggetionItem extends StatelessWidget {
  const MovieSuggetionItem({super.key, required this.movie});
  final MovieSuggestionsEntity movie;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(
          context,
        ).pushNamed(PagesRoutesName.details, arguments: movie.movieId);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(16),
              child: CachedNetworkImage(
                imageUrl: movie.movieImage ?? Constant.ifImageNull,
                fit: BoxFit.cover,
                placeholder: (context, url) => Container(
                  height: double.infinity,
                  color: Colors.white.withValues(alpha: 0.5),
                  child: Center(child: CircularProgressIndicator()),
                ),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            Positioned(
              top: 10,
              left: 10,
              child: Container(
                padding: EdgeInsets.all(6),
                color: Colors.black54,
                child: Text(
                  "⭐ ${movie.movieRating}",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
