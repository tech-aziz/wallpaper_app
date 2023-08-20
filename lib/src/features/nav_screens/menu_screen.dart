import 'package:flutter/material.dart';
class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Menu Screen'),
        backgroundColor: Colors.green.withOpacity(0.5),
        centerTitle: true,
      ),
      body: const Center(
        child: Text('Menu',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25)),
      ),
    );
  }
}