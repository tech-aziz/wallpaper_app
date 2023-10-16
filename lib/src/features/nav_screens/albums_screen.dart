import 'package:flutter/material.dart';
import 'package:galleryapp/src/utils/utils.dart';
import 'package:google_fonts/google_fonts.dart';
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
            child: Text('Albums',style: GoogleFonts.lato(
              textStyle: Theme.of(context).textTheme.displayLarge,
              fontSize: Utils.mediumTextSize,
              color: Colors.white,
              fontWeight: FontWeight.w900,
              fontStyle: FontStyle.italic,
            )),
          ),
        backgroundColor: Colors.black.withOpacity(0.5),
      ),
      body: const Center(
        child: Text('Album',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25)),
      ),
    );
  }
}
