import 'package:flutter/material.dart';
import 'package:flutterinterntasks/task1.dart';
import 'package:flutterinterntasks/task2.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Intern Tasks"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.blue.withOpacity(0.5),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            FlatButton(
              minWidth: 300,
              height: 100,
              color: Colors.blueAccent,
              child: Text(
                'Task1',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (ctx) {
                  return Task1();
                }));
              },
            ),
            FlatButton(
              minWidth: 300,
              height: 100,
              color: Colors.blueAccent,
              child: Text(
                'Task2',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (ctx) {
                  return Task2();
                }));
              },
            ),
          ],
        ),
      ),
    );
  }
}
