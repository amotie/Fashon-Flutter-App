import 'package:flutter/material.dart';

class CardWithImageAndTwoTexts extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subTitle;
  CardWithImageAndTwoTexts(
      {@required this.imagePath, this.title, this.subTitle});
  @override
  Widget build(BuildContext context) {
    return 
    Card(
      semanticContainer: true,
      margin: EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      elevation: 8.0,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Stack(
        children: [
          Image.network(
            imagePath,
            height: 200.0,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Positioned(
            bottom: 25.0,
            left: 20.0,
            child: Text(
              title,
              style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
            ),
          ),
          Positioned(
            bottom: 10.0,
            left: 20.0,
            child: Text(
              subTitle,
              style: TextStyle(
                fontSize: 15.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
