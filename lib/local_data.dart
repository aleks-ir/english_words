import 'common/constants/initial_categories.dart';
import 'domain/usecases/categories/create_and_fill_in_category_usecase.dart';


class LocalData {
  final CreateAndFillInCategoryUsecase createCategoryUsecase;

  LocalData(
      {required this.createCategoryUsecase});


  void init() {
    initialPathCategoriesMap.forEach((path, category) async{
      final result = await createCategoryUsecase(path, category.toDomain());
      result.fold((exception) => print(exception.message),
              (successMessage) => print(successMessage));
    });
  }
}
