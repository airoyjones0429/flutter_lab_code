import 'package:flutter/material.dart';
import 'myTitle.dart';
import 'myTitle2.dart';
import 'myTitle3.dart';
import 'myHomePage.dart';

void main() {
  MyApp myApp = MyApp();
  runApp(myApp);
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class People {
  final String? name;
  final String? kind;
  final String? job;
  People({
    this.name,
    this.kind,
    this.job,
  });
}

class _MyAppState extends State<MyApp> {
  PageController pageController = PageController();
  List<MyHomePage> myList = [];
  List<People> myNpc = [
    People(name: '小明', kind: '人類', job: '學生'),
    People(name: '小華', kind: '人類', job: '老師'),
    People(name: '小玉', kind: '人類', job: '校長'),
  ];

  @override
  Widget build(BuildContext context) {
    void onBackPress({int? index}) {
      if (!(index is Null)) {
        if (index == 0) {
          //移動到最後一頁
        } else {
          //移動到上一頁
          pageController.animateToPage(index - 1,
              duration: Duration(seconds: 1),
              curve: Curves.fastLinearToSlowEaseIn);
        }

        print('Back ${index}');
      }
    }

    void onNextPress({int? index}) {
      if (index != null) {
        if (myList.length == (index! + 1)) {
          int i;
          for (i = 0; i < myList.length; i++) {
            if (ValueKey<int>(i) == ValueKey<int>(myList.length)) {
              break;
            }
          }

          //已經在最後一頁，要增加一頁
          myList.add(MyHomePage(
            key: ValueKey<int>(myList.length),
            name: myNpc[myList.length % myNpc.length].name! +
                myList.length.toString(),
            title: myNpc[myList.length % myNpc.length].kind!,
            onBackPress: () => onBackPress(index: i),
            onNextPress: () => onNextPress(index: i),
          ));
        } else {
          //移動到下一頁
          pageController.animateToPage(index + 1,
              duration: Duration(seconds: 1), curve: Curves.linearToEaseOut);
        }
        print('Next ${index}');
      }
    }

    if (myList.length == 0) {
      myList = List.generate(1, growable: true, (index) {
        return MyHomePage(
          key: ValueKey<int>(index),
          title: myNpc[0].kind!,
          name: myNpc[0].name!,
          onBackPress: () => onBackPress(index: index),
          onNextPress: () => onNextPress(index: index),
        );
      });
    }

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
            // ignore: dead_code
            child: (false)
                // ignore: dead_code
                ? Text('簡單測試')
                : (false)
                    // ignore: dead_code
                    ? Mytitle()
                    : (false)
                        // ignore: dead_code
                        ? Mytitle2(height: 400, width: 400)
                        : (false)
                            // ignore: dead_code
                            ? Mytitle3(
                                height: 400,
                                width: 400,
                              )
                            : PageView(
                                scrollDirection: Axis.horizontal,
                                controller: pageController,
                                children: myList,
                              )),
      ),
    );
  }
}
