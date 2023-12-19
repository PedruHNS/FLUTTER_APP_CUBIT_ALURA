part of 'home_cubit.dart';

sealed class HomeState {}

final class HomeInitialState extends HomeState {}

final class HomeLoadingState extends HomeState {}

final class HomeSuccessState extends HomeState {
  final List<Movie> movies;

  HomeSuccessState({required this.movies});
}

final class HomeErrorState extends HomeState {
  final String message;

  HomeErrorState({required this.message});
}
