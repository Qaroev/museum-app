import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:museum_resource_center/souvenirs/souvenirs_events_output.dart';
import 'package:museum_resource_center/widget/small-text-widget.dart';

import '../utils/dimensions.dart';
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
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BigTextWidget(
                text: "Каталог сувениров Музея",
                size: Dimensions.font20,
                fontWeight: FontWeight.w800,
              ),
              SizedBox(
                height: Dimensions.height20,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    7,
                        (index) => Container(
                      margin: EdgeInsets.only(right: Dimensions.width20),
                      child: ElevatedButton(
                        child: Text(
                          "Выставка",
                          style: TextStyle(color: Color(0xFF434670)),
                        ),
                        onPressed: (){},
                        style: ElevatedButton.styleFrom(
                          elevation: 1,
                          primary: const Color(0xFFF3F8F9),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(Dimensions.radius50),
                              side: BorderSide(
                                  color: const Color(0xFF12153D).withOpacity(0.5))),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: Dimensions.height20,
              ),
              ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SouvenirsEventsOutput()));
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
                                      color: const Color(0xFFBEBEBE),
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
                              SizedBox(width: Dimensions.width40,),
                              SizedBox(
                                width: Dimensions.width180,
                                height: Dimensions.height80,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    BigTextWidget(text: "Колокольчики", size: Dimensions.font13, color: const Color(0xFF747688), fontWeight: FontWeight.w400,),
                                    BigTextWidget(text: "Настенные часы в технике Фьюзинг", size: Dimensions.font16, fontWeight: FontWeight.w400,),
                                    BigTextWidget(text: "2500 руб.", size: Dimensions.font16, fontWeight: FontWeight.w600,),
                                  ],
                                ),
                              ),
                            ],
                          ),
                            Container(
                              alignment: Alignment.topRight,
                                margin: EdgeInsets.only(right: Dimensions.width10,top: Dimensions.height10),
                                child: const Icon(Icons.shopping_cart_outlined)
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
