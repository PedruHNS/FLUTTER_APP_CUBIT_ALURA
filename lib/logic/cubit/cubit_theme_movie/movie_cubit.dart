import 'package:bilheteria_panucci/themes/my_themes.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'movie_state.dart';

class MovieCubit extends Cubit<ThemeData> {
  MovieCubit() : super(MyThemes.getTheme("default"));

  void changeTheme(String genre) {
    emit(MyThemes.getTheme(genre));
  }
}
