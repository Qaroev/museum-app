import 'package:museum_resource_center/controller/afisha_controller.dart';
import 'package:museum_resource_center/controller/collection_controller.dart';
import 'package:get/get.dart';
import 'package:museum_resource_center/controller/exhibitions_controller.dart';
import 'package:museum_resource_center/controller/news_controller.dart';
import 'package:museum_resource_center/controller/product_controller.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() async {

    // Controller
    Get.lazyPut(() => AfishaController(), fenix: true);
    Get.lazyPut(() => CollectionController(), fenix: true);
    Get.lazyPut(() => ExhibitionsController(), fenix: true);
    Get.lazyPut(() => NewsController(), fenix: true);
    Get.lazyPut(() => ProductController(), fenix: true);

  }
}
