import 'package:bilheteria_panucci/screens/home/cubit/home_cubit.dart';

import 'package:flutter/material.dart';

import 'package:bilheteria_panucci/screens/home/widgets/genre_filter.dart';
import 'package:bilheteria_panucci/components/movie_card.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    context.read<HomeCubit>().getMovies();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomScrollView(
            slivers: <Widget>[
              SliverToBoxAdapter(
                child: Text(
                  "Filmes",
                  style: Theme.of(context).textTheme.displayLarge,
                ),
              ),
              const GenreFilter(),
              BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  if (state is HomeLoadingState) {
                    return const SliverFillRemaining(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                  if (state is HomeSuccessState) {
                    if (state.movies.isEmpty) {
                      return const SliverFillRemaining(
                        child: Center(
                          child:
                              Text('não exite filme deste gênero no momento'),
                        ),
                      );
                    }
                    return SliverGrid.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 16,
                        mainAxisExtent: 320, //240
                      ),
                      itemBuilder: (context, index) {
                        return InkWell(
                            onTap: () {
                              Navigator.of(context).pushNamed('/movie',
                                  arguments: state.movies[index]);
                            },
                            child: MovieCard(movie: state.movies[index]));
                      },
                      itemCount: state.movies.length,
                    );
                  }

                  return const SliverFillRemaining(
                      child: Center(child: Text('filmes não encontrado')));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
