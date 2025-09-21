import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/api_service/api_endpoint.dart';
import 'package:movies_app/modules/layout/details/presentaion/manger/movie_details_bloc.dart';
import 'package:movies_app/modules/layout/details/presentaion/manger/movie_details_event.dart';
import 'package:movies_app/modules/layout/details/presentaion/manger/movie_details_state.dart';
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
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: SingleChildScrollView(
        child: BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
          builder: (context, state) {
            return Column(
              children: [
                if (state is MovieDetailsSuccess)
                  DetailsMovieShow(movie: state.myMovie),

                ScreensSimilarSummaryDetails(),
                CastGenresDetails(),
              ],
            );
          },
        ),
      ),
    );
  }
}
