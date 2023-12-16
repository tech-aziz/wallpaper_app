import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomCircleContainer extends StatelessWidget {
  final bool? isPadding;
  final IconData? icon;
  final String? imageIcon;
  final bool? isRed;
  Color? color;

  CustomCircleContainer(
      {super.key,
      this.isPadding,
      this.icon,
      this.color,
      this.imageIcon,
      this.isRed});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      // padding: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
          color: color,
          border: Border.all(color: Colors.red.withOpacity(.5), width: 1),
          shape: BoxShape.circle),
      child: Padding(
        padding: EdgeInsets.all(isPadding == true ? 12 : 0),
        child: Center(
            child: imageIcon != null
                ? Image.asset(
                    imageIcon!,
                    color: isRed == true ? null : Colors.white,
                  )
                : Icon(
                    icon,
                    color: Get.isDarkMode ? Colors.white : Colors.white,
                  )),
      ),
    );
  }
}
