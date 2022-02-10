import 'common/constants/initial_categories.dart';
import 'domain/usecases/categories/create_category_with_data_usecase.dart';


class LocalData {
  final CreateCategoryWithDataUsecase createCategoryUsecase;

  LocalData(
      {required this.createCategoryUsecase});


  void init() {
    initialCategoriesMap.forEach((path, category) async{
      final result = await createCategoryUsecase(path, category);
      result.fold((exception) => print(exception.message),
              (successMessage) => print(successMessage));
    });
  }
}
