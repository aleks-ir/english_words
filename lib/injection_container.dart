import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:words_3000_puzzle/data/datasources/local/data_assets_impl.dart';
import 'package:words_3000_puzzle/domain/repositories/category_repository.dart';
import 'package:words_3000_puzzle/domain/usecases/settings/update_settings.dart';
import 'package:words_3000_puzzle/local_data.dart';
import 'package:words_3000_puzzle/presentation/bloc/bloc_categories/categories_bloc.dart';
import 'package:words_3000_puzzle/presentation/bloc/bloc_words/words_bloc.dart';

import 'common/constants/box_names.dart';
import 'data/datasources/local/database_impl.dart';
import 'data/datasources/remote/image_api_impl.dart';
import 'data/datasources/remote/word_api_impl.dart';
import 'data/repositories/category_repository_impl.dart';
import 'data/repositories/settings_repository_impl.dart';
import 'data/repositories/word_repository_impl.dart';
import 'domain/datasources/local/data_assets.dart';
import 'domain/datasources/remote/image_api.dart';
import 'domain/datasources/remote/word_api.dart';
import 'domain/repositories/settings_repository.dart';
import 'domain/repositories/word_repository.dart';
import 'domain/usecases/categories/create_and_fill_in_category_usecase.dart';
import 'domain/usecases/categories/create_category_usecase.dart';
import 'domain/usecases/categories/delete_category_usecase.dart';
import 'domain/usecases/categories/fetch_all_categories_usecase.dart';
import 'domain/usecases/categories/fetch_category_usecase.dart';
import 'domain/usecases/categories/update_category_usecase.dart';
import 'domain/usecases/history/create_update_history_usecase.dart';
import 'domain/usecases/history/fetch_all_histories_usecase.dart';
import 'domain/usecases/history/fetch_history_usecase.dart';
import 'domain/usecases/settings/fetch_settings.dart';
import 'domain/usecases/words/create_word_usecase.dart';
import 'domain/usecases/words/delete_word_usecase.dart';
import 'domain/usecases/words/fetch_all_words_by_date_usecase.dart';
import 'domain/usecases/words/fetch_all_words_usecase.dart';
import 'domain/usecases/words/fetch_study_word_usecase.dart';
import 'domain/usecases/words/fetch_word_usecase.dart';
import 'domain/usecases/words/update_word_usecase.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerLazySingleton<LocalData>(
    () => LocalData(
      createCategoryUsecase: sl(),
    ),
  );

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
        addWordUsecase: sl(),
        fetchAllWordsUsecase: sl(),
        wordApiImpl: sl(),
        imageApiImpl: sl()),
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
  sl.registerLazySingleton(() => FetchAllWordsByDateUsecase(sl()));
  sl.registerLazySingleton(() => FetchAllWordsUsecase(sl()));
  sl.registerLazySingleton(() => FetchStudyWordUsecase(sl()));
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
