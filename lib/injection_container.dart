

import 'package:get_it/get_it.dart';
import 'package:words_3000_puzzle/presentation/bloc/bloc_words/words_bloc.dart';

import 'data/datasources/database_local_impl.dart';
import 'data/repositories/word_repository.dart';
import 'domain/datasources/database_local.dart';
import 'domain/repositories/word_repository.dart';
import 'domain/usecases/words/add_word_usecase.dart';
import 'domain/usecases/words/fetch_all_words_usecase.dart';

final sl = GetIt.instance;

Future<void> init() async {

  // Bloc
  sl.registerFactory(
    () => WordsBloc(
      addWordUsecase: sl(),
      fetchAllWordsUsecase: sl(),
    ),
  );

  // Use cases
  sl.registerLazySingleton(() => AddWordUsecase(sl()));
  sl.registerLazySingleton(() => FetchAllWordsUsecase(sl()));

  // Repository
  sl.registerLazySingleton<WordRepository>(
    () => WordRepositoryImpl(
      database: sl(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<DatabaseLocal>(
    () => DatabaseLocalImpl(),
  );


}
