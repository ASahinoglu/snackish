import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Screen (TODO)')),
      body: const Center(child: Text('Dies ist der Home Screen.')),
    );
  }
}
