part of 'movie_cubit.dart';

sealed class MovieThemeState {}

final class MovieThemeInitial extends MovieThemeState {
  final ThemeData theme;

  MovieThemeInitial({required this.theme});
}

final class MovieThemeOther extends MovieThemeState {
  final ThemeData theme;

  MovieThemeOther({required this.theme});
}
