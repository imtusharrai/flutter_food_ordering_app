import 'package:flutter/material.dart';
import 'package:smooth_star_rating_nsafe/smooth_star_rating.dart';

class MyDetailPage extends StatefulWidget {
  @override
  _MyDetailPageState createState() => _MyDetailPageState();
}

class _MyDetailPageState extends State<MyDetailPage> {
  final List<Map<String, dynamic>> restaurants = [
    {
      'name': 'Sushi Den',
      'image': 'assets/resturant-1-sushi-den.png',
      'rating': 5.0,
      'description': 'Lorem ipsum dolor sit amet, consec',
    },
    {
      'name': 'Hatsuhana Sushi',
      'image': 'assets/resturant-2-hatsuhana-shushi.png',
      'rating': 5.0,
      'description': 'Lorem ipsum dolor sit amet, consec',
    },
    {
      'name': 'Sushi Maki',
      'image': 'assets/resturant-3-shushi-maki.png',
      'rating': 5.0,
      'description': 'Lorem ipsum dolor sit amet, consec',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          // Blue header section
          Container(
            decoration: BoxDecoration(
              color: Color(0XFF00B1FF),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40)),
            ),
            child: SafeArea(
              bottom: false,
              child: Column(
                children: [
                  // Top bar
                  Padding(
                    padding: EdgeInsets.only(left: 24, right: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        IconButton(
                            icon: Image.asset(
                                'assets/icon-back-arrow-white.png',
                                width: 24,
                                height: 24),
                            onPressed: () => Navigator.popUntil(
                                context, ModalRoute.withName('/'))),
                        IconButton(
                            icon: Image.asset(
                                'assets/icon-search-white.png',
                                width: 24,
                                height: 24),
                            onPressed: null),
                      ],
                    ),
                  ),
                  // Sushi image and info
                  Padding(
                    padding: EdgeInsets.only(left: 36, right: 36, bottom: 24),
                    child: Column(
                      children: <Widget>[
                        Image.asset(
                          'assets/menu-1-yoshimasa-sushi.png',
                          height: 160,
                          fit: BoxFit.contain,
                        ),
                        SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Expanded(
                              child: Text(
                                "Yoshimasa Sushi",
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            // Favorite button
                            Container(
                              width: 44,
                              height: 44,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 8,
                                    color: Colors.black.withValues(alpha: 0.15),
                                    offset: Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: Center(
                                child: Image.asset(
                                  'assets/icon-favorite.png',
                                  width: 20,
                                  height: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 12),
                        Row(
                          children: <Widget>[
                            SmoothStarRating(
                              allowHalfRating: false,
                              starCount: 5,
                              rating: 5,
                              size: 12.0,
                              color: Colors.white,
                              borderColor: Colors.white,
                              spacing: 0.0,
                            ),
                            SizedBox(width: 8),
                            Text(
                              "250+ Orders today",
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w600,
                                fontSize: 10,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Expanded(
                              child: Text(
                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 10,
                                  color: Colors.white,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Restaurants section
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(top: 24, left: 36, right: 36),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Restaurants",
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
                  Expanded(
                    child: ListView.builder(
                        padding: EdgeInsets.only(top: 16),
                        itemCount: restaurants.length,
                        itemBuilder: (BuildContext context, int index) {
                          final restaurant = restaurants[index];
                          return Padding(
                            padding: EdgeInsets.only(bottom: 20),
                            child: Row(
                              children: <Widget>[
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.asset(
                                    restaurant['image'],
                                    width: 60,
                                    height: 60,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(width: 16),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        restaurant['name'],
                                        style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0XFF2A2A2A),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: 4, bottom: 4),
                                        child: SmoothStarRating(
                                          allowHalfRating: false,
                                          starCount: 5,
                                          rating: restaurant['rating'],
                                          size: 10.0,
                                          color: Color(0XFFFFA127),
                                          borderColor: Color(0XFFFFA127),
                                          spacing: 0.0,
                                        ),
                                      ),
                                      Text(
                                        restaurant['description'],
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
                                _buildOrderButton(),
                              ],
                            ),
                          );
                        }),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      // Floating cart button
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        backgroundColor: Color(0XFF00D99E),
        icon: Image.asset('assets/icon-chat-notification.png',
            width: 16, height: 16),
        label: Text(
          "CART",
          style: TextStyle(
            fontSize: 12,
            color: Colors.white,
            letterSpacing: 1,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget _buildOrderButton() {
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
        child: Center(
          child: Text(
            "Order Now",
            style: TextStyle(
                fontSize: 10,
                color: Colors.white,
                letterSpacing: 1,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
