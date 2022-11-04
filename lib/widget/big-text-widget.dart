import 'package:flutter/cupertino.dart';
import 'package:museum_resource_center/utils/app_colors.dart';

class BigTextWidget extends StatelessWidget {
  Color? color;
  final String text;
  FontWeight? fontWeight;
  TextAlign? textAlign;
  double size;
  double? height;

  BigTextWidget(
      {Key? key,
      required this.text,
      this.color = AppColors.textBigColor,
      this.fontWeight = FontWeight.normal,
      this.textAlign = TextAlign.start,
      this.size = 0,
        this.height = 1.2
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
          fontFamily: 'Roboto',
          color: color,
          fontSize: size == 0 ? 20 : size,
          fontWeight: fontWeight,
          height: height
      ),
    );
  }
}
