import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tinder Swipe',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TinderSwipeScreen(),
    );
  }
}

class TinderSwipeScreen extends StatefulWidget {
  @override
  _TinderSwipeScreenState createState() => _TinderSwipeScreenState();
}

class _TinderSwipeScreenState extends State<TinderSwipeScreen> {
  List<String> welcomeImages = [
    "assets/image1.jpg",
    "assets/image2.jpg",
    "assets/image3.jpg",
    "assets/image4.jpg",
  ];

  @override
  Widget build(BuildContext context) {
// Use this to trigger swap.
    return Scaffold(
      appBar: AppBar(
        title: Text('Tinder Swipe'),
      ),
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.6,
          child: TinderSwapCard(
            swipeUp: true,
            swipeDown: true,
            orientation: AmassOrientation.BOTTOM,
            totalNum: welcomeImages.length,
            stackNum: 3,
            swipeEdge: 4.0,
            maxWidth: MediaQuery.of(context).size.width * 0.9,
            maxHeight: MediaQuery.of(context).size.width * 0.9,
            minWidth: MediaQuery.of(context).size.width * 0.8,
            minHeight: MediaQuery.of(context).size.width * 0.8,
            cardBuilder: (context, index) => Card(
              child: Image.asset('${welcomeImages[index]}'),
            ),
            swipeUpdateCallback: (DragUpdateDetails details, Alignment align) {
              /// Get swiping card's alignment
              if (align.x < 0) {
                // Card is LEFT swiping
              } else if (align.x > 0) {
                // Card is RIGHT swiping
              }
            },
            swipeCompleteCallback:
                (CardSwipeOrientation orientation, int index) {
              /// Get orientation & index of swiped card!
            },
          ),
        ),
      ),
    );
  }
  
  TinderSwapCard({required bool swipeUp, required bool swipeDown, required orientation, required int totalNum, required int stackNum, required double swipeEdge, required double maxWidth, required double maxHeight, required double minWidth, required double minHeight, required Card Function(dynamic context, dynamic index) cardBuilder, required Null Function(DragUpdateDetails details, Alignment align) swipeUpdateCallback, required Null Function(CardSwipeOrientation orientation, int index) swipeCompleteCallback}) {}
}

class AmassOrientation {
  static var BOTTOM;
}

class CardSwipeOrientation {
}

class CardController {
}
