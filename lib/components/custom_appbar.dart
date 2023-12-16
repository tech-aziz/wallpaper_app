import 'package:flutter/material.dart';
import 'package:wallpaper_app/views/utils/styles.dart';
import '../views/utils/config.dart';

PreferredSizeWidget customAppBar({
  required String title,
  required BuildContext context,
  List<Widget>? action,
}) {
  return AppBar(
    automaticallyImplyLeading: false,
    titleSpacing: 0,
    elevation: 0,
    title: Padding(
      padding: const EdgeInsets.only(left: 8),
      child: Text(title, style: Style.globalTextStyle(
          fontSize:
          AppConfig.extraLargeTextSize,
          fontWeight: FontWeight.w900,
          shadows: [
          ],
          color: Colors.black.withOpacity(0.7),
          fontStyle: FontStyle.italic,
          textStyle: Theme.of(context)
              .textTheme
              .displayLarge,
          letterSpacing: 3)),
    ),
    actions: action,
  );
}
