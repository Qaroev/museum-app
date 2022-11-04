import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:museum_resource_center/widget/small-text-widget.dart';

import '../widget/app_Icon.dart';
import '../widget/big-text-widget.dart';

class SouvenirsEvents extends StatefulWidget {
  const SouvenirsEvents({Key? key}) : super(key: key);

  @override
  _SouvenirsEventsState createState() => _SouvenirsEventsState();
}

class _SouvenirsEventsState extends State<SouvenirsEvents> {
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
                text: "Каталог сувениров Музея",
                size: 20,
                fontWeight: FontWeight.w800,
              ),
              SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    7,
                        (index) => Container(
                      margin: EdgeInsets.only(right: 20),
                      child: ElevatedButton(
                        child: Text(
                          "Выставка",
                          style: TextStyle(color: Color(0xFF434670)),
                        ),
                        onPressed: () => print("it's pressed"),
                        style: ElevatedButton.styleFrom(
                          elevation: 1,
                          primary: Color(0xFFF3F8F9),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0),
                              side: BorderSide(
                                  color: Color(0xFF12153D).withOpacity(0.5))),
                        ),
                      ),
                    ),
                  ),
                ),
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
                              SizedBox(width: 40,),
                              Container(
                                width: 180,
                                height: 80,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    BigTextWidget(text: "Колокольчики", size: 13, color: Color(0xFF747688), fontWeight: FontWeight.w400,),
                                    BigTextWidget(text: "Настенные часы в технике Фьюзинг", size: 16, fontWeight: FontWeight.w400,),
                                    BigTextWidget(text: "2500 руб.", size: 16, fontWeight: FontWeight.w600,),
                                  ],
                                ),
                              ),
                            ],
                          ),
                            Container(
                              alignment: Alignment.topRight,
                                margin: EdgeInsets.only(right: 10,top: 10),
                                child: Icon(Icons.shopping_cart_outlined)
                            )
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
