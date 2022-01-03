import 'package:get/get.dart';
import 'package:getx_clean_architecture/app/data/repository/implementations/api_repository_implementation.dart';
import 'package:getx_clean_architecture/app/data/repository/implementations/local_repository_implements.dart';
import 'package:getx_clean_architecture/app/data/repository/interfaces/api_repository.dart';
import 'package:getx_clean_architecture/app/data/repository/interfaces/local_data.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<LocalRepositoryInterfasce>(
      LocalRespositoryImplements(),
    );
    Get.put<ApiRepositoryInterface>(
      ApiRepositoryImplementation(),
    );
  }
}
