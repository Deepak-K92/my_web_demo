import 'package:flutter/material.dart';
import 'package:my_web_demo/common/styles/app_colors.dart';

class IconLogoWidget extends StatelessWidget {
  final double? size;
  const IconLogoWidget({Key? key, this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size != null ? (size! / 2) : 100),
        boxShadow: const [
          BoxShadow(
              color: Colors.black12,
              spreadRadius: 2.0,
              blurStyle: BlurStyle.outer),
        ],
      ),
      child: CircleAvatar(
        minRadius: size,
        backgroundColor: AppColors.kPrimaryColor,
        child: Padding(
          padding: const EdgeInsets.all(1),
          child: Icon(
            Icons.ac_unit_sharp,
            color: Colors.black,
            size: size != null ? size! - 5 : 30,
          ),
        ),
      ),
    );
  }
}
