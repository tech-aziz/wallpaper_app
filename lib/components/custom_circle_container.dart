import 'package:flutter/material.dart';

class CustomCircleContainer extends StatelessWidget {
  final bool? isPadding;
  final IconData icon;
  Color ? color;
  CustomCircleContainer({super.key, this.isPadding, required this.icon, this.color});

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
        child: Center(child: Icon(icon,)),
      ),
    );
  }
}
