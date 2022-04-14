import 'dart:convert';
import 'dart:ui';
import 'package:diplom/CreateEvent/addDate.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class newEventPage extends StatefulWidget {
  const newEventPage({Key? key}) : super(key: key);

  @override
  State<newEventPage> createState() => _newEventState();
}

class Contacts {
  var name = '';
  var check = false;

  Contacts({required this.name, required this.check});

  void setChecked(state){
    check = state;
  }
}

List list = [
  Contacts(name: 'Mikhailova Alevtina', check: false),
];

Future<void> setEvent(name, datetime) async {
  final prefs = await SharedPreferences.getInstance();
  var events  = prefs.getString('events');
  var data;
  if (events != 'null') {
    data = jsonDecode(events!);
    print(data);
    data = data?.add({
      'name': name,
      'datetime': datetime.adddate + ' ' + datetime.timefrom + ' ' + datetime.timeto
    });
    prefs.setString('events', json.encode(data).toString());
  }
  else {
    data = [{
      'name': name,
      'datetime': datetime.adddate + ' ' + datetime.timefrom + ' ' + datetime.timeto
    }];
    print(data);
    prefs.setString('events', json.encode(data).toString());
  }
  print(json.encode(data).toString());
}

class _newEventState extends State<newEventPage> {
  var controller = TextEditingController();
  List listdate = [
    DateforAdd(adddate: '2020-13-04', timefrom: '16:00', timeto: '18:00'),
    DateforAdd(adddate: '2020-13-04', timefrom: '16:00', timeto: '18:00')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Назад',
                        style: GoogleFonts.openSans(
                            fontSize: 21,
                            fontWeight: FontWeight.w700,
                            letterSpacing: -0.7,
                            color: Color(0xFF8B41B9)),
                      ),
                    ),
                    Text(
                      'Создание встречи',
                      style: GoogleFonts.openSans(
                          fontSize: 21,
                          fontWeight: FontWeight.w700,
                          letterSpacing: -0.7,
                          color: Colors.black),
                    ),
                    TextButton(
                      onPressed: () {
                        setEvent(controller.text, listdate[0]);
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Готово',
                        style: GoogleFonts.openSans(
                            fontSize: 21,
                            fontWeight: FontWeight.w700,
                            letterSpacing: -0.7,
                            color: Color(0xFF8B41B9)),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 24, left: 16, right: 16),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: [
                        SizedBox(
                          height: 50,
                          width: 370,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Flexible(
                                    child: CupertinoTextField(
                                      controller: controller,
                                      placeholder: "Введите название встречи",
                                      keyboardType: TextInputType.name,
                                      maxLength: 100,
                                      suffixMode: OverlayVisibilityMode.editing,
                                      inputFormatters: <TextInputFormatter>[
                                        FilteringTextInputFormatter
                                            .singleLineFormatter,
                                      ],
                                      suffix: CupertinoButton(
                                        padding: EdgeInsets.zero,
                                        onPressed: () {
                                          controller.clear();
                                        },
                                        child: const Icon(CupertinoIcons.clear,
                                            color: Colors.black),
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(
                                            color: Color(0xFF444444), width: 1),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 0, left: 10, right: 10),
                child: Container(
                  height: 200,
                  width: 350,
                  child: ListView.separated(
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(
                      height: 2,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 7),
                        child: Container(
                          height: 30,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                listdate[index].adddate +
                                    ' с ' +
                                    listdate[index].timefrom +
                                    ' до ' +
                                    listdate[index].timeto,
                                overflow: TextOverflow.fade,
                                style: GoogleFonts.openSans(
                                    color: Colors.black,
                                    fontSize: 21,
                                    fontWeight: FontWeight.w600),
                              ),
                              IconButton(
                                  onPressed: () {
                                  },
                                  icon: const Icon(Icons.clear),
                                  iconSize: 20,
                                  color: Colors.black),
                            ],
                          ),
                        ),
                      );
                    },
                    shrinkWrap: true,
                    itemCount: listdate.length,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, top: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        onPrimary: Colors.white,
                        primary: Color(0xFF8A40B8),
                        fixedSize: Size(275, 44),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => addDatePage()));
                      },
                      child: Row(
                        children: [
                          Text(
                            'Добавить дату и время',
                            style: GoogleFonts.manrope(
                                fontSize: 23,
                                fontWeight: FontWeight.w600,
                                letterSpacing: -0.7,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, top: 10),
                child: Row(
                  children: [
                    TextButton(
                      onPressed: () {
                        showBarModalBottomSheet(
                          context: context,
                          builder: (context) => SingleChildScrollView(
                            controller: ModalScrollController.of(context),
                            child: Container(
                              height: 700,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 30, left: 13, right: 20),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(
                                              context,
                                            );
                                          },
                                          child: Text(
                                            'Назад',
                                            style: GoogleFonts.openSans(
                                                fontSize: 21,
                                                fontWeight: FontWeight.w700,
                                                letterSpacing: -0.7,
                                                color: Color(0xFF8B41B9)),
                                          ),
                                        ),
                                        Text(
                                          'Приглашение',
                                          style: GoogleFonts.openSans(
                                              fontSize: 21,
                                              fontWeight: FontWeight.w700,
                                              letterSpacing: -0.7,
                                              color: Colors.black),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(
                                              context,
                                            );
                                          },
                                          child: Text(
                                            'Готово',
                                            style: GoogleFonts.openSans(
                                                fontSize: 21,
                                                fontWeight: FontWeight.w700,
                                                letterSpacing: -0.7,
                                                color: Color(0xFF8B41B9)),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      width: 360,
                                      height: 610,
                                      child: ListView.separated(
                                        separatorBuilder: (context, index) =>
                                            Divider(
                                          height: 0,
                                        ),
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return Container(
                                            height: 50,
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Expanded(
                                                  flex: 1,
                                                  child: Container(
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Expanded(
                                                          child: Text(
                                                            list[index].name,
                                                            overflow:
                                                                TextOverflow
                                                                    .fade,
                                                            style: GoogleFonts.openSans(
                                                                color: Color(
                                                                    0xFF444444),
                                                                fontSize: 21,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700),
                                                          ),
                                                        ),
                                                        Transform.scale(
                                                          scale: 1.2,
                                                          child: Checkbox(
                                                            activeColor: Color(
                                                                0xFF8A40B8),
                                                            focusColor: Color(
                                                                0xFF8A40B8),
                                                            value: list[index]
                                                                .check,
                                                            onChanged: (value) {
                                                              setState(() {
                                                                list[index]
                                                                        .check =
                                                                    !list[index]
                                                                        .check;
                                                              });
                                                            },
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                        itemCount: list.length,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                      child: Row(
                        children: [
                          Text(
                            'Пригласить участников   ',
                            style: GoogleFonts.manrope(
                                fontSize: 23,
                                fontWeight: FontWeight.w700,
                                letterSpacing: -0.7,
                                color: Color(0xFF8B41B9)),
                          ),
                          const Icon(
                            Icons.add,
                            color: Color(0xFF8B41B9),
                            size: 28,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DateforAdd {
  var adddate = '';
  var timefrom = '';
  var timeto = '';

  DateforAdd(
      {required this.adddate, required this.timefrom, required this.timeto});
}
