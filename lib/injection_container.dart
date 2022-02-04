

import 'package:get_it/get_it.dart';
import 'package:words_3000_puzzle/data/datasources/local/settings_database_impl.dart';
import 'package:words_3000_puzzle/domain/datasources/local/settings_database.dart';
import 'package:words_3000_puzzle/domain/repositories/category_repository.dart';
import 'package:words_3000_puzzle/presentation/bloc/bloc_words/words_bloc.dart';

import 'common/constants.dart';
import 'data/datasources/local/category_database_impl.dart';
import 'data/datasources/local/history_database_impl.dart';
import 'data/repositories/category_repository_impl.dart';
import 'data/repositories/word_repository_impl.dart';
import 'domain/datasources/local/category_database.dart';
import 'domain/datasources/local/history_database.dart';
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
  sl.registerLazySingleton<CategoryRepository>(
        () => CategoryRepositoryImpl(
      categoryDatabase: sl(),
    ),
  );
  sl.registerLazySingleton<WordRepository>(
    () => WordRepositoryImpl(
      categoryDatabase: sl(),
      settingsDatabase: sl(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<CategoryDatabase>(
    () => CategoryDatabaseImpl(),
  );
  sl.registerLazySingleton<HistoryDatabase>(
        () => HistoryDatabaseImpl(),
  );
  sl.registerLazySingleton<SettingsDatabase>(
        () => SettingsDatabaseImpl(),
  );


}
