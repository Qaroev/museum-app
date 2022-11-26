import 'dart:convert';
import 'dart:developer';

import 'package:collection/collection.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import '../models/afish_model.dart';

class AfishaController extends GetxController {
  List<AfishaModel>? afishaItems;
  List<AfishaModel> afishaList = [];

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
            'https://museum-noyabrsk.ru//platforms/themes/blankslate/afisha.json')!,
      );
      if (response.statusCode == 200) {
        afishaItems = [];
        var result = jsonDecode(response.body);
        if (result != null) {
          result.forEach((it) {
            afishaItems?.add(AfishaModel.fromJson(it));
          });
        }
        // afishaItems!.sort((a, b) {
        //   var adate = DateFormat('yyyy-MM-dd HH:mm:ss')
        //       .parse('${a.seanses[0]['date']}:00', true)
        //       .microsecondsSinceEpoch;
        //   var bdate = DateFormat('yyyy-MM-dd HH:mm:ss')
        //       .parse('${b.seanses[0]['date']}:00', true)
        //       .microsecondsSinceEpoch;
        //   return adate.compareTo(bdate);
        // });
        var itemss = getGroup(afishaItems!);
        var newMap = groupBy(itemss.entries, (dynamic obj) {
          var dateTime = DateFormat('yyyy-MM-dd')
              .parse(obj.key.split(' ')[0], true)
              .millisecondsSinceEpoch;
          var now = DateTime.now();
          final now1 = DateTime(now.year, now.month, now.day, 0, 0, 0);
          return now1.millisecondsSinceEpoch <= dateTime;
        });
        afishaList = [];
        var list = newMap[true] as dynamic;
        if (list != null) {
          list.forEach((element) {
            element.value.forEach((el) {
              afishaList.add(AfishaModel.fromJson(el));
            });
          });
        }
        print(afishaList);
      } else {}
    } catch (e) {
      log('Error while getting data is $e');
      print('Error while getting data is $e');
    } finally {
      isDataLoading(false);
    }
  }
}

getGroup(List<AfishaModel> afishaEvents) {
  var resultData = {};
  var dates = [];
  for (var element in afishaEvents) {
    if (element.seanses != null) {
      var elemDates = element.seanses!.map((it) => it['date']).toList();
      dates.addAll(elemDates);
    }
  }
  dates.sort((a, b) => DateFormat('yyyy-MM-dd')
      .parse(a.split(' ')[0], true)
      .millisecondsSinceEpoch
      .compareTo(DateFormat('yyyy-MM-dd')
          .parse(b.split(' ')[0], true)
          .millisecondsSinceEpoch));
  dates.toSet().forEach((d) {
    resultData[d] = [];
    for (var element in afishaEvents) {
      var dd = element.seanses
          .firstWhere((it) => it['date'] == d, orElse: () {});
      if (dd != null) {
        resultData[d].add({
          "name": element.name,
            "id": element.id,
            "type_afisha": element.type_afisha,
            "vip": element.vip,
            "img": element.img,
            "data-tc-event": element.datatcevent,
            "data-tc-token": element.datatctoken,
            "data-tc-meta": element.datatcmeta,
            "short_desc": element.short_desc,
            "description": element.description,
            "price": element.price,
            "place": element.place,
            "id-company": element.idCompany,
            "gallery": element.gallery,
            "phone": element.phone,
            "seanses": [],
        });
        if (element.seanses != null) {
          element.seanses!.forEach((evt) => {
                if (evt['date'] == d)
                  {
                    resultData[d][resultData[d].length - 1]['seanses']
                        .add(evt)
                  }
              });
        }
      }
    }
  });
  return resultData;
}
