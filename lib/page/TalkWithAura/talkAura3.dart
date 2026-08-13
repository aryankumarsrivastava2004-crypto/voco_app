//4(b)(ii)

import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:aura_app/page/TalkWithAura/talkAura2.dart';
import 'package:aura_app/page/home.dart';
import 'package:aura_app/page/ui/comingsoon.dart';

class TalkWithAura3 extends StatefulWidget {
  const TalkWithAura3({Key? key}) : super(key: key);

  @override
  _tackwithaura1WidgetState createState() => _tackwithaura1WidgetState();
  // _Demo2WidgetState createState() => _Demo2WidgetState();
}

class _tackwithaura1WidgetState extends State<TalkWithAura3> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return Scaffold(
        key: scaffoldKey,
        // backgroundColor: Color(0xFFF1F8F4),
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(60.0), // here the desired height
            child: AppBar(
              leading: Builder(
                builder: (BuildContext context) {
                  return TextButton(
                      onPressed: () async {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => HomePage()),
                          (Route<dynamic> route) => false,
                        );
                      },
                      child: Text(
                        'Home',
                        style: TextStyle(color: Colors.white),
                      ));
                },
              ),
              title: Text(
                " Talk with Aura",
                style: GoogleFonts.lora(
                    fontStyle: FontStyle.normal, fontWeight: FontWeight.bold),
              ),
              actions: <Widget>[
                TextButton(
                    onPressed: () async {
                      Navigator.of(context).pop(true);
                    },
                    child: Text(
                      'Back',
                      style: TextStyle(color: Colors.white),
                    ))
              ],
            )),
        body: SafeArea(
            child: Container(
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 255, 255, 255),
          ),
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: <
              Widget>[
            Container(
              // color: Color.fromARGB(117, 77, 2, 2),
              width: mediaQuery.size.width * 1,
              height: mediaQuery.size.height * 0.04,
            ),
            Container(
              height: mediaQuery.size.height * 0.39,
              // color: Colors.black,
              child: Column(children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: mediaQuery.size.width * 0.9,
                        height: mediaQuery.size.height * 0.37,
                        child: Container(
                            width: mediaQuery.size.width * 0.48,
                            height: mediaQuery.size.height * 0.39,
                            child: SizedBox(
                                child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    new MaterialPageRoute(
                                        builder: (context) =>
                                            new comingsoon()));
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(
                                    Icons.border_top,
                                    color: Color.fromARGB(255, 0, 4, 253),
                                    size: 80.0,
                                  ), // icon
                                  Text(
                                    "Talk to Aura Bot",
                                    style: GoogleFonts.lora(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FontStyle.normal,
                                      fontSize: mediaQuery.size.height * 0.03,
                                    ),
                                  )
                                ],
                              ),
                              //style: ElevatedButton.styleFrom(
                              //     shape: CircleBorder(),
                              //A  backgroundColor: Color.fromARGB(255, 238, 205, 40)),
                            ))),
                      )
                    ]),
              ]),
            ),
            SizedBox(
              height: mediaQuery.size.height * 0.02,
            ),
            Container(
              height: mediaQuery.size.height * 0.39,
              // color: Colors.black,
              child: Column(children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                          width: mediaQuery.size.width * 0.9,
                          height: mediaQuery.size.height * 0.37,
                          color: Color.fromARGB(255, 249, 217, 217),
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  Icons.lock,
                                  color: Color.fromARGB(255, 150, 36, 36),
                                  size: 80.0,
                                ), // icon
                                Text(
                                  "Talk to Aura Friend",
                                  style: GoogleFonts.lora(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.normal,
                                    fontSize: mediaQuery.size.height * 0.03,
                                  ),
                                )
                              ],
                            ),
                            style: ElevatedButton.styleFrom(
                                //     shape: CircleBorder(),
                                backgroundColor: Color.fromARGB(255, 217, 132, 111)),
                          )),
                    ]),
              ]),
            ),
          ]),
        )));
  }
}
