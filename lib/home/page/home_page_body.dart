import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:museum_resource_center/home/page/poster_page_body.dart';
import 'package:museum_resource_center/home/page/show_page-body.dart';
import 'package:museum_resource_center/home/page/souvenirs_page_body.dart';
import 'package:museum_resource_center/utils/dimensions.dart';

import '../../widget/app_Icon.dart';
import '../../widget/big-text-widget.dart';
import 'collections-page-body.dart';

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
              SizedBox(height: Dimensions.height20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BigTextWidget(
                    text: "Коллекции",
                    size: Dimensions.font20,
                    fontWeight: FontWeight.w800,
                  ),
                  AppIcon(
                    icon: Icons.arrow_forward,
                    size: Dimensions.font32,
                    backgroundColor: const Color(0xFFE1E3E4),
                    iconSize: Dimensions.iconSize25,
                  )
                ],
              ),
              SizedBox(height: Dimensions.height20,),
              const CollectionPageBody(),
              SizedBox(height: Dimensions.height20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BigTextWidget(
                    text: "Вставки",
                    size: Dimensions.font20,
                    fontWeight: FontWeight.w800,
                  ),
                  AppIcon(
                    icon: Icons.arrow_forward,
                    size: Dimensions.font32,
                    backgroundColor: const Color(0xFFE1E3E4),
                    iconSize: Dimensions.iconSize25,
                  )
                ],
              ),
              SizedBox(height: Dimensions.height20,),
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
                  AppIcon(
                    icon: Icons.arrow_forward,
                    size: Dimensions.font32,
                    backgroundColor: const Color(0xFFE1E3E4),
                    iconSize: Dimensions.iconSize25,
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
