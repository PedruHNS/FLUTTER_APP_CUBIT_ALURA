import 'package:bilheteria_panucci/screens/movie/cubit/movie_cubit.dart';
import 'package:bilheteria_panucci/themes/my_themes.dart';

import 'package:flutter/material.dart';
import 'package:bilheteria_panucci/screens/movie/widgets/tab_bar_movie.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widgets/poster.dart';
import 'widgets/poster_card.dart';
import '../../models/movie.dart';



class MovieScreen extends StatelessWidget {
  const MovieScreen({super.key, required this.movie});
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    context.read<MovieCubit>().changeTheme(movie.genre);
    return BlocBuilder<MovieCubit, ThemeData>(
      builder: (context, state) {
        return Theme(
          data: MyThemes.getTheme(movie.genre),
          child: Scaffold(
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      Poster(imageURL: movie.imageURI),
                      PosterCard(
                        title: movie.name,
                        genre: movie.genre,
                        classification: movie.classification,
                        duration: movie.duration,
                      ),
                    ],
                  ),
                ),
                Expanded(child: TabBarMovie(movie: movie)),
              ],
            ),
          ),
        );
      },
    );
  }
}
