import 'package:flutter/material.dart';

class CircleAvatarWithText extends StatelessWidget {
  final String imagePath;
  final String text;
  CircleAvatarWithText({@required this.imagePath, this.text});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90.0,
      width: double.infinity,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 40,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: EdgeInsets.only(top: 8.0, left: 25.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                      imagePath,
                    ),
                    radius: 30.0,
                  ),
                  Text(
                    text,
                    style: TextStyle(fontSize: 15.0, color: Colors.white),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            );
          }),
    );
  }
}
