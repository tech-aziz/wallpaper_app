import 'package:flutter/material.dart';
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
        title: const Text('Album Screen'),
        backgroundColor: Colors.green.withOpacity(0.5),
        centerTitle: true,
      ),
      body: const Center(
        child: Text('Album',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25)),
      ),
    );
  }
}
