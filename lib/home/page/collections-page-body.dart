import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:museum_resource_center/utils/dimensions.dart';

import '../../widget/big-text-widget.dart';

class CollectionPageBody extends StatelessWidget {
  const CollectionPageBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(5, (index) =>
            Container(
              alignment: Alignment.bottomRight,
              width: Dimensions.width152,
              height: Dimensions.height158,
              margin: EdgeInsets.only(right: Dimensions.width10),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius10),
                  image: const DecorationImage(
                      image: AssetImage("assets/images/image2-home.png")
                  )
              ),
              child: BigTextWidget(
                text: "Вешевая коллекция и этнография",
                size: Dimensions.font13,
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            )
        ),
      ),
    );
  }
}