import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  static const showGrid = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Grid layout'),
      ),
      body: Center(
        child: showGrid ? _buildGrid() : _buildStack(),
      ),
    );
  }

  Widget _buildGrid() {
    return GridView.extent(
      maxCrossAxisExtent: 150,
      padding: EdgeInsets.all(4),
      mainAxisSpacing: 4,
      crossAxisSpacing: 4,
      children: _buildGridView(10),
    );
  }

  Widget _buildList() {
    return ListView(
      padding: EdgeInsets.all(4),
      children: _buildListView(10),
    );
  }

  Widget _buildStack() {
    return Stack(
     alignment: Alignment(0.6,0.6),
      children: [
        CircleAvatar(
          backgroundImage: AssetImage('assets/pic0.jpg'),
          radius: 100,
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.black45
          ),
          child: Text(
            'Dilip',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white
            ),
          ),
        )
      ],
    );
  }

  List<Container> _buildGridView(int count) {
    return List.generate(
      count,
          (i) => Container(
        padding: EdgeInsets.all(8),
        child: Image.asset("assets/pic$i.jpg"),
      ),
    );
  }

  List<Container> _buildListView(int count) {
    final random = Random();
    final icons = [
      Icons.ac_unit,
      Icons.access_alarm,
      Icons.accessibility,
      Icons.account_balance,
      Icons.ad_units,
    ];
    final titles = [
      "Title One",
      "Title Two",
      "Title Three",
      "Title Four",
      "Title Five",
    ];
    final subtitles = [
      "Subtitle A",
      "Subtitle B",
      "Subtitle C",
      "Subtitle D",
      "Subtitle E",
    ];

    return List.generate(
      count,
          (i) => Container(
        padding: EdgeInsets.all(8),
        child: Row(
          children: [
            Icon(
              icons[random.nextInt(icons.length)],
              size: 40,
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  titles[random.nextInt(titles.length)],
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  subtitles[random.nextInt(subtitles.length)],
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
