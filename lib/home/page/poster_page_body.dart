import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:museum_resource_center/utils/dimensions.dart';

import '../../utils/app_colors.dart';
import '../../widget/big-text-widget.dart';
import '../../widget/small-text-widget.dart';

class PosterPageBody extends StatefulWidget {
  const PosterPageBody({Key? key}) : super(key: key);

  @override
  _PosterPageBodyState createState() => _PosterPageBodyState();
}

class _PosterPageBodyState extends State<PosterPageBody> {
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(children: List.generate(5, (index) => _buildPostItem())),
    );
  }

  Widget _buildPostItem() {
    return Container(
      height: 220,
      child: Stack(
        //alignment: AlignmentDirectional.bottomCenter,
        children: [
          GestureDetector(
            child: Container(
              width: 172,
              height: 208,
              alignment: Alignment.topLeft,
              margin:  EdgeInsets.only(right: Dimensions.width10),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                      image: AssetImage(
                        'assets/images/image1-home.png',
                      ),
                      fit: BoxFit.cover)
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 80,
                    height: 50,
                    child:SmallTextWidget(
                      text: "Пушкинская карта",
                      size: 11,
                      color: Colors.white.withOpacity(0.8),
                      overflow: TextOverflow.clip,
                    ),
                  ),
                  SmallTextWidget(text: "Вставка", size: 11, color: Colors.white.withOpacity(0.8)),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 75,
              width: 172,
              margin: EdgeInsets.only(
                right: 10,
              ),
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10)),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BigTextWidget(text: "c 17 апреля по 21 мая", size: 12 , color: AppColors.textBigColor, fontWeight: FontWeight.w300,),
                  Spacer(),
                  BigTextWidget(
                    text: "«Цикл лекций по изобразительному искусству «Идем в музей»",
                    size: 12 , color: Colors.black,
                    fontWeight: FontWeight.w400,
                  ),
                  Spacer()
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}