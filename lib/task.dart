import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'category_card.dart';
import 'search.dart';
import 'package:flutter_svg/svg.dart';
import 'detail.dart';
import 'walking.dart';
import 'running.dart';
import 'dashboard.dart';
import 'cycling.dart';

class tasks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   var size = MediaQuery.of(context).size;
    return Scaffold(
      //add nav drawer

      body: Stack(
        children: <Widget>[
      Container(
      // Here the height of the container is 45% of our total height
      height: size.height * .45,
        decoration: BoxDecoration(
          color: Colors.black,

        ),
      ),

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    greetingMessage(),
                    style: TextStyle(color: Colors.white,fontSize: 40),

                  ),
                  SearchBar(),
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: .85,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      children: <Widget>[
                        CategoryCard(
                          title: "Running",
                          svgSrc: "assets/icons/run.svg",
                          press: () {
                            Navigator.push(context, new MaterialPageRoute(
                                builder: (context) {
                                  return run();
                                }
                            ),
                            );
                          },
                        ),
                        CategoryCard(
                          title: "Walking",
                          svgSrc: "assets/icons/walk.svg",
                          press: () {
                            Navigator.push(context, new MaterialPageRoute(
                                builder: (context) {
                                  return Dashboard();
                                }
                            ),
                            );
                          },
                        ),
                        CategoryCard(
                          title: "Meditation",
                          svgSrc: "assets/icons/Meditation.svg",
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return DetailsScreen();
                              }),
                            );
                          },
                        ),
                        CategoryCard(
                          title: "Cycling",
                          svgSrc: "assets/icons/cycle_1.svg",
                          press: () {
                            Navigator.push(context, new MaterialPageRoute(
                                builder: (context) {
                                  return cycle();
                                }
                            ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
String greetingMessage(){

  var timeNow = DateTime.now().hour;

  if (timeNow>=6 && timeNow <= 12) {
    return 'Good Morning';
  } else if ((timeNow > 12) && (timeNow <= 16)) {
    return 'Good Afternoon';
  } else if ((timeNow > 16) && (timeNow < 23)) {
    return 'Good Evening';
  } else {
    return 'Good Night';
  }
}



