import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:museum_resource_center/news/news_events_output.dart';
import 'package:museum_resource_center/utils/dimensions.dart';

import '../widget/big-text-widget.dart';

class NewsEvents extends StatefulWidget {
  const NewsEvents({Key? key}) : super(key: key);

  @override
  _NewsEventsState createState() => _NewsEventsState();
}

class _NewsEventsState extends State<NewsEvents> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BigTextWidget(
                text: "Новости музея",
                size: Dimensions.font20,
                fontWeight: FontWeight.w800,
              ),
              SizedBox(height: Dimensions.height20,),
              ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => NewsEventsOutput()));
                      },
                      child: Container(
                        width: Dimensions.width380,
                        height: Dimensions.height106,
                        margin: EdgeInsets.only(bottom: Dimensions.height10),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(Dimensions.radius15)
                        ),
                        child: Stack(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Stack(
                                    children: [
                                      Container(
                                        width: Dimensions.width73,
                                        height: Dimensions.height96,
                                        decoration: BoxDecoration(
                                            color: Color(0xFFBEBEBE),
                                            borderRadius: BorderRadius.circular(Dimensions.radius15)
                                        ),
                                      ),
                                      Positioned(
                                        right: 3,
                                        top: 1,
                                        bottom: 0,
                                        left: 0,
                                        child: Container(
                                          width: Dimensions.width73,
                                          height: Dimensions.height96,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(Dimensions.radius15),
                                              image: const DecorationImage(
                                                  image: AssetImage("assets/images/image3-home.png"),
                                                  fit: BoxFit.cover
                                              )
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                   SizedBox(width: Dimensions.width30,),
                                  Container(
                                    alignment: Alignment.center,
                                    width: Dimensions.width220,
                                    height: Dimensions.height80,
                                    child: BigTextWidget(
                                      text: "«Определены победители первого этапа конкурса «Красота Божьего мира»»",
                                      size: Dimensions.font14,
                                      color: const Color(0xFF120D26),
                                      fontWeight: FontWeight.w400,),
                                  ),
                                ],
                              ),
                            ]
                        ),
                      ),
                    );
                  }),
            ],
          ),
        ),
      ],
    );
  }
}
