import 'package:flutter/material.dart';
import 'package:movies_app/modules/layout/details/domin/entities/movie_details_entity.dart';

class CastGenresDetails extends StatelessWidget {
  const CastGenresDetails({super.key, required this.movie});
  final MovieDetailsEntity movie;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Cast',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),

          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(50),
            child: Text(
              'No Cast',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Text(
            'Genres',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Wrap(
              spacing: 12,
              runSpacing: 12,
              children:
                  movie.movieGenres?.map((e) {
                    return Chip(
                      backgroundColor: const Color(0xFF2C2C2C),
                      label: Text(
                        e,
                        style: const TextStyle(color: Colors.white),
                      ),
                    );
                  }).toList() ??
                  [],
            ),
          ),
          const SizedBox(height: 50),
        ],
      ),
    );
  }
}
