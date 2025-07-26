import 'package:bai_serve/config/dependency/core_dependency.dart';
import 'package:bai_serve/config/dependency/mock_repository_dependency.dart';
import 'package:bai_serve/config/dependency/state_dependency.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

class DependencyInjection extends Bindings {
  @override
  void dependencies() {
    CoreDependency.dependencies();

    //repositroy
    MockRepositoryDependency.dependencies();
    // RealRepositoryDependency.dependencies();

    StateDependency.dependencies();
  }
}
