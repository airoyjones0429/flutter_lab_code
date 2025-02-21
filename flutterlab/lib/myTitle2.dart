import 'package:flutter/material.dart';
import 'dart:math';

// ignore: must_be_immutable
class Mytitle2 extends StatelessWidget {
  final double height;
  final double width;
  Widget? child;
  Mytitle2({
    super.key,
    required this.height,
    required this.width,
    this.child,
  });

  Random random = Random();
  List<Color> lsC = [
    Color(0xFFFF0000),
    Color(0xFF00FF00),
    Color(0xFF0000FF),
    Color(0xFFFFF000),
    Color(0xFF00FFF0),
    Color(0xFFFFFFFF),
  ];

  @override
  Widget build(BuildContext context) {
    ///遞迴開始與結束的判斷式
    if ((this.height - 20 > 20)) {
      //遞迴開始
      this.child = Mytitle2(height: this.height - 20, width: this.width - 20);
    } else {
      //遞迴結束
      this.child = Container(
        height: 10,
        width: 10,
        color: Colors.red,
      );
    }

    ///建立 UI
    return Container(
      height: this.height,
      width: this.width,
      color: lsC[random.nextInt(6)],
      child: Center(
        child: this.child,
      ),
    );
  }
}
