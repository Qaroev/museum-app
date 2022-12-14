import 'package:flutter/material.dart';
import 'package:museum_resource_center/views/home/page/poster_page_body.dart';
import 'package:museum_resource_center/views/home/page/show_page-body.dart';
import 'package:museum_resource_center/views/home/page/souvenirs_page_body.dart';

import '../../../utils/dimensions.dart';
import '../../../widget/app_Icon.dart';
import '../../../widget/big-text-widget.dart';
import 'collections_page_body.dart';
import 'home-page.dart';

class HomePageBody extends StatefulWidget {
  const HomePageBody({Key? key}) : super(key: key);

  @override
  _HomePageBodyState createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BigTextWidget(
                    text: "Новинки афиши",
                    size: Dimensions.font20,
                    fontWeight: FontWeight.w800,
                  ),
                  GestureDetector(
                    onTap: (){
                        pageController.jumpToPage(3);
                    },
                    child: AppIcon(
                      icon: Icons.arrow_forward,
                      size: Dimensions.font32,
                      backgroundColor: const Color(0xFFE1E3E4),
                      iconSize: Dimensions.iconSize25,
                    ),
                  )
                ],
              ),
              SizedBox(height: Dimensions.height20,),
              const PosterPageBody(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BigTextWidget(
                    text: "Коллекции",
                    size: Dimensions.font20,
                    fontWeight: FontWeight.w800,
                  ),
                  GestureDetector(
                    onTap: (){
                      pageController.jumpToPage(5);
                    },
                    child: AppIcon(
                      icon: Icons.arrow_forward,
                      size: Dimensions.font32,
                      backgroundColor: const Color(0xFFE1E3E4),
                      iconSize: Dimensions.iconSize25,
                    ),
                  )
                ],
              ),
              SizedBox(height: Dimensions.height20,),
               CollectionPageBody(),
              SizedBox(height: Dimensions.height20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BigTextWidget(
                    text: "Выставки",
                    size: Dimensions.font20,
                    fontWeight: FontWeight.w800,
                  ),
                  InkWell(
                    onTap: (){
                      pageController.jumpToPage(4);
                    },
                    child: AppIcon(
                      icon: Icons.arrow_forward,
                      size: Dimensions.font32,
                      backgroundColor: const Color(0xFFE1E3E4),
                      iconSize: Dimensions.iconSize25,

                    ),
                  )
                ],
              ),
              SizedBox(height: 10,),
              const ShowPageBody(),
              SizedBox(height: Dimensions.height20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BigTextWidget(
                    text: "Сувениры в музее",
                    size: Dimensions.font20,
                    fontWeight: FontWeight.w800,
                  ),
                  GestureDetector(
                    onTap: (){
                      pageController.jumpToPage(6);
                    },
                    child: AppIcon(
                      icon: Icons.arrow_forward,
                      size: Dimensions.font32,
                      backgroundColor: const Color(0xFFE1E3E4),
                      iconSize: Dimensions.iconSize25,
                    ),
                  )
                ],
              ),
              SizedBox(height: Dimensions.height20,),
              const SouvenirsPageBody(),
            ],
          ),
        ),
      ],
    );
  }
}
