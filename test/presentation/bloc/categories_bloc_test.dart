import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:word_study_puzzle/common/constants/default.dart';
import 'package:word_study_puzzle/domain/models/category.dart';
import 'package:word_study_puzzle/domain/models/error.dart';
import 'package:word_study_puzzle/domain/models/settings.dart';
import 'package:word_study_puzzle/domain/models/success.dart';
import 'package:word_study_puzzle/domain/usecases/categories/create_category_usecase.dart';
import 'package:word_study_puzzle/domain/usecases/categories/delete_category_usecase.dart';
import 'package:word_study_puzzle/domain/usecases/categories/fetch_all_categories_usecase.dart';
import 'package:word_study_puzzle/domain/usecases/categories/fetch_category_usecase.dart';
import 'package:word_study_puzzle/domain/usecases/categories/update_category_usecase.dart';
import 'package:word_study_puzzle/domain/usecases/settings/fetch_settings.dart';
import 'package:word_study_puzzle/domain/usecases/settings/update_settings.dart';
import 'package:word_study_puzzle/presentation/bloc/bloc_categories/categories_bloc.dart';

import 'categories_bloc_test.mocks.dart';

@GenerateMocks([
  CreateCategoryUsecase,
  FetchAllCategoriesUsecase,
  FetchCategoryUsecase,
  DeleteCategoryUsecase,
  UpdateCategoryUsecase,
  FetchSettingsUsecase,
  UpdateSettingsUsecase,
])
void main() {
  late CategoriesBloc categoriesBloc;
  late MockCreateCategoryUsecase mockCreateCategoryUsecase;
  late MockFetchAllCategoriesUsecase mockFetchAllCategoriesUsecase;
  late MockFetchCategoryUsecase mockFetchCategoryUsecase;
  late MockDeleteCategoryUsecase mockDeleteCategoryUsecase;
  late MockUpdateCategoryUsecase mockUpdateCategoryUsecase;
  late MockFetchSettingsUsecase mockFetchSettingsUsecase;
  late MockUpdateSettingsUsecase mockUpdateSettingsUsecase;

  setUp(() {
    mockCreateCategoryUsecase = MockCreateCategoryUsecase();
    mockFetchAllCategoriesUsecase = MockFetchAllCategoriesUsecase();
    mockFetchCategoryUsecase = MockFetchCategoryUsecase();
    mockDeleteCategoryUsecase = MockDeleteCategoryUsecase();
    mockUpdateCategoryUsecase = MockUpdateCategoryUsecase();
    mockFetchSettingsUsecase = MockFetchSettingsUsecase();
    mockUpdateSettingsUsecase = MockUpdateSettingsUsecase();

    categoriesBloc = CategoriesBloc(
        createCategoryUsecase: mockCreateCategoryUsecase,
        fetchAllCategoriesUsecase: mockFetchAllCategoriesUsecase,
        fetchCategoryUsecase: mockFetchCategoryUsecase,
        deleteCategoryUsecase: mockDeleteCategoryUsecase,
        updateCategoryUsecase: mockUpdateCategoryUsecase,
        fetchSettingsUsecase: mockFetchSettingsUsecase,
        updateSettingsUsecase: mockUpdateSettingsUsecase);
  });

  blocTest(
    'emits [] when nothing is added',
    build: () => categoriesBloc,
    expect: () => [],
  );

  group('ChangeIsShop', () {
    blocTest(
        'should emits [CategoriesState.initState()] when isShop is changed',
        build: () => categoriesBloc,
        act: (CategoriesBloc bloc) => bloc.add(ChangeIsShop(true)),
        expect: () => [CategoriesState.initState()]);
    blocTest('should emits [] when isShop is not changed',
        build: () => categoriesBloc,
        act: (CategoriesBloc bloc) => bloc.add(ChangeIsShop(false)),
        expect: () => []);
  });

  group('FetchSettings', () {
    test(
      'should call mockFetchSettingsUsecase()',
      () async {
        when(mockFetchSettingsUsecase())
            .thenAnswer((_) async => Right(defaultSettings));
        categoriesBloc.add(FetchSettings());
        await untilCalled(mockFetchSettingsUsecase());
        verify(mockFetchSettingsUsecase());
      },
    );
    blocTest('should emits [] when successful',
        build: () => categoriesBloc,
        act: (CategoriesBloc bloc) {
          when(mockFetchSettingsUsecase())
              .thenAnswer((_) async => Right(defaultSettings));
          bloc.add(FetchSettings());
        },
        expect: () => []);
  });

  group('ChangeSelectedCategory', () {
    Settings tSettings = defaultSettings;
    void setUpSettings() {
      when(mockFetchSettingsUsecase())
          .thenAnswer((_) async => Right(defaultSettings));
      categoriesBloc.add(FetchSettings());
    }

    test(
      'should call mockUpdateSettingsUsecase()',
      () async {
        setUpSettings();
        when(mockUpdateSettingsUsecase(tSettings))
            .thenAnswer((_) async => Right(Success(message: 'success')));
        categoriesBloc.add(ChangeSelectedCategory('title', 0));
        await untilCalled(mockUpdateSettingsUsecase(defaultSettings));
        verify(mockUpdateSettingsUsecase(tSettings));
      },
    );
    blocTest('should emits [] when successful',
        build: () => categoriesBloc,
        act: (CategoriesBloc bloc) {
          setUpSettings();
          when(mockUpdateSettingsUsecase(tSettings))
              .thenAnswer((_) async => Right(Success(message: 'success')));
          bloc.add(ChangeSelectedCategory('title', 0));
        },
        expect: () => []);
    blocTest('should emits [CategoriesState.error] when failure',
        build: () => categoriesBloc,
        act: (CategoriesBloc bloc) {
          setUpSettings();
          when(mockUpdateSettingsUsecase(tSettings))
              .thenAnswer((_) async => Left(Error(message: 'error')));
          bloc.add(ChangeSelectedCategory('title', 0));
        },
        expect: () => [CategoriesState.error("error")]);
  });

  group('OpenCategory', () {
    Settings tSettings = defaultSettings;

    void setUpSettings() {
      when(mockFetchSettingsUsecase())
          .thenAnswer((_) async => Right(defaultSettings));
      categoriesBloc.add(FetchSettings());
    }

    void setUpFetchCategorySuccess() =>
        when(mockFetchCategoryUsecase('title')).thenAnswer(
            (_) async => Right(Category(title: 'title', openingCost: 1)));
    void setUpFetchCategoryWithMaxCost() =>
        when(mockFetchCategoryUsecase('title')).thenAnswer(
            (_) async => Right(Category(title: 'title', openingCost: 999)));
    void setUpUpdateSettingsSuccess() =>
        when(mockUpdateSettingsUsecase(tSettings))
            .thenAnswer((_) async => Right(Success(message: 'success')));
    void setUpUpdateCategorySuccess() =>
        when(mockUpdateCategoryUsecase(Category(title: 'title')))
            .thenAnswer((_) async => Right(Success(message: 'success')));
    void setUpUpdateSettingsFailure() =>
        when(mockUpdateSettingsUsecase(tSettings))
            .thenAnswer((_) async => Left(Error(message: 'error')));
    void setUpUpdateCategoryFailure() =>
        when(mockUpdateCategoryUsecase(Category(title: 'title')))
            .thenAnswer((_) async => Left(Error(message: 'error')));

    test(
      'should call mockFetchCategoryUsecase, mockUpdateSettingsUsecase and mockUpdateCategoryUsecase',
      () async {
        setUpSettings();
        setUpFetchCategorySuccess();
        setUpUpdateSettingsSuccess();
        setUpUpdateCategorySuccess();
        categoriesBloc.add(OpenCategory('title'));
        await untilCalled(mockFetchCategoryUsecase('title'));
        await untilCalled(mockUpdateSettingsUsecase(defaultSettings));
        await untilCalled(mockUpdateCategoryUsecase(Category(title: 'title')));

        verify(mockFetchCategoryUsecase('title'));
        verify(mockUpdateSettingsUsecase(tSettings));
        verify(mockUpdateCategoryUsecase(Category(title: 'title')));
      },
    );
    blocTest('should emits [CategoriesState.initState] when successful opening',
        build: () => categoriesBloc,
        act: (CategoriesBloc bloc) {
          setUpSettings();
          setUpFetchCategorySuccess();
          setUpUpdateSettingsSuccess();
          setUpUpdateCategorySuccess();
          bloc.add(OpenCategory('title'));
        },
        expect: () => [CategoriesState.initState()]);
    blocTest('should emits [CategoriesState.error] when not enough stars',
        build: () => categoriesBloc,
        act: (CategoriesBloc bloc) {
          setUpSettings();
          setUpFetchCategoryWithMaxCost();
          setUpUpdateSettingsSuccess();
          setUpUpdateCategorySuccess();
          bloc.add(OpenCategory('title'));
        },
        expect: () =>
            [CategoriesState.error('Not enough stars to open this topic')]);
    blocTest(
        'should emits [CategoriesState.error] when update settings failure',
        build: () => categoriesBloc,
        act: (CategoriesBloc bloc) {
          setUpSettings();
          setUpFetchCategorySuccess();
          setUpUpdateSettingsFailure();
          setUpUpdateCategorySuccess();
          bloc.add(OpenCategory('title'));
        },
        expect: () =>
            [CategoriesState.error('Something went wrong try again')]);
    blocTest(
        'should emits [CategoriesState.error] when update category failure',
        build: () => categoriesBloc,
        act: (CategoriesBloc bloc) {
          setUpSettings();
          setUpFetchCategorySuccess();
          setUpUpdateSettingsSuccess();
          setUpUpdateCategoryFailure();
          bloc.add(OpenCategory('title'));
        },
        expect: () =>
            [CategoriesState.error('Something went wrong try again')]);
  });

  group('ResetCategoryStudy', () {
    Settings tSettings = defaultSettings;
    Category tCategory = Category(title: 'title');

    void setUpSettings() {
      when(mockFetchSettingsUsecase())
          .thenAnswer((_) async => Right(defaultSettings));
      categoriesBloc.add(FetchSettings());
    }

    void setUpFetchCategorySuccess() =>
        when(mockFetchCategoryUsecase(tSettings.selectedCategory))
            .thenAnswer((_) async => Right(tCategory));
    void setUpUpdateCategorySuccess() =>
        when(mockUpdateCategoryUsecase(tCategory))
            .thenAnswer((_) async => Right(Success(message: "success")));
    void setUpFetchCategoryFailure() =>
        when(mockFetchCategoryUsecase(tSettings.selectedCategory))
            .thenAnswer((_) async => Left(Error(message: 'error')));
    void setUpUpdateCategoryFailure() =>
        when(mockUpdateCategoryUsecase(tCategory))
            .thenAnswer((_) async => Left(Error(message: 'error')));

    test(
      'should call mockFetchCategoryUsecase and mockUpdateCategoryUsecase',
      () async {
        setUpSettings();
        setUpFetchCategorySuccess();
        setUpUpdateCategorySuccess();
        categoriesBloc.add(ResetStudiedWords('title'));
        await untilCalled(mockFetchCategoryUsecase(tSettings.selectedCategory));
        await untilCalled(mockUpdateCategoryUsecase(tCategory));
        verify(mockFetchCategoryUsecase(tSettings.selectedCategory));
        verify(mockUpdateCategoryUsecase(tCategory));
      },
    );
    blocTest('should emits [CategoriesState.initState] when successful',
        build: () => categoriesBloc,
        act: (CategoriesBloc bloc) {
          setUpSettings();
          setUpFetchCategorySuccess();
          setUpUpdateCategorySuccess();
          bloc.add(ResetStudiedWords('title'));
        },
        expect: () => [CategoriesState.initState()]);
    blocTest('should emits [CategoriesState.error] when fetch category failure',
        build: () => categoriesBloc,
        act: (CategoriesBloc bloc) {
          setUpSettings();
          setUpFetchCategoryFailure();
          setUpUpdateCategorySuccess();
          bloc.add(ResetStudiedWords('title'));
        },
        expect: () => [CategoriesState.error("error")]);
    blocTest(
        'should emits [CategoriesState.error] when update category failure',
        build: () => categoriesBloc,
        act: (CategoriesBloc bloc) {
          setUpSettings();
          setUpFetchCategorySuccess();
          setUpUpdateCategoryFailure();
          bloc.add(ResetStudiedWords('title'));
        },
        expect: () => [CategoriesState.error("error")]);
  });

  group('FetchCategories', () {
    List<Category> tCategoryList = [Category(title: 'title')];

    void setUpSettings() {
      when(mockFetchSettingsUsecase())
          .thenAnswer((_) async => Right(defaultSettings));
      categoriesBloc.add(FetchSettings());
    }

    void setUpFetchAllCategoriesSuccess() =>
        when(mockFetchAllCategoriesUsecase())
            .thenAnswer((_) async => Right(tCategoryList));
    void setUpFetchAllCategoriesEmpty() => when(mockFetchAllCategoriesUsecase())
        .thenAnswer((_) async => const Right([]));
    void setUpFetchAllCategoriesFailure() =>
        when(mockFetchAllCategoriesUsecase())
            .thenAnswer((_) async => Left(Error(message: 'error')));

    test(
      'should call mockFetchCategoryUsecase and mockUpdateCategoryUsecase',
      () async {
        setUpSettings();
        setUpFetchAllCategoriesSuccess();
        categoriesBloc.add(FetchCategories());
        await untilCalled(mockFetchAllCategoriesUsecase());
        verify(mockFetchAllCategoriesUsecase());
      },
    );
    blocTest(
        'should emits [CategoriesState.loaded] when fetch categories successful',
        build: () => categoriesBloc,
        act: (CategoriesBloc bloc) {
          setUpSettings();
          setUpFetchAllCategoriesSuccess();
          bloc.add(FetchCategories());
        },
        expect: () => [
              CategoriesState.loaded(tCategoryList, 0),
            ]);
    blocTest('should emits [CategoriesState.empty] when category list empty',
        build: () => categoriesBloc,
        act: (CategoriesBloc bloc) {
          setUpSettings();
          setUpFetchAllCategoriesEmpty();
          bloc.add(FetchCategories());
        },
        expect: () => [CategoriesState.empty()]);
    blocTest(
        'should emits [CategoriesState.error] when fetch categories failure',
        build: () => categoriesBloc,
        act: (CategoriesBloc bloc) {
          setUpSettings();
          setUpFetchAllCategoriesFailure();
          bloc.add(FetchCategories());
        },
        expect: () => [CategoriesState.error("error")]);
  });

  group('DeleteCategory', () {
    void setUpSettings() {
      when(mockFetchSettingsUsecase())
          .thenAnswer((_) async => Right(defaultSettings));
      categoriesBloc.add(FetchSettings());
    }

    void setUpDeleteCategorySuccess() =>
        when(mockDeleteCategoryUsecase('title'))
            .thenAnswer((_) async => Right(Success(message: 'success')));
    void setUpUpdateSettingsSuccess() =>
        when(mockUpdateSettingsUsecase(defaultSettings))
            .thenAnswer((_) async => Right(Success(message: 'success')));
    void setUpDeleteCategoryFailure() =>
        when(mockDeleteCategoryUsecase('title'))
            .thenAnswer((_) async => Left(Error(message: 'error')));
    void setUpUpdateSettingsFailure() =>
        when(mockUpdateSettingsUsecase(defaultSettings))
            .thenAnswer((_) async => Left(Error(message: 'error')));

    test(
      'should call mockDeleteCategoryUsecase and mockUpdateSettingsUsecase',
      () async {
        setUpSettings();
        setUpDeleteCategorySuccess();
        setUpUpdateSettingsSuccess();
        categoriesBloc.add(DeleteOrResetCategory('title'));
        await untilCalled(mockDeleteCategoryUsecase('title'));
        await untilCalled(mockUpdateSettingsUsecase(defaultSettings));
        verify(mockDeleteCategoryUsecase('title'));
        verify(mockUpdateSettingsUsecase(defaultSettings));
      },
    );
    blocTest('should emits [] when delete category successful',
        build: () => categoriesBloc,
        act: (CategoriesBloc bloc) {
          setUpSettings();
          setUpDeleteCategorySuccess();
          setUpUpdateSettingsSuccess();
          bloc.add(DeleteOrResetCategory('title'));
        },
        expect: () => []);
    blocTest('should emits [CategoriesState.error] when delete category failure',
        build: () => categoriesBloc,
        act: (CategoriesBloc bloc) {
          setUpSettings();
          setUpDeleteCategoryFailure();
          setUpUpdateSettingsSuccess();
          bloc.add(DeleteOrResetCategory('title'));
        },
        expect: () => [CategoriesState.error("error")]);
    blocTest('should emits [CategoriesState.error] when update settings failure',
        build: () => categoriesBloc,
        act: (CategoriesBloc bloc) {
          setUpSettings();
          setUpDeleteCategorySuccess();
          setUpUpdateSettingsFailure();
          bloc.add(DeleteOrResetCategory('title'));
        },
        expect: () => []);
  });
}
