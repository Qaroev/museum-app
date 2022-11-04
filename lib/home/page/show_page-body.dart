import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widget/big-text-widget.dart';
import '../../widget/small-text-widget.dart';

class ShowPageBody extends StatefulWidget {
  const ShowPageBody({Key? key}) : super(key: key);

  @override
  _ShowPageBodyState createState() => _ShowPageBodyState();
}

class _ShowPageBodyState extends State<ShowPageBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(children: List.generate(5, (index) => _buildShowItem())),
    );
  }
  Widget _buildShowItem(){
    return Container(
      height: 220,
      child: Stack(
        //alignment: AlignmentDirectional.bottomCenter,
        children: [
          GestureDetector(
            child: Container(
              width: 172,
              height: 208,
              alignment: Alignment.topRight,
              margin: EdgeInsets.only(right: 10),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: AssetImage(
                        'assets/images/image1-home.png',
                      ),
                      fit: BoxFit.cover)
              ),
              child: SmallTextWidget(text: "Постоянные", size: 11, color: Colors.white.withOpacity(0.8)),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 55,
              width: 172,
              margin: EdgeInsets.only(
                right: 10,
              ),
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10)),
                color: Colors.white,
              ),
              child: Center(
                child: BigTextWidget(
                  text: "«Отечественная война 1812 года»",
                  size: 12 , color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
              )
            ),
          )
        ],
      ),
    );
  }
}
