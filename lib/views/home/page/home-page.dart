import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:museum_resource_center/utils/utils.dart';
import 'package:museum_resource_center/widget/big-text-widget.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../controller/afisha_controller.dart';
import '../../../controller/collection_controller.dart';
import '../../../controller/exhibitions_controller.dart';
import '../../../main.dart';
import '../../../utils/dimensions.dart';
import '../../collections/collections_events.dart';
import '../../news/news_events.dart';
import '../../poster/poster_events.dart';
import '../../show/show_events.dart';
import '../../souvenirs/souvenirs_events.dart';
import '../basket_page/basket_page_body.dart';
import '../searsh/search_page_body.dart';
import 'home_page_body.dart';

PageController pageController = PageController(initialPage: 1);

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AfishaController afishaController = Get.put(AfishaController());
  CollectionController collectionController = Get.put(CollectionController());
  ExhibitionsController exhibitionsController =
      Get.put(ExhibitionsController());
  int numBasket = 0;
  List<dynamic> collection = [];
  List<dynamic> afisha = [];
  List<dynamic> posters = [];
  List<dynamic> souveners = [];
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final answer = TextEditingController();
  final name = TextEditingController();
  final phone = TextEditingController();
  final email = TextEditingController();
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
    Dimensions();
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: const Color(0xFFF3F8F9),
      appBar: AppBar(
        titleSpacing: 0,
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            if (scaffoldKey.currentState!.isDrawerOpen) {
              scaffoldKey.currentState!.openEndDrawer();
            } else {
              scaffoldKey.currentState!.openDrawer();
            }
          },
          icon: Image.asset("assets/images/menu.png"),
        ),
        title: GestureDetector(
          onTap: () {
            pageController.jumpToPage(0);
          },
          child: TextField(
            onTap: () {
              pageController.jumpToPage(0);
            },
            onChanged: (text) {
              searchItems(text);
            },
            decoration: InputDecoration(
              suffixIcon: Icon(
                Icons.search,
                color: Colors.black,
                size: Dimensions.iconSize32,
              ),
              hintText: "Поиск события...",
              hintStyle: TextStyle(color: Color(0xFF424242).withOpacity(0.6)),
              fillColor: const Color(0xFFE1E3E4),
              filled: true,
              contentPadding: EdgeInsets.fromLTRB(Dimensions.width20,
                  Dimensions.height10, Dimensions.width20, Dimensions.height10),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(Dimensions.radius15),
                borderSide: const BorderSide(color: Colors.white),
              ),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(Dimensions.radius15),
                  borderSide: const BorderSide(color: Colors.white)),
            ),
          ),
        ),
        actions: [
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
                            color: Color(0xFF2F2E41),
                            borderRadius: BorderRadius.circular(20)),
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
          )
        ],
      ),
      drawer: Drawer(
        backgroundColor: const Color(0xFFF3F8F9),
        child: Stack(children: [
          Positioned(
              top: Dimensions.height120,
              child: Image.asset(
                "assets/images/drawer.png",
                color: Colors.white.withOpacity(0.18),
                colorBlendMode: BlendMode.modulate,
              )),
          Positioned(
              top: Dimensions.height100,
              child: Image.asset(
                "assets/images/drawer1.png",
                color: Colors.white.withOpacity(0.15),
                colorBlendMode: BlendMode.modulate,
              )),
          Container(
            decoration: const BoxDecoration(color: Colors.transparent),
            child: ListView(
              children: [
                DrawerHeader(
                  decoration: const BoxDecoration(color: Colors.transparent),
                  child: Container(
                      alignment: Alignment.topCenter,
                      child: Image.asset("assets/images/drawer3.png")),
                ),
                Container(
                  margin: EdgeInsets.only(
                      left: Dimensions.width30, right: Dimensions.width20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        horizontalTitleGap: 0,
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BigTextWidget(
                              text: "Афиша событий",
                              size: Dimensions.font16,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                            Divider(
                              thickness: 1,
                            )
                          ],
                        ),
                        contentPadding: EdgeInsets.zero,
                        onTap: () {
                          scaffoldKey.currentState!.closeDrawer();
                          pageController.jumpToPage(3);
                        },
                      ),
                      ListTile(
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BigTextWidget(
                              text: "Выставки",
                              size: Dimensions.font16,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                            Divider(
                              thickness: 1,
                            )
                          ],
                        ),
                        contentPadding: EdgeInsets.zero,
                        onTap: () {
                          scaffoldKey.currentState!.closeDrawer();
                          pageController.jumpToPage(4);
                        },
                      ),
                      ListTile(
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BigTextWidget(
                              text: "Коллекции",
                              size: Dimensions.font16,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                            Divider(
                              thickness: 1,
                            )
                          ],
                        ),
                        contentPadding: EdgeInsets.zero,
                        onTap: () {
                          scaffoldKey.currentState!.closeDrawer();
                          pageController.jumpToPage(5);
                        },
                      ),
                      ListTile(
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BigTextWidget(
                              text: "Сувениры",
                              size: Dimensions.font16,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                            Divider(
                              thickness: 1,
                            )
                          ],
                        ),
                        contentPadding: EdgeInsets.zero,
                        onTap: () {
                          scaffoldKey.currentState!.closeDrawer();
                          pageController.jumpToPage(6);
                        },
                      ),
                      ListTile(
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BigTextWidget(
                              text: "Новости ",
                              size: Dimensions.font16,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ],
                        ),
                        contentPadding: EdgeInsets.zero,
                        onTap: () {
                          scaffoldKey.currentState!.closeDrawer();
                          pageController.jumpToPage(7);
                        },
                      ),
                      SizedBox(
                        height: Dimensions.height20,
                      ),
                      InkWell(
                        onTap: () async {
                          showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              elevation: 0,
                              context: context,
                              builder: (BuildContext context) {
                                return Container(
                                  height: Dimensions.height600,
                                  padding: const EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(Dimensions.radius30),
                                        topRight: Radius.circular(Dimensions.radius30)),
                                  ),
                                  child: Column(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                        child: SizedBox(
                                          width: 30,
                                          child: Divider(
                                            thickness: 5,
                                            color: Color(0xFFB2B2B2),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      BigTextWidget(
                                        text: "Записаться на событие",
                                        size: 24,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFF120D26),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Form(
                                        child: Column(
                                          children: [
                                            TextField(
                                                controller: name,
                                                decoration: InputDecoration(
                                                    hintText: "Как вас зовут?",
                                                    hintStyle: TextStyle(
                                                        fontSize: 18,
                                                        color: Color(0xFF120D26),
                                                        fontWeight: FontWeight.w400)),
                                                keyboardType: TextInputType.text),
                                            TextField(
                                              controller: phone,
                                              decoration: InputDecoration(
                                                  hintText: "Контактный телефон",
                                                  hintStyle: TextStyle(
                                                      fontSize: 18,
                                                      color: Color(0xFF120D26),
                                                      fontWeight: FontWeight.w400)),
                                              keyboardType: TextInputType.phone,
                                            ),
                                            TextField(
                                              controller: email,
                                              decoration: InputDecoration(
                                                  hintText: "Контактный email",
                                                  hintStyle: TextStyle(
                                                      fontSize: 18,
                                                      color: Color(0xFF120D26),
                                                      fontWeight: FontWeight.w400)),
                                              keyboardType: TextInputType.emailAddress,
                                            ),
                                            TextField(
                                              controller: email,
                                              decoration: InputDecoration(
                                                  hintText: "Текст вопроса",
                                                  hintStyle: TextStyle(
                                                      fontSize: 18,
                                                      color: Color(0xFF120D26),
                                                      fontWeight: FontWeight.w400)),
                                              keyboardType: TextInputType.emailAddress,
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      InkWell(
                                        onTap: () async {
                                          // showLoaderDialog(context);
                                          // await sendMail();
                                          Navigator.of(context).pop();
                                          showModalBottomSheet(
                                              isScrollControlled: true,
                                              backgroundColor: Colors.transparent,
                                              elevation: 0,
                                              context: context,
                                              builder: (BuildContext context) {
                                                return Container(
                                                    alignment: Alignment.center,
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
                                                          text: "Написать нам",
                                                          size: 24,
                                                          fontWeight: FontWeight.w500,
                                                          color: Color(0xFF120D26),
                                                        ),
                                                        SizedBox(
                                                          height: Dimensions.height100,
                                                        ),
                                                        SizedBox(
                                                          width: 204,
                                                          child: Text(
                                                            "Спасибо. Мы получили Вашу заявку и очень скоро с Вами свяжемся",
                                                            style: TextStyle(
                                                              fontSize: Dimensions.font16,
                                                              fontWeight: FontWeight.w400,
                                                              color: const Color(0xFF120D26),
                                                            ),
                                                            textAlign: TextAlign.center,
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
                                            borderRadius: BorderRadius.circular(14),
                                            color: Color(0xFF2F3A4B),
                                          ),
                                          child: Center(
                                              child: BigTextWidget(
                                                text: "Заказать",
                                                size: 15,
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
                        child: Container(
                          width: Dimensions.width233,
                          height: Dimensions.height38,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(Dimensions.radius8),
                            image: const DecorationImage(
                                image: AssetImage("assets/images/drawer2.png"),
                                fit: BoxFit.cover),
                          ),
                          child: Center(
                            child: BigTextWidget(
                              text: "Написать нам",
                              color: Colors.white,
                              size: Dimensions.font15,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
              bottom: Dimensions.height10,
              left: Dimensions.width20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BigTextWidget(
                    text: "Политика конфеденциальности",
                    size: Dimensions.font12,
                    color: const Color(0xFF818284),
                    fontWeight: FontWeight.w400,
                  ),
                  BigTextWidget(
                    text: "BinaryDev App 2.1",
                    size: Dimensions.font12,
                    color: const Color(0xFF818284),
                    fontWeight: FontWeight.w400,
                  ),
                ],
              ))
        ]),
      ),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        children: [
          SearchPageBody(
            afisha: afisha,
            collection: collection,
            posters: posters,
          ),
          HomePageBody(),
          BasketPageBody(),
          PosterEvents(),
          ShowEvents(),
          CollectionsEvents(),
          SouvenirsEvents(),
          NewsEvents()
        ],
      ),
      bottomNavigationBar: SizedBox(
        height: 60,
        child: BottomNavigationBar(
          currentIndex: selectedPageIndex,
          onTap: (int index) {
            pageController.jumpToPage(index);
            setState(() {
              selectedPageIndex = index;
            });
          },
          backgroundColor: Colors.white,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: Colors.black,
          unselectedItemColor: const Color(0xFFA5A7B5),
          iconSize: Dimensions.iconSize30,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined),
              label: 'Shop',
            ),
          ],
        ),
      ),
    );
  }

  searchItems(String text) {
    if (text == '') {
      afisha = [];
      collection = [];
      posters = [];
      souveners = [];
      setState(() {});

      return;
    }
    afisha = [];
    collection = [];
    posters = [];
    souveners = [];
    for (var element in afishaController.afishaList) {
      if (decodeToLatin(element.name ?? '')
          .toLowerCase()
          .contains(text.toLowerCase())) {
        afisha.add(element);
      }
    }
    for (var element in collectionController.collectionItems!) {
      if (decodeToLatin(element.name ?? '')
          .toLowerCase()
          .contains(text.toLowerCase())) {
        collection.add(element);
      }
    }
    for (var element in exhibitionsController.exhibitions!) {
      if (element.name!.toLowerCase().contains(text.toLowerCase())) {
        posters.add(element);
      }
    }
    setState(() {});
  }
}
