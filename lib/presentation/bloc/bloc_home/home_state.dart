part of 'home_bloc.dart';

@freezed
abstract class HomeState with _$HomeState {
  factory HomeState.initState() = _InitHomeState;

  factory HomeState.content(List<Word> words) = _HomeLoaded;

  factory HomeState.loadingWord() = _LoadingWord;

  factory HomeState.error(String message) = _HomeError;

  factory HomeState.empty() = _HomeEmpty;
}
