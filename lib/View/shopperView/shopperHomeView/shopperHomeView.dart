import 'package:flutter/material.dart';

class Shopperhomeview extends StatefulWidget {
  const Shopperhomeview({super.key});

  @override
  State<Shopperhomeview> createState() => _ShopperhomeviewState();
}

class _ShopperhomeviewState extends State<Shopperhomeview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Shopper Home View"),
      ),
    );
  }
}
