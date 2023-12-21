import 'package:bilheteria_panucci/themes/my_themes.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'movie_state.dart';

class MovieCubit extends Cubit<ThemeData> {
  MovieCubit() : super(MyThemes.getTheme("default"));

  void changeTheme(String genre) {
    emit(state == MyThemes.getTheme("default")
        ? MyThemes.getTheme(genre)
        : MyThemes.getTheme("default"));
  }
}

// class MovieThemeCubit extends Cubit<MovieThemeState> {
//   MovieThemeCubit()
//       : super(MovieThemeInitial(theme: MyThemes.getTheme("default")));

//   void changeTheme(String genre) {
//     if (state == MovieThemeInitial(theme: MyThemes.getTheme("default"))) {
//       emit(MovieThemeOther(theme: MyThemes.getTheme(genre)));
//       return;
//     }
//     emit(MovieThemeInitial(theme: MyThemes.getTheme("default")));
//   }
// }
