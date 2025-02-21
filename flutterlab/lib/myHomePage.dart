import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  final String title;
  final String name;

  final Function onBackPress;
  final Function onNextPress;

  const MyHomePage({
    super.key,
    required this.title,
    required this.name,
    required this.onBackPress(),
    required this.onNextPress(),
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return Container(
        height: constraints.maxHeight,
        width: constraints.maxWidth,
        color: Colors.black,
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: constraints.maxHeight * 2 / 3,
                  color: Color(0xff660000),
                  child: Center(
                    child: ClipOval(
                      child: Container(
                        height: constraints.maxHeight * 1.5 / 3,
                        width: constraints.maxHeight * 1.5 / 3,
                        color: Colors.amber,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('姓名 ${this.name}'),
                            Text('種族 ${this.title}'),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: constraints.maxHeight / 3,
                  color: Color(0xff006600),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () => onBackPress(),
                        child: Text('Back'),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      ElevatedButton(
                        onPressed: () => onNextPress(),
                        child: Text('Next'),
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      );
    });
  }
}
