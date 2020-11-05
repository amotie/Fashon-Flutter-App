import 'package:appbar_textfield/appbar_textfield.dart';
import 'package:flutter/material.dart';
import 'package:FashonApp/components/cardWithImageAndTwoTexts.dart';
import 'package:FashonApp/components/circleAvatarWithText.dart';

class Home extends StatefulWidget {
  static const String id = 'Home';
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> list = ['ali', 'jsadnhkdsaj', 'saddsa'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarTextField(
        centerTitle: true,
        title: Text('Fashon'),
        searchContainerColor: Colors.grey[850],
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: 40,
          itemBuilder: (BuildContext context, int index) => index == 0
              ? CircleAvatarWithText(
                  imagePath:
                      'https://images.squarespace-cdn.com/content/v1/579300119f7456b10f412a58/1573808780774-48V1U09VZDPYKEWH0WMA/ke17ZwdGBToddI8pDm48kKz6_IZuHGCwMKa-jEN4gEZ7gQa3H78H3Y0txjaiv_0fDoOvxcdMmMKkDsyUqMSsMWxHk725yiiHCCLfrh8O1z5QHyNOqBUUEtDDsRWrJLTmEczKEiHaQrO44vfJ0kKvIBKH3-XJI4fARQ50Ip2pXyKtaRmz4tYleVZ9Rdhrcbdw/crossover01.jpg?format=1500w',
                  text: 'Ali')
              : CardWithImageAndTwoTexts(
                  imagePath:
                      'https://images.squarespace-cdn.com/content/v1/579300119f7456b10f412a58/1573808780774-48V1U09VZDPYKEWH0WMA/ke17ZwdGBToddI8pDm48kKz6_IZuHGCwMKa-jEN4gEZ7gQa3H78H3Y0txjaiv_0fDoOvxcdMmMKkDsyUqMSsMWxHk725yiiHCCLfrh8O1z5QHyNOqBUUEtDDsRWrJLTmEczKEiHaQrO44vfJ0kKvIBKH3-XJI4fARQ50Ip2pXyKtaRmz4tYleVZ9Rdhrcbdw/crossover01.jpg?format=1500w',
                  title: 'Danial',
                  subTitle: 'afsdfdsdsfdfsfdsfds',
                ),
        ),
      ),
    );
  }
}
