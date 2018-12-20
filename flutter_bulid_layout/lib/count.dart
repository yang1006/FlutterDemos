import 'package:flutter/material.dart';

// ignore: slash_for_doc_comments
/**
 * 一个计数器， 点击按钮 count + 1
 * StatelessWidget 用于显示控件，里面的变量都是final的
 * StatefulWidget + State 用于 count 增加
 * */

class CounterDisplay extends StatelessWidget{
  CounterDisplay({this.count});
  final int count;

  @override
  Widget build(BuildContext context) {
    return new Text('Count: $count');
  }
}

class CounterIncrementor extends StatelessWidget{

  CounterIncrementor({this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {

    return new RaisedButton(
      onPressed: onPressed,
      child: new Text('Increment'),
    );
  }

}

class Counter extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new CounterState();
  }
}

class CounterState extends State<Counter>{
  int _count = 0;

  void _increse(){
    setState(() {
      _count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Row(

      children: <Widget>[
        new CounterIncrementor(onPressed: _increse),
        new CounterDisplay(count: _count,)
      ],
    );
  }

}


class countApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo Counter',
      theme: new ThemeData(
        primaryColor: Colors.blue,
      ),
      home: new Scaffold(
          appBar: new AppBar(
            title: new Text('Welcome to Flutter'),
          ),
        body: new Counter(),
      ),
    );
  }
}