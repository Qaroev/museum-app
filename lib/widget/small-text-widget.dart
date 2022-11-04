import 'package:flutter/cupertino.dart';
import 'package:museum_resource_center/utils/app_colors.dart';

class SmallTextWidget extends StatelessWidget {
  final String text;
  TextOverflow? overflow;
  Color? color;
  double size;
  SmallTextWidget({
    Key? key, required this.text,
    this.color = AppColors.textSmallColor,
    this.size = 0,
    this.overflow = TextOverflow.ellipsis,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overflow,
      style: TextStyle(
        color: color,
        fontSize: size==0?12:size,
      ),
    );
  }
}
