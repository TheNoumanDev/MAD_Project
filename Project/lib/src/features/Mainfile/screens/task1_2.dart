import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class task1_2 extends StatelessWidget {
  final List<String> images = [
    'https://picsum.photos/seed/picsum/200/300',
    'https://picsum.photos/id/237/200/300',
    'https://picsum.photos/200/300?grayscale'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Image.network('https://picsum.photos/500/500'),
                Container(color: Colors.black.withOpacity(0.4)),
                Text(
                  'Welcome to my app!',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Button 1'),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Button 2'),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Button 3'),
                ),
              ],
            ),
            SizedBox(height: 16),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              children: <Widget>[
                Container(color: Colors.blue),
                Container(color: Colors.green),
                Container(color: Colors.red),
                Container(color: Colors.yellow),
              ],
            ),
            SizedBox(height: 16),
            ExpansionTile(
              title: Text('Expansion Tile'),
              children: <Widget>[
                ListTile(title: Text('Item 1')),
                ListTile(title: Text('Item 2')),
                ListTile(title: Text('Item 3')),
              ],
            ),
            SizedBox(height: 16),
            CarouselSlider(
              options: CarouselOptions(height: 200),
              items: images.map((imageUrl) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Image.network(imageUrl, fit: BoxFit.fill),
                    );
                  },
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
