import 'dart:ui';
import 'package:diplom/eventsNotifications.dart';
import 'package:diplom/eventsProfile.dart';
import 'package:diplom/eventsSettings.dart';
import 'package:diplom/infoEvent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/cupertino.dart';

class eventsMainPage extends StatefulWidget {
  const eventsMainPage({Key? key}) : super(key: key);

  @override
  State<eventsMainPage> createState() => _eventsMainState();
}

class _eventsMainState extends State<eventsMainPage> {
  var controller = TextEditingController();

  BoxDecoration get _pinPutDecoration {
    return BoxDecoration(
      border: Border.all(color: Color(0xFF444444)),
      borderRadius: BorderRadius.circular(10.0),
    );
  }

  bool _isDisabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Row(
                  children: [
                    SizedBox(
                      width: 16,
                      height: 41,
                    ),
                    Text(
                      'Events',
                      style: GoogleFonts.manrope(
                          fontSize: 34,
                          fontWeight: FontWeight.w800,
                          letterSpacing: -0.7,
                          color: Color(0xFF444444)),
                    ),
                    SizedBox(
                      width: 207,
                      height: 41,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Container(
                        width: 45,
                        height: 45,
                        child: GestureDetector(
                          onTap: () => {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => eventsProfilePage(),
                                ))
                          },
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          image: DecorationImage(
                            image: AssetImage("assets/iconprofile.png"),
                            fit: BoxFit.none,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: <Widget>[
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 16, bottom: 7, left: 16),
                    child: Row(
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            fixedSize: Size(107, 44),
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              side: BorderSide(color: Colors.black),
                            ),
                          ),
                          onPressed: () {
                            showModalBottomSheet(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(12),
                                      topRight: Radius.circular(12))),
                              //for the round edges
                              builder: (context) {
                                return Container(
                                  height: 320,
                                  child: Column(children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Padding(
                                            padding: EdgeInsets.only(top: 24)),
                                        Container(
                                          height: 4,
                                          width: 76,
                                          decoration: const BoxDecoration(
                                              color: Colors.black,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(30))),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 24),
                                      child: Container(
                                        height: 50,
                                        width: 360,
                                        child: TextButton(
                                          onPressed: () {},
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                'Count of members',
                                                style: GoogleFonts.openSans(
                                                    fontSize: 21,
                                                    fontWeight: FontWeight.w700,
                                                    letterSpacing: -0.7,
                                                    color: Colors.black),
                                              ),
                                              const Icon(
                                                Icons.sort_rounded,
                                                color: Colors.black,
                                                size: 35,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 50,
                                      width: 360,
                                      child: TextButton(
                                        onPressed: () {},
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Date',
                                              style: GoogleFonts.openSans(
                                                  fontSize: 21,
                                                  fontWeight: FontWeight.w700,
                                                  letterSpacing: -0.7,
                                                  color: Colors.black),
                                            ),
                                            const Icon(Icons.sort_rounded,
                                                color: Colors.black, size: 35),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ]),
                                );
                              },
                              context: context,
                              isDismissible: false,
                            );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Sort',
                                  style: GoogleFonts.manrope(
                                      color: Color(0xFF444444),
                                      fontSize: 21,
                                      fontWeight: FontWeight.w700,
                                      letterSpacing: -0.3)),
                              const SizedBox(
                                width: 10,
                              ),
                              const Icon(
                                Icons.sort_rounded,
                                size: 21,
                                color: Colors.black,
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 17),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                              fixedSize: Size(119, 44),
                              shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                side: BorderSide(color: Colors.black),
                              ),
                            ),
                            onPressed: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Filters',
                                    style: GoogleFonts.manrope(
                                        color: Color(0xFF444444),
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                        letterSpacing: -0.3)),
                                const SizedBox(
                                  width: 7,
                                ),
                                const Icon(
                                  Icons.filter_list_rounded,
                                  size: 21,
                                  color: Colors.black,
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Neumorphic(
                          child: Container(
                            height: 100,
                            width: 200,
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          infoEventPage(),
                                    ));
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 8, top: 30),
                                        child: Text('Go to the cafe',
                                            style: GoogleFonts.manrope(
                                                fontSize: 17,
                                                fontWeight: FontWeight.w800,
                                                letterSpacing: -0.3, color: Colors.black)),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 4, left: 8),
                                        child: Row(
                                          children: [
                                            Text(
                                                '16:00 - 5st december' +
                                                    '     3',
                                                style: GoogleFonts.manrope(
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w600,
                                                    letterSpacing: -0.3, color: Colors.black)),
                                            Icon(
                                              Icons.person,
                                              size: 16,color: Colors.black,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          style: NeumorphicStyle(color: Color(0xFFAAFFE5)),
                        ),
                        Neumorphic(
                          child: Container(
                            height: 100,
                            width: 170,
                            child: TextButton(
                              onPressed: () {},
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 8, top: 30),
                                        child: Text('Go to the cinema',
                                            style: GoogleFonts.manrope(
                                                fontSize: 17,
                                                fontWeight: FontWeight.w800,
                                                letterSpacing: -0.3, color: Colors.black)),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 4, left: 8),
                                        child: Row(
                                          children: [
                                            Text(
                                                '5st december' +
                                                    '     3',
                                                style: GoogleFonts.manrope(
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w600,
                                                    letterSpacing: -0.3, color: Colors.black)),
                                            Icon(
                                              Icons.person,
                                              size: 16,color: Colors.black,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          style: NeumorphicStyle(color: Color(0xFFB6CAFF)),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Neumorphic(
                            child: Container(
                              height: 100,
                              width: 360,
                              child: TextButton(
                                onPressed: () {},
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(left: 8, top: 30),
                                          child: Text('Go to the theatre',
                                              style: GoogleFonts.manrope(
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w800,
                                                  letterSpacing: -0.3, color: Colors.black)),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 4, left: 8),
                                          child: Row(
                                            children: [
                                              Text(
                                                  '16:00 - 5st december' +
                                                      '     3',
                                                  style: GoogleFonts.manrope(
                                                      fontSize: 13,
                                                      fontWeight: FontWeight.w600,
                                                      letterSpacing: -0.3, color: Colors.black)),
                                              Icon(
                                                Icons.person,
                                                size: 16,color: Colors.black,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            style: NeumorphicStyle(color: Color(0xFFFFF5C2)),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Neumorphic(
                            child: Container(
                              height: 100,
                              width: 170,
                              child: TextButton(
                                onPressed: () {},
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(left: 8, top: 30),
                                          child: Text('Go to the cowork',
                                              style: GoogleFonts.manrope(
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w800,
                                                  letterSpacing: -0.3, color: Colors.black)),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 4, left: 8),
                                          child: Row(
                                            children: [
                                              Text(
                                                  '5st december' +
                                                      '     3',
                                                  style: GoogleFonts.manrope(
                                                      fontSize: 13,
                                                      fontWeight: FontWeight.w600,
                                                      letterSpacing: -0.3, color: Colors.black)),
                                              Icon(
                                                Icons.person,
                                                size: 16,color: Colors.black,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            style: NeumorphicStyle(color: Color(0xFFF4D3FF)),
                          ),
                          Neumorphic(
                            child: Container(
                              height: 100,
                              width: 200,
                              child: TextButton(
                                onPressed: () {},
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(left: 8, top: 30),
                                          child: Text('Go to the restaurant',
                                              style: GoogleFonts.manrope(
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w800,
                                                  letterSpacing: -0.3, color: Colors.black)),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 4, left: 8),
                                          child: Row(
                                            children: [
                                              Text(
                                                  '16:00 - 5st december' +
                                                      '     3',
                                                  style: GoogleFonts.manrope(
                                                      fontSize: 13,
                                                      fontWeight: FontWeight.w600,
                                                      letterSpacing: -0.3, color: Colors.black)),
                                              Icon(
                                                Icons.person,
                                                size: 16,color: Colors.black,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            style: NeumorphicStyle(color: Color(0xFFC1FFFB)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 30),
                    child: Container(
                      height: 55,
                      width: 380,
                      child: Neumorphic(
                        padding: EdgeInsets.only(
                            left: 16, right: 16, top: 2, bottom: 2),
                        style:
                            NeumorphicStyle(depth: 0, color: Color(0xFFF5F5F5)),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                IconButton(
                                  onPressed: null,
                                  icon: Icon(Icons.home_rounded,
                                      size: 30, color: Color(0xFF444444)),
                                ),
                                IconButton(
                                  onPressed: () => {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              eventsNotificationsPage(),
                                        ))
                                  },
                                  icon: Icon(Icons.notifications_none_rounded,
                                      size: 30),
                                  color: Color(0xFFB1B1B1),
                                ),
                                Container(
                                  width: 53,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                          Color(0xFF8A40B8),
                                          Color(0xFFAB79CA),
                                        ],
                                      )),
                                  child: IconButton(
                                      onPressed: () => {},
                                      icon: Icon(Icons.add),
                                      color: Colors.white),
                                ),
                                IconButton(
                                    onPressed: () => {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    eventsProfilePage(),
                                              ))
                                        },
                                    icon: Icon(Icons.account_circle_outlined,
                                        size: 30),
                                    color: Color(0xFFB1B1B1)),
                                IconButton(
                                    onPressed: () => {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    eventsSettingsPage(),
                                              ))
                                        },
                                    icon:
                                        Icon(Icons.settings_outlined, size: 30),
                                    color: Color(0xFFB1B1B1)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
