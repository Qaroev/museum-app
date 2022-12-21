import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:woocommerce_api/woocommerce_api.dart';

import '../models/collection_model.dart';

class ProductController extends GetxController {
  List<Collection>? collectionItems;

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
      WooCommerceAPI wooCommerceAPI = WooCommerceAPI(
          url: "https://museum-noyabrsk.ru",
          consumerKey: "ck_2f9749ec01dec355324a913ebcae9a3d860460f0",
          consumerSecret: "cs_0d57e842c70e84c6180b164a80a696580fd57940");
      var products = await wooCommerceAPI.getAsync("products");
      return products;
    } on SocketException {
      throw Exception("No Internet connection");
    } on HttpException {
      throw Exception("Couldn't find info");
    } on FormatException {
      throw Exception("Bad response format");
    } catch (e) {
      log('Error while getting data is $e');
      print('Error while getting data is $e');
    } finally {
      isDataLoading(false);
    }
  }
}
