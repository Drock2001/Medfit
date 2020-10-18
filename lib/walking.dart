import 'package:flutter/material.dart';

class walk extends StatefulWidget {
  @override
  _walkState createState() => _walkState();
}

class _walkState extends State<walk> {


  @override
  Widget build(BuildContext context) {
    Opacity(child: Column(),opacity: 0,);
    return Scaffold(
        body:
        /*decoration: BoxDecoration(
        image: DecorationImage(
        image: AssetImage("assets/images/bg.jpg"),
          fit: BoxFit.cover,
          ),
        ),
    ), */

      SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: 250,

                child: const Center(child: Text('Entry A')),
              ),
              Container(
                height: 250,

                child: const Center(child: Text('Entry B')),
              ),
              Container(
                height: 250,

                child: const Center(child: Text('Entry C')),
              ),
            ],
          ),
        ),
    );
  }
}
