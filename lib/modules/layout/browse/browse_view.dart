import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/widgets/movie_item.dart';
import 'package:movies_app/modules/layout/home/domin/entities/movie.dart';
import 'package:movies_app/modules/layout/home/presentation/manger/bloc/available_now_bloc.dart';

class BrowseView extends StatefulWidget {
  const BrowseView({super.key});

  @override
  State<BrowseView> createState() => _BrowseViewState();
}

class _BrowseViewState extends State<BrowseView> {
  final List<String> categories = [
    "Action",
    "Adventure",
    "Animation",
    "Biography",
    'Drama',
    'Crime',
    'Thriller',
    'Sci-Fi',
    'Documentary',
    'Biography',
    'Musical',
  ];

  // final List<Map<String, dynamic>> movies = [
  //   {"rating": 7.7, "image": Assets.film1},
  //   {"rating": 7.7, "image": Assets.film2},
  //   {"rating": 7.7, "image": Assets.film3},
  //   {"rating": 7.7, "image": Assets.film1},
  //   {"rating": 7.7, "image": Assets.film2},
  //   {"rating": 7.7, "image": Assets.film3},
  // ];

  @override
  Widget build(BuildContext context) {
    List<MovieEntity> movies = context.read<AvailableNowBloc>().myMovies;
    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        backgroundColor: const Color(0xFF121312),
        appBar: AppBar(
          backgroundColor: const Color(0xFF121312),
          toolbarHeight: 0,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(64),
            child: CustomTabBAr(categories: categories),
          ),
        ),
        body: TabBarView(
          children: List.generate(categories.length, (index) {
            List<MovieEntity> movieFiltter = [];
            for (var movie in movies) {
              for (var n in movie.genresMovie ?? []) {
                if (n == categories[index]) {
                  movieFiltter.add(movie);
                }
              }
            }

            return GridView.builder(
              padding: const EdgeInsets.all(12),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                childAspectRatio: 0.65,
              ),
              itemCount: movieFiltter.length,
              itemBuilder: (context, index) {
                return MovieItem(movie: movieFiltter[index]);
              },
            );
          }),
        ),
      ),
    );
  }
}

class CustomTabBAr extends StatelessWidget {
  const CustomTabBAr({super.key, required this.categories});

  final List<String> categories;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      tabAlignment: TabAlignment.start,
      dividerColor: Colors.transparent,
      isScrollable: true,
      labelPadding: const EdgeInsets.symmetric(horizontal: 4),
      indicator: BoxDecoration(
        color: const Color(0xFFF6BD00),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFF6BD00), width: 3),
      ),
      labelColor: Colors.black,
      unselectedLabelColor: const Color(0xFFF6BD00),
      tabs: List.generate(
        categories.length,
        (index) => Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFFF6BD00), width: 3),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Text(
              categories[index],
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
          ),
        ),
      ),
    );
  }
}
