import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:mailer/smtp_server/gmail.dart';
import 'package:shimmer/shimmer.dart';

import '../../../controller/product_controller.dart';
import '../../../main.dart';
import '../../../models/products_model.dart';
import '../../../utils/dimensions.dart';
import '../../../utils/local_storage_service.dart';
import '../../../utils/utils.dart';
import '../../../widget/big-text-widget.dart';
import '../../souvenirs/souvenirs_events_output.dart';

class BasketPageBody extends StatefulWidget {
  const BasketPageBody({Key? key}) : super(key: key);

  @override
  _BasketPageBodyState createState() => _BasketPageBodyState();
}

class _BasketPageBodyState extends State<BasketPageBody> {
  final name = TextEditingController();
  final phone = TextEditingController();
  final email = TextEditingController();
  ProductController productController = Get.find();
  bool showPage = false;
  List<Products>? productss = [];

  @override
  void initState() {
    super.initState();
    getItems();
  }

  getItems() async {
    var res = await LocalStorageService().getData('favorites');
    if (res != null) {
      List<dynamic> childrens = decode(res);
      for (var child in childrens) {
        for (var element in productController.products!) {
          if (child['id'] == element.id) {
            productss!.add(element);
          }
        }
        addToBasket.add(productss!.length);
      }
    } else {
      showPage = true;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          child: productss!.isEmpty
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BigTextWidget(
                      text: "Моя корзина",
                      size: Dimensions.font20,
                      fontWeight: FontWeight.w800,
                    ),
                    Container(
                      margin: const EdgeInsets.all(50),
                      child: Text(
                        "Пока тут пусто.Но Вы всегда можете что-тозаказать в наших сувенирах.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: Dimensions.font16,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF120D26),
                        ),
                      ),
                    ),
                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BigTextWidget(
                      text: "Моя корзина",
                      size: Dimensions.font20,
                      fontWeight: FontWeight.w800,
                    ),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                    ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: productss!.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          SouvenirsEventsOutput(
                                            products: productss![index],
                                          )));
                            },
                            child: listItems(productss![index]),
                          );
                        }),
                    Container(
                      height: Dimensions.height87,
                      decoration: const BoxDecoration(color: Colors.white),
                      child: Container(
                        alignment: Alignment.center,
                        child: ElevatedButton(
                          onPressed: () {
                            showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                elevation: 0,
                                context: context,
                                builder: (BuildContext contexts) {
                                  return Container(
                                    height: Dimensions.height500,
                                    padding: const EdgeInsets.all(20),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(
                                              Dimensions.radius30),
                                          topRight: Radius.circular(
                                              Dimensions.radius30)),
                                    ),
                                    child: Column(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                          child: SizedBox(
                                            width: Dimensions.width30,
                                            child: const Divider(
                                              thickness: 5,
                                              color: Color(0xFFB2B2B2),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: Dimensions.height10,
                                        ),
                                        BigTextWidget(
                                          text: "Заказать сувенир",
                                          size: Dimensions.font24,
                                          fontWeight: FontWeight.w500,
                                          color: const Color(0xFF120D26),
                                        ),
                                        SizedBox(
                                          height: Dimensions.height20,
                                        ),
                                        Form(
                                          child: Column(
                                            children: [
                                              TextField(
                                                  controller: name,
                                                  decoration: InputDecoration(
                                                      hintText:
                                                          "Как вас зовут?",
                                                      hintStyle: TextStyle(
                                                          fontSize:
                                                              Dimensions.font18,
                                                          color: const Color(
                                                              0xFF120D26),
                                                          fontWeight:
                                                              FontWeight.w400)),
                                                  keyboardType:
                                                      TextInputType.text),
                                              TextField(
                                                controller: phone,
                                                decoration: InputDecoration(
                                                    hintText:
                                                        "Контактный телефон",
                                                    hintStyle: TextStyle(
                                                        fontSize:
                                                            Dimensions.font18,
                                                        color: const Color(
                                                            0xFF120D26),
                                                        fontWeight:
                                                            FontWeight.w400)),
                                                keyboardType:
                                                    TextInputType.phone,
                                              ),
                                              TextField(
                                                controller: email,
                                                decoration: InputDecoration(
                                                    hintText:
                                                        "Контактный email",
                                                    hintStyle: TextStyle(
                                                        fontSize:
                                                            Dimensions.font18,
                                                        color: const Color(
                                                            0xFF120D26),
                                                        fontWeight:
                                                            FontWeight.w400)),
                                                keyboardType:
                                                    TextInputType.emailAddress,
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: Dimensions.height40,
                                        ),
                                        GestureDetector(
                                          onTap: () async {
                                            await sendMail();
                                            Navigator.of(context).pop();

                                            showModalBottomSheet(
                                                isScrollControlled: true,
                                                backgroundColor:
                                                    Colors.transparent,
                                                elevation: 0,
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return Container(
                                                      alignment:
                                                          Alignment.center,
                                                      height:
                                                          Dimensions.height500,
                                                      padding:
                                                          const EdgeInsets.all(
                                                              20),
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius: BorderRadius.only(
                                                            topLeft:
                                                                Radius.circular(
                                                                    Dimensions
                                                                        .radius30),
                                                            topRight:
                                                                Radius.circular(
                                                                    Dimensions
                                                                        .radius30)),
                                                      ),
                                                      child: Column(
                                                        children: [
                                                          GestureDetector(
                                                            onTap: () {
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            child: SizedBox(
                                                              width: Dimensions
                                                                  .width30,
                                                              child:
                                                                  const Divider(
                                                                thickness: 5,
                                                                color: Color(
                                                                    0xFFB2B2B2),
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: Dimensions
                                                                .height10,
                                                          ),
                                                          BigTextWidget(
                                                            text:
                                                                "Заказать сувенир",
                                                            size: Dimensions
                                                                .font24,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color: const Color(
                                                                0xFF120D26),
                                                          ),
                                                          SizedBox(
                                                            height: Dimensions
                                                                .height100,
                                                          ),
                                                          SizedBox(
                                                            width: 204,
                                                            child: Text(
                                                              "Спасибо. Мы получили Вашу заявку и очень скоро с Вами свяжемся",
                                                              style: TextStyle(
                                                                fontSize:
                                                                    Dimensions
                                                                        .font16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                color: const Color(
                                                                    0xFF120D26),
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                            ),
                                                          ),
                                                        ],
                                                      ));
                                                });
                                          },
                                          child: Container(
                                            width: double.maxFinite,
                                            height: 48,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(14),
                                              color: const Color(0xFF2F3A4B),
                                            ),
                                            child: Center(
                                                child: BigTextWidget(
                                              text: "Заказать",
                                              size: Dimensions.font15,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white,
                                            )),
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                });
                          },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(horizontal: 80),
                            backgroundColor: const Color(0xFF2F3A4B),
                            elevation: 1,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14.0),
                            ),
                          ),
                          child: Text(
                            "Перейти к оформлению",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: Dimensions.font13),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
        ),
      ],
    );
  }

  listItems(Products products) {
    return Container(
      width: Dimensions.width380,
      height: Dimensions.height106,
      margin: EdgeInsets.only(bottom: Dimensions.height10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(Dimensions.radius15)),
      child: Stack(children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  width: Dimensions.width73,
                  height: Dimensions.height96,
                  decoration: BoxDecoration(
                      color: const Color(0xFFBEBEBE),
                      borderRadius: BorderRadius.circular(Dimensions.radius15)),
                ),
                Container(
                  width: Dimensions.width73,
                  height: Dimensions.height96,
                  alignment: Alignment.bottomLeft,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Image.network(
                    products.images[0]['src'] ?? '',
                    fit: BoxFit.cover,
                    height: 300,
                    headers: const {
                      'Cookie': 'bpc=06784db3c02ba52d5d279ccb5e944ce6',
                    },
                    loadingBuilder: (BuildContext context, Widget child,
                        ImageChunkEvent? loadingProgress) {
                      if (loadingProgress == null) {
                        return child;
                      }
                      return Shimmer.fromColors(
                        baseColor: Colors.grey.withOpacity(0.8),
                        highlightColor: Colors.grey.withOpacity(0.3),
                        child: Container(
                          width: Dimensions.width92,
                          height: Dimensions.height92,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                          ),
                        ),
                      );
                    },
                    errorBuilder: (BuildContext context, Object exception,
                        StackTrace? stackTrace) {
                      return Image.asset('assets/images/picture.png');
                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              width: Dimensions.width40,
            ),
            SizedBox(
              width: Dimensions.width180,
              height: Dimensions.height80,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(products.categories[0]['name'],
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: Dimensions.font13,
                          fontWeight: FontWeight.w400)),
                  Text(products.name ?? '',
                      maxLines: 2,
                      style: TextStyle(
                          color: Colors.black,
                          overflow: TextOverflow.ellipsis,
                          fontSize: Dimensions.font16,
                          fontWeight: FontWeight.w400)),
                  Text('${products.price} руб.',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: Dimensions.font16,
                          fontWeight: FontWeight.w600))
                ],
              ),
            ),
          ],
        ),
        InkWell(
          onTap: () async {
            var res = await LocalStorageService().getData('favorites');
            List<dynamic> childrens = decode(res!);
            var newArr =
                childrens.where((e) => e['id'] != products.id).toList();
            productss = productss!.where((e) => e.id != products.id).toList();
            LocalStorageService().saveData(
              'favorites',
              encode(newArr),
            );
            addToBasket.add(productss!.length);
            setState(() {});
          },
          child: Container(
              alignment: Alignment.topRight,
              margin: EdgeInsets.only(
                  right: Dimensions.width10, top: Dimensions.height10),
              child: Image.asset("assets/icons/delete.png")),
        )
      ]),
    );
  }

  sendMail() async {
    String username = 'mailgo@binarywd.com';
    String password = 'K4y-e9G-7hp-z2c';
    String r = Random().nextInt(999999).toString().padLeft(6, '0');
    print(r);
    final smtpServer = yandex(username, password);
    var order = '';
    for (var element in productss!) {
      order +=
          ' ${productss!.indexOf(element) + 1}. ${element.name}  |  ${element.price} \n';
    }
    final message = Message()
      ..from = Address(username)
      ..ccRecipients.addAll(
          ['pr-museum89@mail.ru', 'gulboyqaroev@mail.ru']) //cc Recipents emails
      ..bccRecipients.add(const Address(
          'pr-museum89@mail.ru', 'gulboyqaroev@mail.ru')) //bcc Recipents emails
      ..subject =
          'Тема: Заказ № $r  с мобильного приложения МРЦ' //subject of the email
      ..text =
          'Письмо\n Заказ #$r был оформлен в мобильном приложении \n Информация о заказе: \n$order  \nИнформация о заказчике \nКак зовут: ${name.text}\nКонтактный телефон: ${phone.text}\nКонтакный email: ${email.text}\n\nДата создания заказа: ${DateTime.now()}'; //body of the email

    try {
      final sendReport = await send(message, smtpServer);
      await LocalStorageService().removeData('favorites');
      productss = [];
      setState(() {});
      addToBasket.add(0);
      Navigator.of(context).pop();
      print('Message sent: ' +
          sendReport.toString()); //print if the email is sent
    } on MailerException catch (e) {
      print('Message not sent. \n' +
          e.toString()); //print if the email is not sent
      // e.toString() will show why the email is not sending
    }
  }
}
