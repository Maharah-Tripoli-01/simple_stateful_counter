import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int counter = 0;
  Color textColor = Colors.red;

  @override
  Widget build(BuildContext context) {


    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('You can increase or decrease the value here'),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      changeCounter(1);
                    },
                    icon: const Icon(
                      Icons.add_circle_outline,
                      color: Colors.green,
                    ),
                  ),
                  Text(
                    '$counter',
                    style: TextStyle(
                      fontSize: 30,
                      color: textColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      changeCounter(-1);
                    }.inCase(counter != 0),
                    icon: const Icon(
                      Icons.remove_circle_outline,
                      color: Colors.red,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void changeCounter(int by) {
    setState(() {
      counter += by;
      if (by < 0) {
        textColor = Colors.red;
      } else if (by > 0) {
        textColor = Colors.green;
      }
    });
  }
}

extension FuncX on void Function() {
  void Function()? inCase(bool isTrue) {
    return isTrue ? this : null;
  }
}
