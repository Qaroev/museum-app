import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BigTextWidget(
                text: "Новости музея",
                size: 20,
                fontWeight: FontWeight.w800,
              ),
              SizedBox(
                height: 20,
              ),
              ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      child: Container(
                        width: 380,
                        height: 106,
                        margin: EdgeInsets.only(bottom: 10),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15)
                        ),
                        child: Stack(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Stack(
                                    children: [
                                      Container(
                                        width: 73,
                                        height: 96,
                                        decoration: BoxDecoration(
                                            color: Color(0xFFBEBEBE),
                                            borderRadius: BorderRadius.circular(15)
                                        ),
                                      ),
                                      Positioned(
                                        right: 3,
                                        top: 1,
                                        bottom: 0,
                                        left: 0,
                                        child: Container(
                                          width: 73,
                                          height: 96,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(15),
                                              image: DecorationImage(
                                                  image: AssetImage("assets/images/image3-home.png"),
                                                  fit: BoxFit.cover
                                              )
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(width: 40,),
                                  Container(
                                    alignment: Alignment.center,
                                    width: 200,
                                    height: 80,
                                    child: BigTextWidget(
                                      text: "«Определены победители первого этапа конкурса «Красота Божьего мира»»",
                                      size: 16,
                                      color: Color(0xFF120D26),
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
