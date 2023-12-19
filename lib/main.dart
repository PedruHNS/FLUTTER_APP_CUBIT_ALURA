

import 'package:bilheteria_panucci/logic/cubit/theme_movie/movie_cubit.dart';
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
    return BlocProvider(
      create: (context) => MovieCubit(),
      child: BlocBuilder<MovieCubit, ThemeData>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Bilheteria Panucci',
            theme: state,
            home: const Home(),
          );
        },
      ),
    );
  }
}
