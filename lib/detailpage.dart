import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class MyDetailPage extends StatefulWidget {
  @override
  _MyDetailPageState createState() => _MyDetailPageState();
}

class _MyDetailPageState extends State<MyDetailPage> {
  final List<String> title = <String>[
    'Sushi den',
    'hatsuhana Sushi',
    'Sushi maki'
  ];

  final List<String> image = <String>[
    'assets/resturant-1-sushi-den.png',
    'assets/resturant-2-hatsuhana-shushi.png',
    'assets/resturant-3-shushi-maki.png'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Wrap(
        children: <Widget>[
          Container(
            height: 380,
            decoration: BoxDecoration(
              color: Color(0XFF00B1FF),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40)),
            ),
            child: ListView(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 24, right: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                          icon: Image.asset('assets/icon-back-arrow-white.png'),
                          onPressed: () => Navigator.popUntil(
                              context, ModalRoute.withName('/'))),
                      IconButton(
                          icon: Image.asset('assets/icon-search-white.png'),
                          onPressed: null),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 36, right: 36),
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: Image.asset('assets/menu-1-yoshimasa-sushi.png'),
                      ),
                      Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "Yoshimasa Sushi",
                                style: TextStyle(
                                  fontFamily: 'Montserrat-SemiBold',
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 12,
                          ),
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
                              SizedBox(
                                width: 8,
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                width: 140,
                                height: 22,
                                child: Text(
                                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                                  style: TextStyle(
                                    fontFamily: 'Montserrat-Medium',
                                    fontSize: 8,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Column(
                                children: <Widget>[
                                  Image.asset('assets/icon-favorite.png'),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Stack(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 36, left: 36, right: 36),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Resturants",
                          style: TextStyle(
                            fontFamily: 'Montserrat-Bold',
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color(0XFF2A2A2A),
                          ),
                        ),
                        Container(
                          width: 124,
                          height: 1,
                          margin: EdgeInsets.only(top: 16),
                          color: Color(0XFF707070),
                        )
                      ],
                    ),
                    Container(
                      height: 600,
                      child: ListView.builder(
                          padding: EdgeInsets.only(top: 16),
                          itemCount: title.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              padding: EdgeInsets.only(bottom: 24),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Image.asset('${image[index]}'),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        '${title[index]}',
                                        style: TextStyle(
                                          fontFamily: 'Montserrat-Bold',
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0XFF2A2A2A),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.only(top: 4, bottom: 4),
                                        child: SmoothStarRating(
                                          allowHalfRating: false,
                                          starCount: 5,
                                          rating: 5,
                                          size: 10.0,
                                          color: Color(0XFFFFA127),
                                          spacing: 0.0,
                                        ),
                                      ),
                                      Container(
                                        width: 130,
                                        height: 20,
                                        child: Text(
                                          "Lorem ipsum dolor sit amet,consec",
                                          style: TextStyle(
                                            fontFamily: 'Montserrat-Medium',
                                            fontSize: 8,
                                            color: Color(0XFFA29F9F),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  MaterialButton(
                                    onPressed: () {},
                                    textColor: Colors.white,
                                    padding: EdgeInsets.all(0.0),
                                    child: Container(
                                      width: 88,
                                      height: 30,
                                      decoration: BoxDecoration(
                                          color: Color(0XFF00D99E),
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 8,
                                              offset: Offset(0, 15),
                                              color: Color(0XFF00D99E)
                                                  .withOpacity(.6),
                                              spreadRadius: -9,
                                            ),
                                          ]),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Text(
                                            "Order Now",
                                            style: TextStyle(
                                                fontSize: 10,
                                                color: Colors.white,
                                                letterSpacing: 1),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
                    )
                  ],
                ),
              ),
              Positioned(
                top: 320,
                left: 1,
                right: 1,
                child: Center(
                  child: MaterialButton(
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
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
