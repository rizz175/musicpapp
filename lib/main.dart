import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: Color(0xff003543),
      title: "Music",
      home: const musicplayer(),
    );
  }
}

class musicplayer extends StatefulWidget {
  const musicplayer({Key? key}) : super(key: key);

  @override
  _musicplayerState createState() => _musicplayerState();
}

class _musicplayerState extends State<musicplayer>
    with SingleTickerProviderStateMixin {
  var _bottomNavIndex = 0; //default index of a first screen

  late AnimationController _animationController;
  late Animation<double> animation;
  late CurvedAnimation curve;

  final iconList = <IconData>[
    FontAwesomeIcons.microphoneAlt,
    Icons.radio,
    Icons.local_library_outlined,
    Icons.perm_identity,
  ];

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );
    curve = CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.5,
        1.0,
        curve: Curves.fastOutSlowIn,
      ),
    );
    animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(curve);

    Future.delayed(
      Duration(seconds: 1),
      () => _animationController.forward(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff003543),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},

        backgroundColor: Color(0xff1cd4a7),
        child: Icon(FontAwesomeIcons.music),
        //params
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        backgroundColor: Color(0xff021e24),
        icons: iconList,
        activeIndex: _bottomNavIndex,
        inactiveColor: Color(0xff00617a),
        activeColor:Color(0xff00617a) ,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.defaultEdge,

        onTap: (index) => setState(() => _bottomNavIndex = index),
        //other params
      ),
      body: Column(
        children: [
          Expanded(
            flex: 5,
            child: Container(
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  radius: 1.4,
                  center: Alignment.center,
                  colors: <Color>[Color(0xff023544), Color(0xff003543)],
                ),
              ),
              child: ListView(
                physics: ClampingScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                children: [
                  ListTile(
                    leading: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(

                          color: Colors.red,
                          border: Border.all(
                            color: Colors.yellow,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        image: DecorationImage(
                          image: AssetImage(
                              'images/images.png'),
                          fit: BoxFit.fill,
                        ),                      ),
                    ),
                    title: Text(
                      "Rizzi",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      "riles",
                      style: TextStyle(
                          color: Colors.white38, fontWeight: FontWeight.bold),
                    ),
                    trailing:Icon(
                      FontAwesomeIcons.ellipsisV,color:Colors.white38,
                    ),
                  ),ListTile(
                    leading: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(

                        color: Colors.red,
                        border: Border.all(
                          color: Colors.red,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        image: DecorationImage(
                          image: AssetImage(
                              'images/boy.png'),
                          fit: BoxFit.fill,
                        ),                      ),
                    ),
                    title: Text(
                      "Somethiing beautiufl...",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      "Tom Walker Rxsebohy, Fljster",
                      style: TextStyle(
                          color: Colors.white38, fontWeight: FontWeight.bold),
                    ),
                    trailing:Icon(
                      FontAwesomeIcons.ellipsisV,color:Colors.white38,
                    ),
                  ),ListTile(
                    leading: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(

                        color: Colors.white,
                        border: Border.all(
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        image: DecorationImage(
                          image: AssetImage(
                              'images/girl.jpeg'),
                          fit: BoxFit.fill,
                        ),                      ),
                    ),
                    title: Text(
                      "Santo",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      "Cristina Agulisuer, Ozuna",
                      style: TextStyle(
                          color: Colors.white38, fontWeight: FontWeight.bold),
                    ),
                    trailing:Icon(
                      FontAwesomeIcons.ellipsisV,color:Colors.white38,
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
              flex: 3,
              child: Container(
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    radius: 1.2,
                    center: Alignment.center,
                    colors: <Color>[Color(0xff015f74), Color(0xff003543)],
                  ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 15, left: 20, right: 20, bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Browse by mood",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Text(
                              "See all",
                              style: TextStyle(
                                  color: Color(0xff007a99),
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.25,
                      child: ListView(
                        physics: ClampingScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        children: [
                          Container(
                              margin: EdgeInsets.only(
                                  top: 15, left: 20, bottom: 15),
                              decoration: BoxDecoration(
                                  color: Color(0xfffe5f6c),
                                  border: Border.all(
                                    color: Color(0xfffe5f6c),
                                  ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              width: 150,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    FontAwesomeIcons.guitar,
                                    size: 60,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    "ROCK",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 1.4),
                                  )
                                ],
                              )),
                          Container(
                              margin: EdgeInsets.only(
                                  top: 15, left: 20, bottom: 15),
                              decoration: BoxDecoration(
                                  color: Color(0xff6641bb),
                                  border: Border.all(
                                    color: Color(0xff6641bb),
                                  ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              height: 50,
                              width: 150,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    FontAwesomeIcons.circleNotch,
                                    size: 60,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    "MOTIVATION",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 1.4),
                                  )
                                ],
                              )),
                          Container(
                              margin: EdgeInsets.only(
                                  top: 15, left: 20, bottom: 15),
                              decoration: BoxDecoration(
                                  color: Color(0xff00e5a5),
                                  border: Border.all(
                                    color: Color(0xff00e5a5),
                                  ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              height: 50,
                              width: 150,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    FontAwesomeIcons.solidMoon,
                                    size: 60,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    "FEEL GOOD",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 1.4),
                                  )
                                ],
                              ))
                        ],
                      ),
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
