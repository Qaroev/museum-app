import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widget/big-text-widget.dart';

class SouvenirsPageBody extends StatefulWidget {
  const SouvenirsPageBody({Key? key}) : super(key: key);

  @override
  _SouvenirsPageBodyState createState() => _SouvenirsPageBodyState();
}

class _SouvenirsPageBodyState extends State<SouvenirsPageBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(children: List.generate(5, (index) => _buildSouvenirsItem())),
    );

  }
  Widget _buildSouvenirsItem(){
    return Container(
      width: 327,
      height: 132,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow:[
            BoxShadow(
                color: Color(0xFFEFF6F6),
                blurRadius: 20.0,
                spreadRadius: 10.0,
                offset: Offset(10, 20)),
          ]
      ),
      child: Row(
        children: [
          Container(child: Image.asset("assets/images/image3-home.png")),
          SizedBox(width: 10,),
          Container(
            width: 176,
            height: 80,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BigTextWidget(
                  text: "Колокольчики",
                  size: 13,
                  color: Color(0xFF747688),
                ),
                BigTextWidget(
                  text: "Настенные часы в технике Фьюзинг",
                  size: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
                BigTextWidget(
                  text: "2500 руб",
                  size: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}