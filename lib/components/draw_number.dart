import 'package:flutter/material.dart';

class DrawNumber extends StatelessWidget {
  const DrawNumber({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          const BoxDecoration(color: Colors.green, shape: BoxShape.circle),
      child: const Padding(
        padding: EdgeInsets.all(14.0),
        child: Text('1'),
      ),
    );
  }

  // Widget buildDrawItem() {}
}
