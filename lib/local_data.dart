import 'common/constants/initial_categories.dart';
import 'domain/usecases/categories/create_and_fill_in_category_usecase.dart';


class LocalData {
  final CreateAndFillInCategoryUsecase createCategoryUsecase;

  LocalData(
      {required this.createCategoryUsecase});


  void init() {
    initialCategoriesMap.forEach((categoryName, category) async{
      final result = await createCategoryUsecase(initialPathsMap[categoryName] ?? '', category.toDomain());
      result.fold((exception) => print(exception.message),
              (successMessage) => print(successMessage));
    });
  }
}
