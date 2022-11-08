import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/dimensions.dart';
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
      height: Dimensions.height220,
      child: Stack(
        //alignment: AlignmentDirectional.bottomCenter,
        children: [
          GestureDetector(
            child: Container(
              width: Dimensions.width172,
              height: Dimensions.height208,
              alignment: Alignment.topRight,
              margin: EdgeInsets.only(right: Dimensions.width10),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius10),
                  image: const DecorationImage(
                      image: AssetImage(
                        'assets/images/image1-home.png',
                      ),
                      fit: BoxFit.cover)
              ),
              child: SmallTextWidget(text: "Постоянные", size: Dimensions.font11, color: Colors.white.withOpacity(0.8)),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Dimensions.height55,
              width: Dimensions.width172,
              margin: EdgeInsets.only(
                right: Dimensions.width10,
              ),
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.radius10),
                    topRight: Radius.circular(Dimensions.radius10),
                    bottomRight: Radius.circular(Dimensions.radius10),
                    bottomLeft: Radius.circular(Dimensions.radius10)),
                color: Colors.white,
              ),
              child: Center(
                child: BigTextWidget(
                  text: "«Отечественная война 1812 года»",
                  size: Dimensions.font12 , color: Colors.black,
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
