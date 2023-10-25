import 'package:flutter/material.dart';
import 'package:wallpaper_app/views/utils/styles.dart';

PreferredSizeWidget customAppBar({
  required String title,
  required BuildContext context,
  List<Widget>? action,
}) {
  return AppBar(
    automaticallyImplyLeading: false,
    backgroundColor: Colors.black.withOpacity(0.5),
    titleSpacing: 0,
    elevation: 0,
    title: Padding(
      padding: const EdgeInsets.only(left: 8),
      child: Text(title, style: Style.bottomNavBarTextStyle(context)),
    ),
    actions: action,
  );
}
