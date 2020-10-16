import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:medfit/discover.dart';
import 'package:medfit/main.dart';
import 'package:medfit/signincontroller.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Calorie extends StatefulWidget {
  @override
  _CalorieState createState() => _CalorieState();
}

class _CalorieState extends State<Calorie> {
  GoogleSignIn googleSignIn = GoogleSignIn();
  String userId = " ";
  String bmr = " ";
  String name= " ";
  @override
  void initState() {
    getUserId();
    super.initState();
  }

  getUserId() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    userId = sharedPreferences.getString('id');
    DocumentSnapshot variable = await FirebaseFirestore.instance.collection('users').doc(userId).get();
    print(variable.data()["name"]);
    setState(() {
      name = variable.data()['name'];
      bmr = variable.data()['bmr'];
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        title: Text("Profile"),
        backgroundColor: Colors.black,
        shadowColor: Colors.green[800],
        actions: <Widget>[
          IconButton(icon: Icon(Icons.edit), onPressed: () {}),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/bg.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          color: Colors.black87,
          child: Column(
            children: <Widget>[
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Table(
                    columnWidths: {
                      0: FlexColumnWidth(4),
                      1: FlexColumnWidth(1)
                    },
                    children: [
                      TableRow(children: [
                        Text(
                          "No Exercise", style: TextStyle(color: Colors.white),
                          textScaleFactor: 1.5,
                        ),
                        Text(calorieintake(1.2),style: TextStyle(color: Colors.white), textScaleFactor: 1.5),
                      ]),
                      TableRow(children: [
                        Text(
                          "Little Exercise", style: TextStyle(color: Colors.white),
                          textScaleFactor: 1.5,
                        ),
                        Text(calorieintake(1.375),style: TextStyle(color: Colors.white), textScaleFactor: 1.5),
                      ]),
                      TableRow(children: [
                        Text(
                          "Moderate Exercise(3-5 days/wk)", style: TextStyle(color: Colors.white),
                          textScaleFactor: 1.5,
                        ),
                        Text(calorieintake(1.55),style: TextStyle(color: Colors.white), textScaleFactor: 1.5),
                      ]),
                      TableRow(children: [
                        Text(
                          "Very Active(6-7 days/wk)", style: TextStyle(color: Colors.white),
                          textScaleFactor: 1.5,
                        ),
                        Text(calorieintake(1.725),style: TextStyle(color: Colors.white), textScaleFactor: 1.5),
                      ]),
                      TableRow(children: [
                        Text(
                          "Hardcore", style: TextStyle(color: Colors.white),
                          textScaleFactor: 1.5,
                        ),
                        Text(calorieintake(1.9),style: TextStyle(color: Colors.white), textScaleFactor: 1.5),
                      ]),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green[700],
        onPressed: () {
          //Navigator.push(
          //context, MaterialPageRoute(builder: (context) => AddPost()));
        },
        child: Icon(Icons.share),
      ),
    );
  }
  calorieintake(value) {
    double cal = roundDouble(double.parse(bmr) * value, 2);
    return cal.toString();
  }

  roundDouble(double value, int places) {
    double mod = pow(10.0, places);
    return ((value * mod).round().toDouble() / mod);
  }
}

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Row(
              children: [
                Spacer(),
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/logo1.png'),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  children: <Widget>[
                    Spacer(),
                    Text(
                      'MEDFIT',
                      style: TextStyle(
                          color: Colors.green[800],
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    Spacer(),
                  ],
                ),
                Spacer(),
              ],
            ),
            decoration: BoxDecoration(
              color: Colors.grey[300],
            ),
          ),
          ListTile(
            leading: Icon(Icons.rss_feed),
            title: Text('Discover'),
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => Discover())),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Profile'),
            onTap: () => {},
          ),
          ListTile(
            leading: Icon(Icons.calculate),
            title: Text('Calorie meter'),
            onTap: () => {},
          ),
          ListTile(
            leading: Icon(Icons.work),
            title: Text('Task'),
            onTap: () => {},
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () => logout(context),
          ),
        ],
      ),
    );
  }

  logout(context) {
    AuthProvider().logOut();
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => MyApp(),
      ),
      (route) => false,
    );
  }
}
