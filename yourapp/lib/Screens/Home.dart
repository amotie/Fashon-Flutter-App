import 'package:badges/badges.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:yourapp/Screens/Catigory.dart';
import 'package:provider/provider.dart';
import 'package:yourapp/Screens/DrawerScreen.dart';
import 'package:yourapp/const.dart';
import 'package:auto_size_text/auto_size_text.dart';
import '../CartList.dart';
import 'Cart.dart';
import 'Search.dart';

class Home extends StatefulWidget {
  static const String id = 'Home';

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  String title = slider[0].title;
  AnimationController animationController;
  bool _canBeDraged;
  bool isIgnored = false;
  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: kBaseSettleDuration);
  }

  void toggle() => animationController.isDismissed
      ? animationController.forward()
      : animationController.reverse();
  void toggleCancel() => animationController.reverse();

  void _onDragStart(DragStartDetails details) {
    bool isDragOpenFromLeft =
        animationController.isDismissed && details.globalPosition.dx < 10;
    bool isDragCloseFromRight =
        animationController.isCompleted && details.globalPosition.dx > 100;
    _canBeDraged = isDragOpenFromLeft || isDragCloseFromRight;
  }

  void _onDragUpdate(DragUpdateDetails details) {
    if (_canBeDraged) {
      double delta =
          details.primaryDelta / (MediaQuery.of(context).size.width / 2);
      animationController.value += delta;
    }
  }

  void _onDragEnd(DragEndDetails details) {
    if (animationController.isDismissed || animationController.isCompleted) {
      return;
    }
    if (details.velocity.pixelsPerSecond.dx.abs() >= 365.0) {
      double visualVelocity = details.velocity.pixelsPerSecond.dx /
          MediaQuery.of(context).size.width;
      animationController.fling(velocity: visualVelocity);
    } else if (animationController.value < 0.5) {
      animationController.fling(velocity: -1.0);
    } else {
      animationController.fling(velocity: 1.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    var store = context.watch<CartList>();

    return GestureDetector(
      onHorizontalDragStart: _onDragStart,
      onHorizontalDragUpdate: _onDragUpdate,
      onHorizontalDragEnd: _onDragEnd,
      child: AnimatedBuilder(
        animation: animationController,
        builder: (context, _) {
          double slide = (MediaQuery.of(context).size.width / 1.5) *
              animationController.value;
          double scale = 1 - (animationController.value * 0.2);
          return Stack(
            children: [
              DrawerScreen(),
              Transform(
                transform: Matrix4.identity()
                  ..translate(slide)
                  ..scale(scale),
                alignment: Alignment.centerLeft,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: GestureDetector(
                    onTap: toggleCancel,
                    child: Scaffold(
                        appBar: AppBar(
                          leading: IconButton(
                            icon: Icon(Icons.menu),
                            onPressed: toggle,
                          ),
                          actions: [
                            Badge(
                              showBadge: store.hasData(),
                              badgeColor: Colors.red,
                              position: BadgePosition.topEnd(top: 5, end: 0),
                              badgeContent:
                                  Text(store.getCartItemsCount().toString()
                                      // style: TextStyle(fontSize: 10),
                                      ),
                              child: IconButton(
                                icon: Icon(Icons.shopping_bag_rounded),
                                onPressed: () {
                                  print('asffsa');
                                  Navigator.pushNamed(context, Cart.id);
                                },
                              ),
                            ),
                            IconButton(
                              icon: Icon(Icons.search),
                              onPressed: () {
                                showSearch(
                                    context: context,
                                    delegate: Search(context));
                              },
                            ),
                          ],
                        ),
                        body: IgnorePointer(
                          ignoring:
                              animationController.isCompleted ? true : false,
                          child: ListView(
                            children: [
                              sliderWedget(),
                              stackImage(),
                              catigory(),
                            ],
                          ),
                        )),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget catigory() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30.0),
      child: GridView.builder(
          physics: ScrollPhysics(),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: catigorys.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            // crossAxisSpacing: 20.0,
            mainAxisSpacing: 30.0,
          ),
          itemBuilder: (context, index) {
            return FlatButton(
              onPressed: () {
                Navigator.pushNamed(context, Catigory.id,
                    arguments: catigorys[index].title);
              },
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: MediaQuery.of(context).size.height * 0.5,
                    child: Image.network(
                      catigorys[index].imageUrl,
                      fit: BoxFit.cover,
                      loadingBuilder: (context, child, progress) {
                        return progress == null
                            ? child
                            : LinearProgressIndicator();
                      },
                    ),
                  ),
                  AutoSizeText(
                    catigorys[index].title,
                    style: TextStyle(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      fontSize: MediaQuery.of(context).size.aspectRatio * 100,
                    ),
                    maxLines: 1,
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            );
          }),
    );
  }

  Widget sliderWedget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CarouselSlider.builder(
          itemCount: slider.length,
          itemBuilder: (BuildContext context, int itemIndex) {
            return Image.network(
              slider[itemIndex].imageUrl,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, progress) {
                return progress == null ? child : LinearProgressIndicator();
              },
            );
          },
          options: CarouselOptions(
              initialPage: 0,
              height: MediaQuery.of(context).size.height * 0.6,
              viewportFraction: 0.7,
              enlargeCenterPage: true,
              enableInfiniteScroll: false,
              onPageChanged: (index, courser) {
                setState(() {
                  title = slider[index].title;
                });
              }),
        ),
        SizedBox(
          height: 20.0,
        ),
        Text(
          'NEW ARRIVAL',
          style: TextStyle(
              color: Theme.of(context).primaryColor.withOpacity(0.4),
              fontWeight: FontWeight.w600,
              fontFamily: 'Castoro',
              letterSpacing: 15.0,
              fontSize: 10.0),
        ),
        SizedBox(
          height: 20.0,
        ),
        Text(
          title,
          style: TextStyle(
              color: Theme.of(context).accentColor,
              fontSize: 60.0,
              fontFamily: 'Castoro'),
          textAlign: TextAlign.center,
        ),
        Divider(
          color: Theme.of(context).accentColor,
          endIndent: 200.0,
          thickness: 1.0,
          indent: 200.0,
        ),
        FlatButton(
          child: Text(
            'Shop now',
            style: TextStyle(
              color: Theme.of(context).accentColor,
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          onPressed: () {},
        ),
        SizedBox(
          height: 40.0,
        )
      ],
    );
  }

  Widget stackImage() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: double.infinity,
          child: Image.network(
            'https://i.pinimg.com/736x/94/82/3f/94823fdd24107ff1fb43f19207312dbc.jpg',
            fit: BoxFit.cover,
            loadingBuilder: (context, child, progress) {
              return progress == null ? child : LinearProgressIndicator();
            },
          ),
        ),
        AutoSizeText(
          'Shop Catigores',
          style: TextStyle(
              color: Theme.of(context).accentColor,
              fontSize: 40.0,
              letterSpacing: 10.0,
              fontFamily: 'Castoro'),
          maxLines: 1,
        ),
      ],
    );
  }
}
