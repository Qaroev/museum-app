import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/dimensions.dart';
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
      width: Dimensions.width327,
      height: Dimensions.height132,
      padding: const EdgeInsets.all(10),
      margin: EdgeInsets.only(right: Dimensions.width10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.radius10),
          color: Colors.white,
          boxShadow:const [
            BoxShadow(
                color: Color(0xFFEFF6F6),
                blurRadius: 20.0,
                spreadRadius: 10.0,
                offset: Offset(10, 20)),
          ]
      ),
      child: Row(
        children: [
          Image.asset("assets/images/image3-home.png"),
          SizedBox(width: Dimensions.width10,),
          SizedBox(
            width: Dimensions.width176,
            height: Dimensions.height80,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BigTextWidget(
                  text: "Колокольчики",
                  size: Dimensions.font13,
                  color: const Color(0xFF747688),
                ),
                BigTextWidget(
                  text: "Настенные часы в технике Фьюзинг",
                  size: Dimensions.font16,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
                BigTextWidget(
                  text: "2500 руб",
                  size: Dimensions.font14,
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