import 'package:flutter/material.dart';

import 'dart:math';

class Mytitle3 extends StatelessWidget {
  final double height;
  final double width;
  const Mytitle3({
    super.key,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    Mytitle3? A;
    Random random = Random();

    if (this.height - 20 > 20) {
      //符合條件就設定 A ，否則保持 NULL
      A = Mytitle3(height: this.height - 20, width: width - 20);
    }

    return Container(
      height: this.height,
      width: this.width,
      color: Color.fromARGB(
        255, //透明度設定 255 為不透明
        random.nextInt(255), // 紅色  0~254隨機整數
        random.nextInt(255), // 綠色
        random.nextInt(255), // 藍色
      ),
      child: Center(
        child: (!(A is Null))
            ? A //不是空的，就照 A 設定
            : Container(
                //是空的就這樣設定
                height: 10,
                width: 10,
                color: Colors.amber,
              ),
      ),
    );
  }
}
