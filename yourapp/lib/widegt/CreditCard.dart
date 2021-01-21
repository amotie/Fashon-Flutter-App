import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CreditCard extends StatelessWidget {
  final String number;
  final String date;
  final String name;
  CreditCard({@required this.number, @required this.date, @required this.name});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.9,
          height: 220.0,
          decoration: new BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              stops: [0.1, 0.5, 0.7, 0.9],
              colors: [
                Color(0xFF1b447b),
                Color(0xFF1b447b),
                Color(0xBB1b447b),
                Color(0xBB1b447b),
              ],
            ),
            borderRadius: new BorderRadius.circular(20.0),
          ),
        ),
        number.startsWith('4') ? logoVisa() : logoMasterCard(),
        chip(),
        numberWidget(),
        dateWidget(),
        nameWidget()
      ],
    );
  }

  Positioned nameWidget() {
    return Positioned(
        bottom: 40.0,
        left: 40.0,
        child: Text(
          name.toUpperCase(),
          style: GoogleFonts.cairo(
            textStyle: TextStyle(
              letterSpacing: 5.0,
              fontSize: 15.0,
              fontStyle: FontStyle.normal,
              shadows: <Shadow>[
                Shadow(
                  offset: Offset(2.0, 2.0),
                  blurRadius: 3.0,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ],
            ),
          ),
        ),
      );
  }

  Positioned dateWidget() {
    return Positioned(
      bottom: 80.0,
      left: 120.0,
      child: Text(
        date,
        style: GoogleFonts.audiowide(
          textStyle: TextStyle(
            fontSize: 15.0,
            fontStyle: FontStyle.normal,
            shadows: <Shadow>[
              Shadow(
                offset: Offset(2.0, 2.0),
                blurRadius: 3.0,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Positioned numberWidget() {
    return Positioned(
      bottom: 100.0,
      left: 40.0,
      child: Text(
        '************' + number.substring(12),
        style: GoogleFonts.audiowide(
          textStyle: TextStyle(
            fontSize: 20.0,
            fontStyle: FontStyle.normal,
            shadows: <Shadow>[
              Shadow(
                offset: Offset(2.0, 2.0),
                blurRadius: 3.0,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Positioned chip() {
    return Positioned.fill(
      left: 40.0,
      top: 40.0,
      child: Align(
        alignment: Alignment.topLeft,
        child: Container(
          width: 60.0,
          height: 40.0,
          decoration: new BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerRight,
              end: Alignment.centerLeft,
              colors: [
                Colors.brown[100],
                Colors.brown[200],
                Colors.brown[300],
              ],
            ),
            borderRadius: new BorderRadius.circular(5.0),
          ),
        ),
      ),
    );
  }

  Positioned logoMasterCard() {
    return Positioned(
      child: SizedBox(
          width: 62.8,
          height: 50.0,
          child: Image.network(
            'https://i.pinimg.com/originals/ca/0c/70/ca0c7039ddcf224cb6b075cb59e4677e.png',
            fit: BoxFit.cover,
          )),
      // Text(
      //   'VISA',
      //   style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
      // ),
      top: 20.0,
      right: 20.0,
    );
  }

  Positioned logoVisa() {
    return Positioned(
      child: Text(
        'VISA',
        style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
      ),
      top: 20.0,
      right: 20.0,
    );
  }
}
