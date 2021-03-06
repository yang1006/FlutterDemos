import 'package:flutter/material.dart';
import 'count.dart';
import 'package:fluttertoast/fluttertoast.dart';

//void main() => runApp(new MyApp());

void main() => runApp(new countApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget titleSection = new Container(
      padding: const EdgeInsets.all(32.0),
      child: new Row(
        children: [
          new Expanded(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                new Container(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: new Text(
                    'Oeschinen Lake Campground',
                    style: new TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                new Text(
                  'Kandersteg, Switzerland',
                  style: new TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          new Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          new Text('41'),
        ],
      ),
    );

    Widget buildClickableIcon(IconData icon, String lable) {
      Color color = Theme.of(context).primaryColor;
      return new GestureDetector(
        onTap: () {
          print('Icon was tapped!');
        },
        onLongPress: (){
          print('Icon was long pressed');
        },
        child: new Icon(icon, color: color)
      );
    }

    Column buildButtonColumn(IconData icon, String label) {
      Color color = Theme.of(context).primaryColor;
      return new Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          buildClickableIcon(icon, label),
          new Container(
            margin: const EdgeInsets.only(top: 8.0),
            child: new Text(
              label,
              style: new TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w400,
                color: color,
              ),
            ),
          )
        ],
      );
    };

    Widget buttonSection = new Container(
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          buildButtonColumn(Icons.call, 'CALL'),
          buildButtonColumn(Icons.near_me, 'ROUTE'),
          buildButtonColumn(Icons.share, 'SHARE'),
        ],
      ),
    );



    Widget textSection = new Container(
      padding: const EdgeInsets.all(32.0),
      child: new Text(
        'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. '
            'Situated 1,578 meters above sea level, it is one of the larger Alpine '
            'Lakes. A gondola ride from Kandersteg, followed by a half-hour walk '
            'through pastures and pine forest, leads you to the lake, which warms to '
            '20 degrees Celsius in the summer. '
            'Activities enjoyed here include rowing, and riding the summer toboggan run.',
        softWrap: true, //softwrap属性表示文本是否应在软换行符（例如句点或逗号）之间断开。
      ),
    );

    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primaryColor: Colors.blue,
      ),
      home: new Scaffold(
//          appBar: new AppBar(
//            title: new Text('Welcome to Flutter'),
//          ),
        body: new ListView(
          children: <Widget>[
            new Image.asset(
              'images/lake.jpg',
              width: 600.0,
              height: 240.0,
              fit: BoxFit.cover, //图像应该尽可能小，但覆盖整个渲染框
            ),
            titleSection,
            buttonSection,
            textSection,
          ],
        ),
      ),
    );
  }
}
