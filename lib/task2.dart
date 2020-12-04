import 'package:flutter/material.dart';
import 'package:hexagon/hexagon_widget.dart';

class Task2 extends StatefulWidget {
  @override
  _Task2State createState() => _Task2State();
}

Widget animatedWidget = Container(
  height: 100,
  width: 100,
  decoration: BoxDecoration(
    color: color,
    borderRadius: BorderRadius.circular(15),
    shape: BoxShape.rectangle,
  ),
);

String widgetType = "container";

Color color = Colors.red.withOpacity(0.2);

class _Task2State extends State<Task2> with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    )..repeat();

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.linear,
    );
  }

  animate() {
    if (widgetType == 'hexagon') {
      setState(() {
        widgetType = "circle";
        animatedWidget = Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            color: Colors.red.withOpacity(0.2),
            shape: BoxShape.circle,
          ),
        );
      });
    } else if (widgetType == 'circle') {
      setState(() {
        widgetType = "container";
        animatedWidget = Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            color: Colors.red.withOpacity(0.2),
            borderRadius: BorderRadius.circular(15),
            shape: BoxShape.rectangle,
          ),
        );
      });
    } else if (widgetType == 'container') {
      setState(() {
        _animation = CurvedAnimation(
          parent: _controller,
          curve: Curves.linear,
        );
        widgetType = 'hexagon';

        animatedWidget = HexagonWidget.flat(
          height: 100,
          width: 100,
          color: color,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            RotationTransition(
              turns: _animation,
              child: GestureDetector(
                onTap: animate,
                child: Container(
                  child: animatedWidget,
                ),
              ),
            ),
            Text(
              'Tap on the shape or button on animate',
              style: TextStyle(color: Colors.grey.withOpacity(0.8)),
            ),
            FlatButton(
              color: Colors.blue,
              child: Text(
                'ANIMATE',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                animate();
              },
            ),
          ],
        ),
      ),
    );
  }
}
