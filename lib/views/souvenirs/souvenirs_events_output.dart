import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:museum_resource_center/models/products_model.dart';
import 'package:shimmer/shimmer.dart';

import '../../controller/product_controller.dart';
import '../../main.dart';
import '../../utils/dimensions.dart';
import '../../utils/local_storage_service.dart';
import '../../utils/utils.dart';
import '../../widget/big-text-widget.dart';
import '../home/page/home-page.dart';

class SouvenirsEventsOutput extends StatefulWidget {
  final Products? products;

  const SouvenirsEventsOutput({Key? key, this.products}) : super(key: key);

  @override
  _SouvenirsEventsOutputState createState() => _SouvenirsEventsOutputState();
}

class _SouvenirsEventsOutputState extends State<SouvenirsEventsOutput> {
  ProductController productController = Get.find();
  int numBasket = 0;

  @override
  void initState() {
    super.initState();
    addToBasket.stream.listen((event) {
      if (event != null) {
        numBasket = event;
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F8F9),
      body: CustomScrollView(
        scrollDirection: Axis.vertical,
        slivers: [
          SliverAppBar(
            toolbarHeight: Dimensions.height100,
            toolbarTextStyle: const TextStyle(color: Colors.black),
            automaticallyImplyLeading: false,
            primary: false,
            pinned: true,
            expandedHeight: Dimensions.height362,
            backgroundColor: Colors.white,
            flexibleSpace: LayoutBuilder(
              builder: (context, constraints) {
                return FlexibleSpaceBar(
                  centerTitle: true,
                  titlePadding: EdgeInsets.only(top: Dimensions.height10),
                  title: constraints.maxHeight >= 160
                      ? Container()
                      : Container(
                          width: double.infinity,
                          margin: EdgeInsets.only(
                              left: Dimensions.width20,
                              bottom: Dimensions.height10,
                              top: Dimensions.height10,
                              right: Dimensions.width20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  IconButton(
                                    icon: Icon(
                                      Icons.arrow_back_ios,
                                      color: Colors.black,
                                      size: Dimensions.iconSize20,
                                    ),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                  SizedBox(
                                    width: Dimensions.width10,
                                  ),
                                  SizedBox(
                                    width: Dimensions.width200,
                                    child: BigTextWidget(
                                      text: "Сумка женская",
                                      size: Dimensions.font16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Stack(
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          pageController.jumpToPage(2);
                                        },
                                        icon: const Icon(
                                          Icons.shopping_cart_outlined,
                                          color: Colors.black,
                                        ),
                                      ),
                                      numBasket == 0
                                          ? Container()
                                          : Positioned(
                                              top: 10,
                                              left: 10,
                                              child: Container(
                                                width: 14,
                                                height: 14,
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                    color: Colors.red,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20)),
                                                child: Text(
                                                  '$numBasket',
                                                  textAlign: TextAlign.center,
                                                  style: const TextStyle(
                                                      color: Colors.red,
                                                      fontSize: 10,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            )
                                    ],
                                  ),
                                  SizedBox(
                                    width: Dimensions.width5,
                                  ),
                                  // Image.asset(
                                  //   "assets/images/menu.png",
                                  //   color: Colors.black,
                                  //   width: Dimensions.width20,
                                  //   height: Dimensions.height20,
                                  // ),
                                ],
                              ),
                            ],
                          ),
                        ),
                  background: Stack(children: [
                    Image.network(
                      widget.products!.images[0]['src'] ?? '',
                      fit: BoxFit.fill,
                      headers: const {
                        'Cookie': 'bpc=06784db3c02ba52d5d279ccb5e944ce6',
                      },
                      height: Dimensions.height500,
                      width: double.infinity,
                      loadingBuilder: (BuildContext context, Widget child,
                          ImageChunkEvent? loadingProgress) {
                        if (loadingProgress == null) {
                          return child;
                        }
                        return Shimmer.fromColors(
                          baseColor: Colors.grey,
                          highlightColor: Colors.grey.withOpacity(0.3),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                            ),
                          ),
                        );
                      },
                      errorBuilder: (BuildContext context, Object exception,
                          StackTrace? stackTrace) {
                        return Image.asset('assets/images/show1.png');
                      },
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          top: Dimensions.height50,
                          left: Dimensions.width20,
                          right: Dimensions.width20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: Dimensions.width40,
                            height: Dimensions.height40,
                            decoration: BoxDecoration(
                                color:
                                    const Color(0xFF434670).withOpacity(0.25),
                                borderRadius:
                                    BorderRadius.circular(Dimensions.radius10)),
                            child: IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: Icon(
                                  Icons.arrow_back_ios,
                                  color: Colors.white,
                                  size: Dimensions.iconSize15,
                                )),
                          ),
                          Row(
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    width: Dimensions.width40,
                                    height: Dimensions.height40,
                                    decoration: BoxDecoration(
                                        color: const Color(0xFF434670)
                                            .withOpacity(0.25),
                                        borderRadius: BorderRadius.circular(
                                            Dimensions.radius10)),
                                    child: Center(
                                      child: IconButton(
                                          onPressed: () async {
                                            var res =
                                                await LocalStorageService()
                                                    .getData('favorites');
                                            if (res == null) {
                                              dynamic user = {
                                                "id": widget.products!.id,
                                              };
                                              LocalStorageService().saveData(
                                                'favorites',
                                                encode([user]),
                                              );
                                              addToBasket.add(1);
                                            } else {
                                              List<dynamic> childrens =
                                                  decode(res);
                                              var newArr = childrens
                                                  .where((e) =>
                                                      e['id'] ==
                                                      widget.products!.id)
                                                  .toList();
                                              if (newArr.isEmpty) {
                                                dynamic user = {
                                                  "id": widget.products!.id,
                                                };
                                                childrens.add(user);
                                                LocalStorageService().saveData(
                                                  'favorites',
                                                  encode(childrens),
                                                );
                                                addToBasket
                                                    .add(childrens.length);
                                              }
                                            }
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(const SnackBar(
                                                    content: Text(
                                                        'Добавлено в корзину')));
                                          },
                                          icon: Icon(
                                            Icons.shopping_cart_outlined,
                                            size: Dimensions.iconSize15,
                                            color: Colors.white,
                                          )),
                                    ),
                                  ),
                                  numBasket == 0
                                      ? Container()
                                      : Positioned(
                                          child: Container(
                                            width: 15,
                                            height: 15,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                                color: Color(0xFF2F2E41),
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            child: Text(
                                              '$numBasket',
                                              textAlign: TextAlign.center,
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        )
                                ],
                              ),
                              SizedBox(
                                width: Dimensions.width5,
                              ),
                              // Image.asset(
                              //   "assets/images/menu.png",
                              //   color: Colors.black,
                              //   width: Dimensions.width20,
                              //   height: Dimensions.height20,
                              // ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                            width: double.maxFinite,
                            height: Dimensions.height102,
                            padding: const EdgeInsets.all(20),
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                              image: AssetImage("assets/images/rectangle2.png"),
                            )),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(widget.products!.categories[0]['name'],
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: Dimensions.font13,
                                        fontWeight: FontWeight.w400)),
                                SizedBox(
                                  height: Dimensions.height10,
                                ),
                                Text(widget.products!.name ?? '',
                                    maxLines: 2,
                                    style: TextStyle(
                                        color: const Color(0xFFFFFFFF),
                                        overflow: TextOverflow.ellipsis,
                                        fontSize: Dimensions.font20,
                                        fontWeight: FontWeight.w800)),
                              ],
                            ))
                      ],
                    ),
                  ]),
                );
              },
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            fillOverscroll: false,
            child: Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BigTextWidget(
                      text: "Об элементе",
                      size: Dimensions.font18,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF06070D),
                    ),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                    Text(widget.products!.description ?? '',
                        style: TextStyle(
                            height: 1.2,
                            color: const Color(0xFF120D26),
                            fontSize: Dimensions.font16,
                            fontWeight: FontWeight.w400)),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                    BigTextWidget(
                      text: 'Рекомендуем еще',
                      size: Dimensions.font18,
                      color: const Color(0xFF06070D),
                      fontWeight: FontWeight.w600,
                    ),
                    SizedBox(
                      height: Dimensions.height10,
                    ),
                    GetBuilder<ProductController>(
                        init: ProductController(),
                        builder: (evt) {
                          if (evt.isDataLoading.value) {
                            return const Center(
                                child: CircularProgressIndicator());
                          }
                          var items = evt.products!
                              .where((element) =>
                                  element.id != widget.products!.id &&
                                  element.categories[0]['name'] ==
                                      widget.products!.categories[0]['name'])
                              .toList();
                          print(items);
                          return SizedBox(
                            height: Dimensions.height120,
                            child: ListView.builder(
                                itemCount:
                                    items.length >= 10 ? 10 : items.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return Container(
                                    height: Dimensions.height106,
                                    padding: const EdgeInsets.all(10),
                                    margin: EdgeInsets.only(right: 10),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(
                                            Dimensions.radius15)),
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    SouvenirsEventsOutput(
                                                      products: items[index],
                                                    )));
                                      },
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Stack(
                                            children: [
                                              Container(
                                                width: Dimensions.width73,
                                                height: Dimensions.height96,
                                                decoration: BoxDecoration(
                                                    color:
                                                        const Color(0xFFBEBEBE),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            Dimensions
                                                                .radius15)),
                                              ),
                                              SizedBox(
                                                width: Dimensions.width73,
                                                height: Dimensions.height96,
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10), // Ima
                                                  child: SizedBox.fromSize(
                                                    size: const Size.fromRadius(
                                                        20),
                                                    // Image radius
                                                    child: Image.network(
                                                      items[index].images[0]
                                                              ['src'] ??
                                                          '',
                                                      fit: BoxFit.cover,
                                                      headers: const {
                                                        'Cookie':
                                                            'bpc=06784db3c02ba52d5d279ccb5e944ce6',
                                                      },
                                                      height:
                                                          Dimensions.height158,
                                                      loadingBuilder: (BuildContext
                                                              context,
                                                          Widget child,
                                                          ImageChunkEvent?
                                                              loadingProgress) {
                                                        if (loadingProgress ==
                                                            null) {
                                                          return child;
                                                        }
                                                        return Shimmer
                                                            .fromColors(
                                                          baseColor: Colors.grey
                                                              .withOpacity(0.8),
                                                          highlightColor: Colors
                                                              .grey
                                                              .withOpacity(0.3),
                                                          child: Container(
                                                            width: Dimensions
                                                                .width73,
                                                            height: Dimensions
                                                                .height96,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Colors
                                                                  .grey[300],
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                      errorBuilder:
                                                          (BuildContext context,
                                                              Object exception,
                                                              StackTrace?
                                                                  stackTrace) {
                                                        return Image.asset(
                                                            'assets/images/picture.png');
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            width: Dimensions.height20,
                                          ),
                                          SizedBox(
                                            width: Dimensions.width180,
                                            height: Dimensions.height80,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                    items[index].categories[0]
                                                        ['name'],
                                                    style: TextStyle(
                                                        color: const Color(
                                                            0XFF747688),
                                                        fontSize:
                                                            Dimensions.font13,
                                                        fontWeight:
                                                            FontWeight.w400)),
                                                Text(items[index].name ?? '',
                                                    maxLines: 2,
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        fontSize:
                                                            Dimensions.font16,
                                                        fontWeight:
                                                            FontWeight.w400)),
                                                Text(
                                                    '${items[index].price} руб.',
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize:
                                                            Dimensions.font16,
                                                        fontWeight:
                                                            FontWeight.w600))
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            width: Dimensions.height20,
                                          ),
                                          InkWell(
                                            onTap: () async {
                                              var res =
                                                  await LocalStorageService()
                                                      .getData('favorites');
                                              if (res == null) {
                                                dynamic user = {
                                                  "id": items[index].id,
                                                };
                                                LocalStorageService().saveData(
                                                  'favorites',
                                                  encode([user]),
                                                );
                                                addToBasket.add(1);
                                              } else {
                                                List<dynamic> childrens =
                                                    decode(res);
                                                var newArr = childrens
                                                    .where((e) =>
                                                        e['id'] ==
                                                        items[index].id)
                                                    .toList();
                                                if (newArr.isEmpty) {
                                                  dynamic user = {
                                                    "id": items[index].id,
                                                  };
                                                  childrens.add(user);
                                                  LocalStorageService()
                                                      .saveData(
                                                    'favorites',
                                                    encode(childrens),
                                                  );
                                                  addToBasket
                                                      .add(childrens.length);
                                                }
                                              }
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(const SnackBar(
                                                      content: Text(
                                                          'Добавлено в корзину')));
                                            },
                                            child: Container(
                                                alignment: Alignment.topRight,
                                                margin: EdgeInsets.only(
                                                    right: Dimensions.width10,
                                                    top: Dimensions.height10),
                                                child: const Icon(Icons
                                                    .shopping_cart_outlined)),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                          );
                        }),
                  ],
                )),
          )
        ],
      ),
      bottomNavigationBar: Container(
        height: Dimensions.height87,
        decoration: const BoxDecoration(color: Colors.white),
        child: Container(
          alignment: Alignment.center,
          child: ElevatedButton(
            onPressed: () async {
              var res = await LocalStorageService().getData('favorites');

              if (res == null) {
                dynamic user = {
                  "id": widget.products!.id,
                };
                LocalStorageService().saveData(
                  'favorites',
                  encode([user]),
                );
                addToBasket.add(1);
              } else {
                List<dynamic> childrens = decode(res);
                var newArr = childrens
                    .where((e) => e['id'] == widget.products!.id)
                    .toList();
                if (newArr.isEmpty) {
                  dynamic user = {
                    "id": widget.products!.id,
                  };
                  childrens.add(user);
                  LocalStorageService().saveData(
                    'favorites',
                    encode(childrens),
                  );
                  addToBasket.add(childrens.length);
                }
              }
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Добавлено в корзину')));
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
              "Заказать",
              style:
                  TextStyle(color: Colors.white, fontSize: Dimensions.font13),
            ),
          ),
        ),
      ),
    );
  }
}
