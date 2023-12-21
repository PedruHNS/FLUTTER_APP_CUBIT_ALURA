import 'package:bilheteria_panucci/models/movie.dart';
import 'package:bilheteria_panucci/services/movies_api.dart';
import 'package:bloc/bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeService _homeService = HomeService();
  HomeCubit() : super(HomeInitialState());

  Future<void> getMovies() async {
    emit(HomeLoadingState());

    try {
      if (state is HomeLoadingState) {
        final movies = await _homeService.fetchMovies();
        emit(HomeSuccessState(movies: movies));
      }
    } on Exception catch (_) {
      emit(HomeErrorState(message: 'erro ao carregar filmes'));
    }
  }

  Future<void> getMoviesByGenre(final String genre) async {
    emit(HomeLoadingState());
    try {
      final moviesFilter = await _homeService.fetchMoviesByGenre(genre);
      emit(HomeSuccessState(movies: moviesFilter));
    } on Exception catch (_) {
      emit(HomeErrorState(message: 'nenhum filme no gênero'));
    }
  }
}
