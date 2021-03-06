import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:word_study_puzzle/data/repositories/history_repository_impl.dart';
import 'package:word_study_puzzle/domain/repositories/history_repository.dart';
import 'package:word_study_puzzle/presentation/bloc/bloc_categories/categories_bloc.dart';
import 'package:word_study_puzzle/presentation/bloc/bloc_home/home_bloc.dart';
import 'package:word_study_puzzle/presentation/bloc/bloc_settings/settings_bloc.dart';
import 'package:word_study_puzzle/presentation/bloc/bloc_stats/stats_bloc.dart';
import 'package:word_study_puzzle/presentation/bloc/bloc_word_details/word_details_bloc.dart';
import 'package:word_study_puzzle/presentation/bloc/bloc_words/words_bloc.dart';
import 'package:word_study_puzzle/presentation/utils/theme_switcher.dart';

import 'app_init.dart';
import 'app_widget.dart';
import 'common/constants/box_names.dart';
import 'data/datasources/local/local.dart';
import 'data/datasources/remote/remote.dart';
import 'data/repositories/category_repository_impl.dart';
import 'data/repositories/settings_repository_impl.dart';
import 'data/repositories/word_repository_impl.dart';
import 'domain/datasources/local/local.dart';
import 'domain/datasources/remote/remote.dart';
import 'domain/repositories/category_repository.dart';
import 'domain/repositories/settings_repository.dart';
import 'domain/repositories/word_repository.dart';
import 'domain/usecases/categories/categories.dart';
import 'domain/usecases/history/history.dart';
import 'domain/usecases/settings/settings.dart';
import 'domain/usecases/words/words.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory<AppInit>(
    () => AppInit(
      createCategoryUsecase: sl(),
      createUpdateHistoryUsecase: sl(),
      fetchAllHistoriesUsecase: sl(),
      theme: sl(),
    ),
  );

  sl.registerFactory<AppWidget>(
    () => AppWidget(
      theme: sl(),
    ),
  );

  sl.registerLazySingleton(() => ThemeSwitcher());

  // Bloc
  sl.registerFactory(() => CategoriesBloc(
      createCategoryUsecase: sl(),
      fetchAllCategoriesUsecase: sl(),
      fetchCategoryUsecase: sl(),
      deleteCategoryUsecase: sl(),
      updateCategoryUsecase: sl(),
      fetchSettingsUsecase: sl(),
      updateSettingsUsecase: sl()));

  sl.registerFactory(
    () => WordsBloc(
        fetchSettingsUsecase: sl(),
        fetchCategoryUsecase: sl(),
        createWordUsecase: sl(),
        deleteWordUsecase: sl(),
        fetchAllWordsUsecase: sl(),
        updateWordUsecase: sl()),
  );

  sl.registerFactory(
    () => WordDetailsBloc(fetchWordUsecase: sl()),
  );

  sl.registerLazySingleton(
    () => HomeBloc(
        fetchUnexploredWordUsecase: sl(),
        fetchAllHistoriesUsecase: sl(),
        fetchHistoryUsecase: sl(),
        fetchSettingsUsecase: sl(),
        updateSettingsUsecase: sl(),
        createUpdateHistoryUsecase: sl(),
        updateWordUsecase: sl()),
  );

  sl.registerFactory(
    () => SettingsBloc(
      fetchSettingsUsecase: sl(),
      updateSettingsUsecase: sl(),
      theme: sl(),
    ),
  );

  sl.registerFactory(
    () => StatsBloc(
      fetchAllHistoriesUsecase: sl(),
      fetchHistoryUsecase: sl(),
    ),
  );

  // Use cases
  sl.registerLazySingleton(() => CreateAndFillInCategoryUsecase(sl()));
  sl.registerLazySingleton(() => CreateCategoryUsecase(sl()));
  sl.registerLazySingleton(() => FetchAllCategoriesUsecase(sl()));
  sl.registerLazySingleton(() => FetchCategoryUsecase(sl()));
  sl.registerLazySingleton(() => DeleteCategoryUsecase(sl()));
  sl.registerLazySingleton(() => UpdateCategoryUsecase(sl()));

  sl.registerLazySingleton(() => CreateUpdateHistoryUsecase(sl()));
  sl.registerLazySingleton(() => FetchAllHistoriesUsecase(sl()));
  sl.registerLazySingleton(() => FetchHistoryUsecase(sl()));

  sl.registerLazySingleton(() => FetchSettingsUsecase(sl()));
  sl.registerLazySingleton(() => UpdateSettingsUsecase(sl()));

  sl.registerLazySingleton(() => CreateWordUsecase(sl()));
  sl.registerLazySingleton(() => DeleteWordUsecase(sl()));
  sl.registerLazySingleton(() => FetchAllWordsUsecase(sl()));
  sl.registerLazySingleton(() => FetchUnexploredWordUsecase(sl()));
  sl.registerLazySingleton(() => FetchWordUsecase(sl()));
  sl.registerLazySingleton(() => UpdateWordUsecase(sl()));

  // Repository
  sl.registerLazySingleton<CategoryRepository>(
    () => CategoryRepositoryImpl(
      categoryDatabase: DatabaseImpl(box: Hive.box(BoxNames.categories)),
      dataAssets: sl(),
    ),
  );
  sl.registerLazySingleton<WordRepository>(
    () => WordRepositoryImpl(
      categoryDatabase: DatabaseImpl(box: Hive.box(BoxNames.categories)),
      settingsDatabase: DatabaseImpl(box: Hive.box(BoxNames.settings)),
      imageApi: sl(),
      wordApi: sl(),
    ),
  );
  sl.registerLazySingleton<SettingsRepository>(
    () => SettingsRepositoryImpl(
        settingsDatabase: DatabaseImpl(box: Hive.box(BoxNames.settings))),
  );
  sl.registerLazySingleton<HistoryRepository>(
    () => HistoryRepositoryImpl(
      historyDatabase: DatabaseImpl(box: Hive.box(BoxNames.history)),
    ),
  );

  // Data sources
  sl.registerLazySingleton<DataAssets>(
    () => DataAssetsImpl(),
  );
  sl.registerLazySingleton<WordApi>(
    () => WordApiImpl(client: http.Client()),
  );
  sl.registerLazySingleton<ImageApi>(
    () => ImageApiImpl(client: http.Client()),
  );
}
