import 'package:flutter/material.dart';
import 'package:movies_app/modules/layout/widgets/cast_genres_details.dart';
import 'package:movies_app/modules/layout/widgets/details_movie_show.dart';
import 'package:movies_app/modules/layout/widgets/screens_similar_summary_details.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            DetailsMovieShow(),
            SizedBox(height: 16),
            ScreensSimilarSummaryDetails(),
            SizedBox(height: 16),
            CastGenresDetails()

          ],
        ),
      ),
    );
  }
}
