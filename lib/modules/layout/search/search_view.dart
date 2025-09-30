import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/constant/assets/assets.dart';
import 'package:movies_app/core/theme/color_pallete.dart';
import 'package:movies_app/core/widgets/movie_item.dart';
import 'package:movies_app/modules/layout/home/domin/entities/movie.dart';
import 'package:movies_app/modules/layout/home/presentation/manger/bloc/available_now_bloc.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  late List<MovieEntity> myMovies;
  List<MovieEntity> fillterMovies = [];

  @override
  Widget build(BuildContext context) {
    myMovies = context.read<AvailableNowBloc>().myMovies;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              TextFormField(
                onChanged: (value) {
                  if (fillterMovies.isNotEmpty) {
                    fillterMovies.clear();
                  }
                  for (int i = 0; i < myMovies.length; i++) {
                    if (myMovies[i].titleMovie != null &&
                        myMovies[i].titleMovie!.contains(value)) {
                      fillterMovies.add(myMovies[i]);
                    }
                  }
                  if (value.isEmpty) {
                    fillterMovies.clear();
                  }
                  setState(() {});
                },
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  prefixIcon: Image.asset(Assets.searchIcon),
                  fillColor: ColorPallete.textFormFieldBackGround,
                  filled: true,
                  hintText: 'Search',
                  hintStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: ColorPallete.textFormFieldBackGround,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.all(12),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    childAspectRatio: 0.65,
                  ),
                  itemCount: fillterMovies.length,
                  itemBuilder: (context, index) {
                    return MovieItem(movie: fillterMovies[index]);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
