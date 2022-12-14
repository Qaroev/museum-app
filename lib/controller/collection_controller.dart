import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../models/collection_model.dart';

class CollectionController extends GetxController {
  List<Collection>? collectionItems;
  List<String>? afishaTypes = [];

  var isDataLoading = false.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    getApi();
  }

  @override
  Future<void> onReady() async {
    super.onReady();
  }

  @override
  void onClose() {}

  getApi() async {
    try {
      isDataLoading(true);
      http.Response response = await http.get(
        Uri.tryParse(
            'https://museum-noyabrsk.ru//platforms/themes/blankslate/collections.json')!,
        headers: {
          'Content-Type': 'application/json; charset=utf-16',
          'Cookie': 'bpc=06784db3c02ba52d5d279ccb5e944ce6',
        },
      );
      if (response.statusCode == 200) {
        collectionItems = [];
        var result = jsonDecode(response.body);
        if (result != null) {
          result.forEach((it) {
            collectionItems?.add(Collection.fromJson(it));
          });
          for (var element in collectionItems!) {
            if (element.type_afisha != null &&
                element.type_afisha!.name != '' &&
                !afishaTypes!.contains(element.type_afisha!.name)) {
              afishaTypes!.add(element.type_afisha!.name!);
            }
          }
          print(afishaTypes);
        }
        update();
      } else {}
    } catch (e) {
      log('Error while getting data is $e');
      print('Error while getting data is $e');
    } finally {
      isDataLoading(false);
    }
  }
}
