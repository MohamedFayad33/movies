import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/constant/assets/assets.dart';
import 'package:movies_app/modules/layout/home/domin/entities/movie.dart';
import 'package:movies_app/modules/layout/home/presentation/manger/bloc/available_now_bloc.dart';
import 'package:movies_app/modules/layout/home/presentation/view/widgets/custom_action_movies.dart';
import 'package:movies_app/modules/layout/home/presentation/view/widgets/home_available_now_movie.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AvailableNowBloc, AvailableNowState>(
      builder: (context, state) {
        final List<MovieEntity> myMovies = (state is AvailableNowSuccess)
            ? state.myMovies.reversed.toList()
            : [];
        return Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(Assets.homeBackground),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              const SizedBox(height: 30),
              Image.asset(Assets.availableNowText),
              HomeAvailableNowMovies(myMovies: myMovies),
              Image.asset(Assets.watchNowText),
              ActionMovieRowSeeMore(),
              SizedBox(height: 10),
              Expanded(child: CustomActionMovies(myMovies: myMovies)),
            ],
          ),
        );
      },
    );
  }
}

class ActionMovieRowSeeMore extends StatelessWidget {
  const ActionMovieRowSeeMore({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Action", style: TextStyle(color: Colors.white, fontSize: 20)),
          TextButton(
            onPressed: () {},
            child: Text(
              "See More >",
              style: TextStyle(color: Colors.yellow, fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
