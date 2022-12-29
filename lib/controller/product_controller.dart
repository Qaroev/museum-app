import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:museum_resource_center/models/products_model.dart';
import 'package:woocommerce_api/woocommerce_api.dart';

import '../models/collection_model.dart';

class ProductController extends GetxController {
  List<Products>? products;

  var isDataLoading = false.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    getApi();
    // getCategories();
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
            'https://museum-noyabrsk.ru/wp-json/wc/v2/products?consumer_key=ck_2f9749ec01dec355324a913ebcae9a3d860460f0&consumer_secret=cs_0d57e842c70e84c6180b164a80a696580fd57940&per_page=100')!,
          headers: {
          'Content-Type': 'application/json; charset=utf-16',
          'Cookie': 'bpc=06784db3c02ba52d5d279ccb5e944ce6',
        },
      );
      if (response.statusCode == 200) {
        products = [];
        var result = jsonDecode(response.body);
        if (result != null) {
          result.forEach((it) {
            products?.add(Products.fromJson(it));
          });
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

  getCategories() async {
    try {
      WooCommerceAPI wooCommerceAPI = WooCommerceAPI(
          url: "https://museum-noyabrsk.ru",
          consumerKey: "ck_2f9749ec01dec355324a913ebcae9a3d860460f0",
          consumerSecret: "cs_0d57e842c70e84c6180b164a80a696580fd57940");
      var categories = await wooCommerceAPI.getAsync("products/categories");
      return categories;
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
