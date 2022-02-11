// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:alarmate/clock_view.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    var formattedTime = DateFormat('HH:mm').format(now);
    var formattedDate = DateFormat('EEE, d, MMM').format(now);
    var timezoneString = now.timeZoneOffset.toString().split('.').first;
    var offsetSign = '';
    if (!timezoneString.startsWith('-')) offsetSign = '+';
    print(timezoneString);

    return Scaffold(
      backgroundColor: const Color(0xFF2D2F41),
      body: Container(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: Text(
                'Clock',
                style: TextStyle(
                    fontFamily: 'avenir',
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                    fontSize: 24),
              ),
            ),
            Flexible(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    formattedTime,
                    style: TextStyle(color: Colors.white, fontSize: 64),
                  ),
                  Text(
                    formattedDate,
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ],
              ),
            ),
            Flexible(
                flex: 4,
                fit: FlexFit.tight,
                child: Align(
                    alignment: Alignment.center,
                    child: ClockView(
                      size: MediaQuery.of(context).size.height / 3,
                    ))),
            Flexible(
              flex: 2,
              fit: FlexFit.tight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Timezone',
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.language,
                          color: Colors.white,
                        ),
                        SizedBox(width: 16),
                        Text(
                          'UTC' + offsetSign + timezoneString,
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                      ]),
                ],
              ),
            ),
            Divider(
              color: Colors.white54,
              height: 1,
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                    child: buildMenuButton('Clock', 'assets/clock_icon.png')),
                Expanded(
                    child: buildMenuButton('Alarm', 'assets/alarm_icon.png')),
                Expanded(
                    child: buildMenuButton('Timer', 'assets/timer_icon.png')),
                Expanded(
                    child:
                        buildMenuButton('Watch', 'assets/stopwatch_icon.png')),
              ],
            )
          ],
        ),
      ),
    );
  }

  Padding buildMenuButton(String title, String image) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: FlatButton(
        onPressed: () {},
        child: Column(
          children: <Widget>[
            Image.asset(image, scale: 1.5),
            SizedBox(height: 16),
            Text(
              title,
              style: TextStyle(
                  fontFamily: 'avenir', color: Colors.white, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
