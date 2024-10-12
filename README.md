# Flutter: aplicando BLoC com Cubit

## Implemente o gerenciador de estados BLoC com Cubit em seus projetos
<p align="center">
  <img width="460" height="300" src="/assets/to_readme/app_demo.gif">
</p>

Curso da escola Mobile que fala sobre o gerenciador de estados BLoC com Cubit para Flutter. Os temas abordados são: Padrão de projetos BLoC, BlocBuilder e BlocProvider. 

### Tópicos abordados no curso:

### State
O `State` representa o estado atual do Cubit. Cada vez que o estado é alterado, o Cubit emite o novo estado para todos os ouvintes. O estado pode ser de qualquer tipo, desde tipos primitivos como `int` e `String`, até classes mais complexas.

Exemplo de estados:
```dart
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
```

### Cubit
Um `Cubit` é uma classe que estende `Cubit<State>`, onde `State` é o tipo de estado que você deseja gerenciar. Dentro do Cubit, você define métodos que emitem novos estados em resposta a eventos ou ações do usuário.

Exemplo de um Cubit simples:
```dart
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
}
```

### emit
O método `emit` é usado dentro de um Cubit para emitir novos estados. Sempre que você deseja alterar o estado atual, você chama `emit` com o novo estado.

Exemplo de uso do `emit`:
```dart
emit(HomeLoadingState());
```

### BlocBuilder
O `BlocBuilder` é um widget que reconstrói sua interface do usuário em resposta a novos estados emitidos por um Cubit ou BLoC. Ele escuta as mudanças de estado e reconstrói a interface de acordo.

Exemplo de uso do `BlocBuilder`:
```dart
BlocBuilder<HomeCubit, HomeState>(
    builder: (context, state) {
        if (state is HomeLoadingState) {
            return CircularProgressIndicator();
        } else if (state is HomeSuccessState) {
            return ListView.builder(
                itemCount: state.movies.length,
                itemBuilder: (context, index) {
                    return ListTile(
                        title: Text(state.movies[index].title),
                    );
                },
            );
        } else if (state is HomeErrorState) {
            return Text(state.message);
        } else {
            return Container();
        }
    },
);
```

### BlocProvider
O `BlocProvider` é um widget que fornece um Cubit ou BLoC para a árvore de widgets abaixo dele. Ele é usado para criar e disponibilizar o Cubit ou BLoC para os widgets filhos.

Exemplo de uso do `BlocProvider`:
```dart
BlocProvider(
    create: (context) => HomeCubit(),
    child: MyHomePage(),
);
```







