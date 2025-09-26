import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/api_service/api_endpoint.dart';
import 'package:movies_app/modules/layout/details/presentaion/manger/movie_details_bloc.dart';
import 'package:movies_app/modules/layout/details/presentaion/manger/movie_details_event.dart';
import 'package:movies_app/modules/layout/details/presentaion/manger/movie_details_state.dart';
import 'package:movies_app/modules/layout/details/presentaion/manger/movie_suggetiion_bloc/movie_suggestions_bloc.dart';
import 'package:movies_app/modules/layout/details/presentaion/widgets/cast_genres_details.dart';
import 'package:movies_app/modules/layout/details/presentaion/widgets/details_movie_show.dart';
import 'package:movies_app/modules/layout/details/presentaion/widgets/screens_similar_summary_details.dart';

class DetailsView extends StatefulWidget {
  const DetailsView({super.key});

  @override
  State<DetailsView> createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final data = ModalRoute.of(context)!.settings.arguments as num;
      context.read<MovieDetailsBloc>().add(
        FetchMovieDetailsEvent(
          endPont: ApiEndpoint.movieDetails,
          movieId: data.toString(),
        ),
      );
      context.read<MovieSuggestionsBloc>().add(
        FetchMovieSuggestionsEvent(
          endPont: ApiEndpoint.movieSuggestions,
          movieId: data.toString(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: SingleChildScrollView(
        child: BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
          builder: (context, state) {
            if (state is MovieDetailsSuccess) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DetailsMovieShow(movie: state.myMovie),
                    ScreensSimilarSummaryDetails(movies: []),
                    CastGenresDetails(movie: state.myMovie),
                  ],
                ),
              );
            }
            return Column();
          },
        ),
      ),
    );
  }
}
