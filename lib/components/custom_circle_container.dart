import 'package:flutter/material.dart';

class CustomCircleContainer extends StatelessWidget {
  final bool? isPadding;
  final IconData icon;
  const CustomCircleContainer({super.key, this.isPadding, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      // padding: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
          color: Colors.black.withOpacity(.2),
          border: Border.all(color: Colors.white.withOpacity(.15), width: 2),
          shape: BoxShape.circle),
      child: Padding(
        padding: EdgeInsets.all(isPadding == true ? 12 : 0),
        child: Center(child: Icon(icon,)),
      ),
    );
  }
}
