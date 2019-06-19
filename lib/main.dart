import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'detailpage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food Ordering',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.white,
      ),
      home: MyHomePage(),
      routes: <String, WidgetBuilder>{
        '/detail-page' : (BuildContext context) => MyDetailPage(),
      }
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget> [
    MainPage(),
    MainPage(),
    MainPage(),
    MainPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          bodyContent,
        ],
      ),
      bottomNavigationBar: bottomNavigationBar,
    );
  }

  Widget get bodyContent {
    return Container(
      child: _widgetOptions.elementAt(_selectedIndex),
    );
  }
  
  Widget get bottomNavigationBar {
    return Container(
      height: 77,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40)),
        boxShadow: [BoxShadow(
          blurRadius: 8,
          color: Colors.grey,
        )],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40)),
        child: BottomNavigationBar(items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Image.asset('assets/icon-home.png'), title: Text("Home")),
          BottomNavigationBarItem(icon: Image.asset('assets/icon-mentors.png'), title: Text("Mentors")),
          BottomNavigationBarItem(icon: Image.asset('assets/icon-messages.png'), title: Text("Messages")),
          BottomNavigationBarItem(icon: Image.asset('assets/icon-settings.png'),title: Text("Settings")),
        ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.blue,
          onTap: _onItemTapped,

        ),
      ),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Wrap(
          children: <Widget>[
            Container(
              height: 70,
              padding: EdgeInsets.only(left: 24, right: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                      icon: Image.asset('assets/icon-back-arrow-black.png'),
                      onPressed: null),
                  IconButton(
                      icon: Image.asset('assets/icon-search-black.png'),
                      onPressed: null),
                ],
              ),
            ),
            Container(
              height: 440,
              child: ListView(
                padding: EdgeInsets.only(left: 36, right: 36),
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("Today's Special",
                          style: TextStyle(
                              fontFamily: 'Montserrat-Bold',
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Color(0XFF2A2A2A))),
                      MaterialButton(
                        onPressed: () {},
                        textColor: Colors.white,
                        padding: EdgeInsets.all(0.0),
                        child: Container(
                          width: 88,
                          height: 30,
                          decoration: BoxDecoration(
                              color: Color(0XFF00D99E),
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 8,
                                  offset: Offset(0, 15),
                                  color: Color(0XFF00D99E).withOpacity(.6),
                                  spreadRadius: -9,
                                ),
                              ]),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Image.asset('assets/icon-chat-notification.png'),
                              SizedBox(
                                width: 6,
                              ),
                              Text(
                                "CART",
                                style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.white,
                                    letterSpacing: 1),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        "Find out what's cooking today",
                        style: TextStyle(
                          fontFamily: 'Montserrat-SemiBold',
                          fontSize: 14.0,
                          color: Color(0XFF2A2A2A).withOpacity(.5),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 42.0,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).pushNamed('/detail-page');
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Container(
                                  width: 206,
                                  height: 314,
                                  padding: EdgeInsets.all(12),
                                  color: Color(0XFF00B1FF),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      SizedBox(
                                        height: 60,
                                      ),
                                      Image.asset(
                                          'assets/menu-1-yoshimasa-sushi.png'),
                                      Text(
                                        "Yoshimasa Shushi",
                                        style: TextStyle(
                                            fontFamily: 'Montserrat-SemiBold',
                                            fontSize: 14,
                                            color: Colors.white),
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Row(
                                        children: <Widget>[
                                          SmoothStarRating(
                                            allowHalfRating: false,
                                            rating: 5,
                                            starCount: 5,
                                            size: 10.0,
                                            color: Colors.white,
                                            borderColor: Colors.white,
                                            spacing: 0.0,
                                          ),
                                          Text(
                                            "250+ Orders today",
                                            style: TextStyle(
                                              fontFamily: 'Montserrat-SemiBold',
                                              fontSize: 6,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 12,
                                      ),
                                      Container(
                                        width: 118,
                                        height: 20,
                                        child: Text(
                                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                                          style: TextStyle(
                                            fontFamily: 'Montserrat-Medium',
                                            fontSize: 8,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          width: 18.0,
                        ),
                        Column(
                          children: <Widget>[
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Container(
                                width: 140.0,
                                height: 148.0,
                                padding: EdgeInsets.all(12),
                                color: Color(0XFF00E582),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Image.asset(
                                      'assets/menu-2-yoshimasa-sushi.png',
                                      width: 134,
                                      height: 65,
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                      "Yoshimasa Sushi",
                                      style: TextStyle(
                                        fontFamily: 'Montserrat-SemiBold',
                                        fontSize: 14,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    SmoothStarRating(
                                      allowHalfRating: false,
                                      starCount: 5,
                                      rating: 5,
                                      size: 10,
                                      color: Colors.white,
                                      borderColor: Colors.white,
                                      spacing: 0.0,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 18,
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Container(
                                width: 140,
                                height: 148,
                                color: Color(0XFF535353),
                                padding: EdgeInsets.all(12),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Image.asset(
                                      'assets/menu-3-prato-sushi.png',
                                      width: 134,
                                      height: 65,
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                      "Prato Sushi ",
                                      style: TextStyle(
                                        fontFamily: 'Montserrat-SemiBold',
                                        fontSize: 14,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    SmoothStarRating(
                                      allowHalfRating: false,
                                      starCount: 5,
                                      rating: 5,
                                      size: 10.0,
                                      color: Colors.white,
                                      borderColor: Colors.white,
                                      spacing: 0.0,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 300,
              padding: EdgeInsets.only(left: 36, right: 36),
              child: ListView(
                children: <Widget>[
                  SizedBox(
                    height: 46,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Places',
                        style: TextStyle(
                          fontFamily: 'Montserrat-Bold',
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0XFF2A2A2A),
                        ),
                      ),
                      Container(
                        width: 200,
                        height: 1,
                        margin: EdgeInsets.only(top: 16),
                        color: Color(0XFF707070),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Image.asset('assets/resturant-1-sushi-den.png'),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Shushi den",
                            style: TextStyle(
                              fontFamily: 'Montserrat-Bold',
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Color(0XFF2A2A2A),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: 4,
                              bottom: 4,
                            ),
                            child: SmoothStarRating(
                              allowHalfRating: false,
                              starCount: 5,
                              rating: 5,
                              size: 10.0,
                              color: Color(0XFFFFA127),
                              borderColor: Color(0XFFFFA127),
                              spacing: 0.0,
                            ),
                          ),
                        ],
                      ),
                      MaterialButton(
                        onPressed: null,
                        textColor: Colors.white,
                        padding: EdgeInsets.all(0.0),
                        child: Container(
                          width: 88,
                          height: 30,
                          decoration: BoxDecoration(
                            color: Color(0XFF00D672),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Center(
                            child: Text(
                              "Order Now",
                              style: TextStyle(
                                  fontSize: 10.0,
                                  color: Colors.white,
                                  letterSpacing: 1),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
