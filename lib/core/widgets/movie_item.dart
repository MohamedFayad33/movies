import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/constant/constant/constant.dart';
import 'package:movies_app/core/routes/pages_routes_name.dart';
import 'package:movies_app/core/widgets/custom_fading.dart';
import 'package:movies_app/modules/layout/home/domin/entities/movie.dart';

class MovieItem extends StatelessWidget {
  const MovieItem({super.key, required this.movie});
  final MovieEntity movie;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(
          context,
        ).pushNamed(PagesRoutesName.details, arguments: movie.idMovie);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(16),
              child: CachedNetworkImage(
                imageUrl: movie.imageUrl ?? Constant.ifImageNull,
                placeholder: (context, url) => CustomFading(
                  child: Container(
                    height: double.infinity,
                    width: 100,
                    color: Colors.white.withValues(alpha: 0.5),
                    child: Center(child: CircularProgressIndicator()),
                  ),
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
                  "⭐ ${movie.ratingMovie}",
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
