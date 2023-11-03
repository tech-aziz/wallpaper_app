import 'package:flutter/material.dart';
import 'package:wallpaper_app/views/utils/styles.dart';

import '../utils/config.dart';

class AlbumsScreen extends StatefulWidget {
  const AlbumsScreen({super.key});

  @override
  State<AlbumsScreen> createState() => _AlbumsScreenState();
}

class _AlbumsScreenState extends State<AlbumsScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
          elevation: 0,
          titleSpacing: 0,
          title:  Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Text('Albums',style: Style.globalTextStyle(
                fontSize:
                AppConfig.mediumTextSize,
                fontWeight: FontWeight.w900,
                shadows: [
                  Shadow(
                      color: Colors.black
                          .withOpacity(0.7),
                      offset:
                      const Offset(5, 7),
                      blurRadius: 1)
                ],
                color: Colors.white,
                fontStyle: FontStyle.italic,
                textStyle: Theme.of(context)
                    .textTheme
                    .displayLarge,
                letterSpacing: 3)),
          ),
        backgroundColor: Colors.black.withOpacity(0.5),
      ),
      body: const Center(
        child: Text('Album',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25)),
      ),
    );
  }
}
