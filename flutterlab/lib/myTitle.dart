import 'package:flutter/material.dart';

class Mytitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      color: Colors.black,
      child: Center(
        child: Container(
          height: 1,
          width: 1,
          color: Colors.red,
        ),
      ),
    );
  }
}
