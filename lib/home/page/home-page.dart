import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:museum_resource_center/home/page/poster_page_body.dart';
import 'package:museum_resource_center/home/page/show_page-body.dart';
import 'package:museum_resource_center/home/page/souvenirs_page_body.dart';
import 'package:museum_resource_center/utils/app_colors.dart';
import 'package:museum_resource_center/widget/app_Icon.dart';
import 'package:museum_resource_center/widget/big-text-widget.dart';
import 'package:museum_resource_center/widget/small-text-widget.dart';

import '../../collections/collections_events.dart';
import '../../news/news_events.dart';
import '../../poster/poster_events.dart';
import '../../show/show_events.dart';
import '../../souvenirs/souvenirs_events.dart';
import '../../utils/dimensions.dart';
import '../basket_page/basket_page_body.dart';
import '../searsh/search_page_body.dart';
import 'collections-page-body.dart';
import 'home_page_body.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController pageController =  PageController(initialPage: 1);
  var _selectedPageIndex = 1;

  // @override
  // void dispose() {
  //   pageController.dispose();
  //   super.dispose();
  // }
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
    return Scaffold(
      key:_scaffoldKey,
      backgroundColor: Color(0xFFF3F8F9),
      appBar: AppBar(
        titleSpacing: 0,
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            if(_scaffoldKey.currentState!.isDrawerOpen){
              _scaffoldKey.currentState!.openEndDrawer();
            }else{
              _scaffoldKey.currentState!.openDrawer();
            }
          },
          icon: Image.asset("assets/images/menu.png"),
        ),
        title: TextField(
          decoration: InputDecoration(
            suffixIcon: Icon(
              Icons.search,
              color: Colors.black,
              size: Dimensions.iconSize32,
            ),
            hintText: "Поиск события...",
            hintStyle: TextStyle(color: Color(0xFF424242).withOpacity(0.6)),
            fillColor: Color(0xFFE1E3E4),
            filled: true,
            contentPadding: EdgeInsets.fromLTRB(
                Dimensions.width20, Dimensions.height10, Dimensions.width20, Dimensions.height10),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Dimensions.radius15),
              borderSide: BorderSide(color: Colors.white),
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(Dimensions.radius15),
                borderSide: BorderSide(color: Colors.white)),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.shopping_cart_outlined,
              color: Colors.black,
            ),
          )
        ],
      ),
      drawer: Drawer(
        //elevation: 0,
        backgroundColor: Color(0xFFF3F8F9),
        width: Dimensions.width303,
        child: Stack(
          children: [
            Positioned(
              top: Dimensions.height120,
                child: Image.asset("assets/images/drawer.png", color: Colors.white.withOpacity(0.18), colorBlendMode: BlendMode.modulate,)
            ),
            Positioned(
              top: Dimensions.height100,
                child: Image.asset("assets/images/drawer1.png", color: Colors.white.withOpacity(0.15), colorBlendMode: BlendMode.modulate,)
            ),
            Container(
            decoration:BoxDecoration(
                color: Colors.transparent
            ) ,
      child: ListView(
              children: [
                DrawerHeader(
            decoration: BoxDecoration(
                    color: Colors.transparent
                  ),
                  child: Container(
                    alignment: Alignment.topCenter,
                    child: Image.asset("assets/images/drawer3.png")
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: Dimensions.width30, right: Dimensions.width20),
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
                            Divider(thickness: 1,)
                          ],
                        ),
                        contentPadding: EdgeInsets.zero,
                        onTap: (){
                          _scaffoldKey.currentState!.closeDrawer();
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
                            Divider(thickness: 1,)
                          ],
                        ),
                        contentPadding: EdgeInsets.zero,
                        onTap: (){
                          _scaffoldKey.currentState!.closeDrawer();
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
                            Divider(thickness: 1,)
                          ],
                        ),
                        contentPadding: EdgeInsets.zero,
                        onTap: (){
                          _scaffoldKey.currentState!.closeDrawer();
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
                            Divider(thickness: 1,)
                          ],
                        ),
                        contentPadding: EdgeInsets.zero,
                        onTap: (){
                          _scaffoldKey.currentState!.closeDrawer();
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
                        onTap: (){
                          _scaffoldKey.currentState!.closeDrawer();
                          pageController.jumpToPage(7);
                        },
                      ),
                      SizedBox(height: Dimensions.height20,),
                      Container(
                        width: Dimensions.width233,
                        height: Dimensions.height38,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(Dimensions.radius8),
                          image: const DecorationImage(
                            image: AssetImage("assets/images/drawer2.png"),
                            fit: BoxFit.cover
                          ),
                        ),
                        child: Center(
                          child: BigTextWidget(
                            text: "Написать нам",
                            color: Colors.white,
                            size: Dimensions.font15,
                            fontWeight: FontWeight.w700,
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
                )
            )
          ]
        ),
      ),
      body:  PageView(
        //physics: NeverScrollableScrollPhysics(),
        controller: pageController,
        scrollDirection: Axis.horizontal,
          allowImplicitScrolling: true,
        children: [
          SearchPageBody(),
          HomePageBody(),
          BasketPageBody(),
          PosterEvents(),
          ShowEvents(),
          CollectionsEvents(),
          SouvenirsEvents(),
          NewsEvents()
        ],
        onPageChanged: (index){
          _selectedPageIndex = index;
        },
      ),
      bottomNavigationBar: SizedBox(
        height: Dimensions.height92,
        child: BottomNavigationBar(
          currentIndex: _selectedPageIndex,
          onTap: (int index){
              pageController.jumpToPage(index);
          },
          backgroundColor: Colors.white,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: Colors.black,
          unselectedItemColor: const Color(0xFFA5A7B5),
          iconSize: Dimensions.iconSize30,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon:   Icon(Icons.search),
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

}


