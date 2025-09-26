import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/modules/layout/details/domin/entities/movie_suggestions_entity.dart';
import 'package:movies_app/modules/layout/details/presentaion/manger/movie_suggetiion_bloc/movie_suggestions_bloc.dart';
import 'package:movies_app/modules/layout/details/presentaion/widgets/movie_suggetion_item.dart';

class ScreensSimilarSummaryDetails extends StatelessWidget {
  const ScreensSimilarSummaryDetails({super.key, required this.movies});
  final List<MovieSuggestionsEntity> movies;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    return BlocBuilder<MovieSuggestionsBloc, MovieSuggestionsState>(
      builder: (context, state) {
        List<MovieSuggestionsEntity> mySuggestionsMovies =
            state is MovieSuggestionsSuccess ? state.myMovie : [];
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Similar ',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
            ConstrainedBox(
              constraints: BoxConstraints(maxHeight: height * .7),

              child: GridView.builder(
                padding: EdgeInsets.all(0),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 3 / 4,
                ),
                physics: NeverScrollableScrollPhysics(),
                itemCount: mySuggestionsMovies.length,
                itemBuilder: (context, index) {
                  return MovieSuggetionItem(movie: mySuggestionsMovies[index]);
                },
              ),
            ),
            Text(
              'Summary',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 7),
            Text(
              'Following the events of Spider-Man No Way Home, Doctor Strange unwittingly casts a forbidden spell that accidentally opens up the multiverse. With help from Wong and Scarlet Witch, Strange confronts various versions of himself as well as teaming up with the young America Chavez while traveling through various realities and working to restore reality as he knows it. Along the way, Strange and his allies realize they must take on a powerful new adversary who seeks to take over the multiverse.—Blazer346',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 20),
          ],
        );
      },
    );
  }
}
