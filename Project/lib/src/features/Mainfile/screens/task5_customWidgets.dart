import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom Widgets'),
      ),
      body: Column(
        children: const [
          MyCustomWidget(),
          MyCustomWidget(
            title: 'My Custom Widget with Parameters',
            color: Colors.green,
          ),
        ],
      ),
    );
  }
}

class MyCustomWidget extends StatelessWidget {
  final String title;
  final Color color;

  const MyCustomWidget({
    Key? key,
    this.title = 'My Custom Widget',
    this.color = Colors.blue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color,
      ),
      padding: const EdgeInsets.all(16),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
