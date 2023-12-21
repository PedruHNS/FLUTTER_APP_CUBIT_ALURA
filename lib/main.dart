import 'package:bilheteria_panucci/models/movie.dart';
import 'package:bilheteria_panucci/screens/home/cubit/home_cubit.dart';
import 'package:bilheteria_panucci/screens/movie/cubit/movie_cubit.dart';
import 'package:bilheteria_panucci/screens/movie/movie_screen.dart';
import 'package:bilheteria_panucci/themes/my_themes.dart';
import 'package:flutter/material.dart';
import 'package:bilheteria_panucci/screens/home/home.dart';

import 'package:flutter_bloc/flutter_bloc.dart';



void main() {
  runApp(const BilheteriaPanucci());
}

class BilheteriaPanucci extends StatelessWidget {
  const BilheteriaPanucci({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bilheteria Panucci',
      theme: MyThemes.getTheme("default"),
      onUnknownRoute: (settings) => MaterialPageRoute(
        builder: (context) => const Home(),
      ),
      onGenerateRoute: (settings) {
        if (settings.name == '/') {
          return MaterialPageRoute(
            builder: (_) => BlocProvider(
              create: (context) => HomeCubit(),
              child: const Home(),
            ),
          );
        }
        if (settings.name == '/movie') {
          final movie = settings.arguments as Movie;
          return MaterialPageRoute(
            builder: (_) => BlocProvider(
              create: (context) => MovieCubit(),
              child: MovieScreen(movie: movie),
            ),
          );
        }
        return null;
      },
    );
  }
}
