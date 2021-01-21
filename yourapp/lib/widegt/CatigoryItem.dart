import 'package:flutter/material.dart';

class CatigoryItem extends StatelessWidget {
  final String imagePath;
  final String brand;
  final String name;
  final String price;
  final Function onPressed;
  CatigoryItem({
    @required this.imagePath,
    @required this.brand,
    @required this.name,
    @required this.price,
    @required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.5,
              height: MediaQuery.of(context).size.height * 0.27,
              child: Hero(
                tag: imagePath,
                child: Image.network(
                  imagePath,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, progress) {
                    return progress == null ? child : LinearProgressIndicator();
                  },
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              brand,
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 15.0,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              name,
              style: TextStyle(
                color: Theme.of(context).accentColor,
                fontWeight: FontWeight.bold,
                fontSize: 15.0,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              price,
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 15.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
