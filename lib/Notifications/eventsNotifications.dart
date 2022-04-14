import 'dart:ui';
import 'package:diplom/CreateEvent/newEvent.dart';
import 'package:diplom/Events/eventsMain.dart';
import 'package:diplom/Notifications/chooseDate.dart';
import 'package:diplom/Settings/eventsSettings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/cupertino.dart';

import '../Profile/eventsProfile.dart';

class eventsNotificationsPage extends StatefulWidget {
  const eventsNotificationsPage({Key? key}) : super(key: key);

  @override
  State<eventsNotificationsPage> createState() => _eventsNotificationsState();
}

class _eventsNotificationsState extends State<eventsNotificationsPage> {

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
                      'Уведомления',
                      style: GoogleFonts.manrope(
                          fontSize: 34,
                          fontWeight: FontWeight.w800,
                          letterSpacing: -0.7, color: Color(0xFF444444)),
                    ),
                    SizedBox(
                      width: 120,
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
                                  builder: (context) =>
                                      eventsProfilePage(),
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
              Padding(
                padding: const EdgeInsets.only(top: 24),
                child: Container(
                  width: 350,
                  height: 138,
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.all(Radius.circular(10)),
                   ),
                  child: Neumorphic(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Text(
                            'Вы были приглашены на встречу (театр)', style: GoogleFonts.openSans(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              letterSpacing: -0.3)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 25),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: Color(0xFFF1F1F1),
                                    fixedSize: Size(174, 48),
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              chooseDatePage(),
                                        ));
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('Принять',
                                          style: GoogleFonts.openSans(
                                              color: Color(0xFF444444),
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                              letterSpacing: -0.3)),
                                    ],
                                  ),
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Color(0xFFF1F1F1),
                                  fixedSize: Size(174, 48),
                                ),
                                onPressed: () {},
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('Отклонить',
                                        style: GoogleFonts.openSans(
                                            color: Color(0xFF444444),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            letterSpacing: -0.3)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.only(top: 38),
                    style: NeumorphicStyle(color: Color(0xFFF6F6F6), depth: 0),
                  ),

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
                                  onPressed: () => {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              eventsMainPage(),
                                        ))
                                  },
                                  icon: Icon(Icons.home_rounded, size: 30),
                                  color: Color(0xFFB1B1B1),
                                ),
                                IconButton(
                                  onPressed: null,
                                  icon: Icon(Icons.notifications_none_rounded,
                                      size: 30, color: Color(0xFF444444)),
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
                                      onPressed: () => {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  newEventPage(),
                                            ))
                                      },
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
