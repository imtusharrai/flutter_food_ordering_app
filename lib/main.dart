import 'package:flutter/material.dart';
import 'package:smooth_star_rating_nsafe/smooth_star_rating.dart';
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
        scaffoldBackgroundColor: Colors.white,
      ),
      home: MyHomePage(),
      routes: <String, WidgetBuilder>{
        '/detail-page': (BuildContext context) => MyDetailPage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
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
      backgroundColor: Colors.white,
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: bottomNavigationBar,
    );
  }

  Widget get bottomNavigationBar {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40), topRight: Radius.circular(40)),
        boxShadow: [
          BoxShadow(
            blurRadius: 12,
            color: Colors.grey.withValues(alpha: 0.3),
            offset: Offset(0, -2),
          )
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40), topRight: Radius.circular(40)),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Image.asset('assets/icon-home.png', width: 24, height: 24),
                label: "Home"),
            BottomNavigationBarItem(
                icon: Image.asset('assets/icon-mentors.png', width: 24, height: 24),
                label: "Mentors"),
            BottomNavigationBarItem(
                icon: Image.asset('assets/icon-messages.png', width: 24, height: 24),
                label: "Messages"),
            BottomNavigationBarItem(
                icon: Image.asset('assets/icon-settings.png', width: 24, height: 24),
                label: "Settings"),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Color(0XFF00B1FF),
          unselectedItemColor: Colors.grey,
          onTap: _onItemTapped,
          selectedLabelStyle: TextStyle(
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w600,
            fontSize: 11,
          ),
          unselectedLabelStyle: TextStyle(
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w500,
            fontSize: 11,
          ),
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
  final List<Map<String, dynamic>> places = [
    {
      'image': 'assets/resturant-1-sushi-den.png',
      'name': 'Sushi Den',
      'rating': 5.0,
      'description': 'Lorem ipsum dolor sit amet, consec',
    },
    {
      'image': 'assets/resturant-2-hatsuhana-shushi.png',
      'name': 'Hatsuhana Sushi',
      'rating': 5.0,
      'description': 'Lorem ipsum dolor sit amet, consec',
    },
    {
      'image': 'assets/resturant-3-shushi-maki.png',
      'name': 'Sushi Maki',
      'rating': 5.0,
      'description': 'Lorem ipsum dolor sit amet, consec',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          // Top bar
          SliverToBoxAdapter(
            child: Container(
              height: 70,
              padding: EdgeInsets.only(left: 24, right: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                      icon: Image.asset('assets/icon-back-arrow-black.png',
                          width: 24, height: 24),
                      onPressed: null),
                  IconButton(
                      icon: Image.asset('assets/icon-search-black.png',
                          width: 24, height: 24),
                      onPressed: null),
                ],
              ),
            ),
          ),
          // Today's Special header
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(left: 36, right: 36),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Flexible(
                        child: Text("Today's Special",
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Color(0XFF2A2A2A))),
                      ),
                      _buildCartButton(),
                    ],
                  ),
                  SizedBox(height: 18),
                  Text(
                    "Find out what's cooking today",
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w500,
                      fontSize: 14.0,
                      color: Color(0XFF2A2A2A).withValues(alpha: 0.5),
                    ),
                  ),
                  SizedBox(height: 32),
                ],
              ),
            ),
          ),
          // Horizontal scrolling cards
          SliverToBoxAdapter(
            child: SizedBox(
              height: 320,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.only(left: 36, right: 36),
                children: <Widget>[
                  // Main blue card
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed('/detail-page');
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        width: 206,
                        padding: EdgeInsets.all(12),
                        color: Color(0XFF00B1FF),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(height: 40),
                            Expanded(
                              child: Image.asset(
                                'assets/menu-1-yoshimasa-sushi.png',
                                fit: BoxFit.contain,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              "Yoshimasa Sushi",
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  color: Colors.white),
                            ),
                            SizedBox(height: 8),
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
                                SizedBox(width: 4),
                                Flexible(
                                  child: Text(
                                    "250+ Orders today",
                                    style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 6,
                                      color: Colors.white,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 12),
                            Text(
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w500,
                                fontSize: 8,
                                color: Colors.white,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 18.0),
                  // Right column with two smaller cards
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
                              SizedBox(height: 10),
                              Expanded(
                                child: Image.asset(
                                  'assets/menu-2-yoshimasa-sushi.png',
                                  fit: BoxFit.contain,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                "Yoshimasa Sushi",
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  color: Colors.white,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(height: 4),
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
                      SizedBox(height: 18),
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
                              SizedBox(height: 10),
                              Expanded(
                                child: Image.asset(
                                  'assets/menu-3-prato-sushi.png',
                                  fit: BoxFit.contain,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                "Prato Sushi",
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  color: Colors.white,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(height: 4),
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
                  ),
                ],
              ),
            ),
          ),
          // Places section header
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(left: 36, right: 36, top: 36),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Places',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0XFF2A2A2A),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 1,
                          margin: EdgeInsets.only(top: 16, left: 16),
                          color: Color(0XFF707070),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12),
                ],
              ),
            ),
          ),
          // Places list — all restaurant entries
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final place = places[index];
                return Padding(
                  padding: EdgeInsets.only(
                    left: 36,
                    right: 36,
                    bottom: 20,
                  ),
                  child: _buildPlaceRow(
                    image: place['image'],
                    name: place['name'],
                    rating: place['rating'],
                    description: place['description'],
                  ),
                );
              },
              childCount: places.length,
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 24)),
        ],
      ),
    );
  }

  Widget _buildCartButton() {
    return MaterialButton(
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
                color: Color(0XFF00D99E).withValues(alpha: 0.6),
                spreadRadius: -9,
              ),
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/icon-chat-notification.png',
                width: 14, height: 14),
            SizedBox(width: 6),
            Text(
              "CART",
              style: TextStyle(
                  fontSize: 10, color: Colors.white, letterSpacing: 1),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPlaceRow({
    required String image,
    required String name,
    required double rating,
    required String description,
  }) {
    return Row(
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(image, width: 60, height: 60, fit: BoxFit.cover),
        ),
        SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                name,
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Color(0XFF2A2A2A),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 4, bottom: 4),
                child: SmoothStarRating(
                  allowHalfRating: false,
                  starCount: 5,
                  rating: rating,
                  size: 10.0,
                  color: Color(0XFFFFA127),
                  borderColor: Color(0XFFFFA127),
                  spacing: 0.0,
                ),
              ),
              Text(
                description,
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w500,
                  fontSize: 8,
                  color: Color(0XFFA29F9F),
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
        SizedBox(width: 8),
        _buildOrderNowButton(),
      ],
    );
  }

  Widget _buildOrderNowButton() {
    return Container(
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
              letterSpacing: 1,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
