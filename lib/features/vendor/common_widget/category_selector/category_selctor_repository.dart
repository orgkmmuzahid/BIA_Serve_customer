import 'package:bai_serve/features/vendor/common_widget/category_selector/category_model.dart';

abstract class CategorySelctorRepository {
  Future<List<CategoryModel>> fetch();
}

class RealCategorySelctorRepository implements CategorySelctorRepository {
  @override
  Future<List<CategoryModel>> fetch() {
    // TODO: implement fetch
    throw UnimplementedError();
  }
}

class MockCategorySelctorRepository implements CategorySelctorRepository {
  @override
  Future<List<CategoryModel>> fetch() async {
    await Future.delayed(const Duration(seconds: 1));
    return [for (int i = 0; i < 5; i++) CategoryModel(id: i.toString(), name: 'Product Category $i')];
  }
}
