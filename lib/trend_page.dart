import 'package:flutter/material.dart';
import 'complete_profile.dart';

class Food {
  //--- title Of Food
  final String title;
  //-- image
  final String image;
  //--- icon
  final String likes;
  //--- likes

  Food({this.title, this.image, this.likes});

  static List<Food> allFood() {
    var lstOfFoods = new List<Food>();
    lstOfFoods.add(
        new Food(title: "Egyptian Wark Ainab", likes: "500", image: "5.jpg"));
    lstOfFoods.add(
        new Food(title: "Turkey Tetrazzini", likes: "300", image: "1.jpeg"));
    lstOfFoods.add(new Food(title: "Lasagna", likes: "280", image: "2.jpg"));
    lstOfFoods.add(
        new Food(title: "Honey Garlic Chicken", likes: "280", image: "3.jpg"));
    lstOfFoods
        .add(new Food(title: "Overnight Oats", likes: "279", image: "4.jpg"));
    lstOfFoods
        .add(new Food(title: "Grilled Salmon", likes: "278", image: "6.jpg"));
    return lstOfFoods;
  }
}

class TrendPage extends StatefulWidget {
  static String tag = 'trend-page';
  @override
  _TrendPagetState createState() => _TrendPagetState();
}

class _TrendPagetState extends State<TrendPage> {
  final List<Food> _allFood = Food.allFood();
  bool _isFavorited = false;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text(
            "Our Popular recipes",
            style: new TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.black87),
          ),
        ),
        body: new Padding(
            padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
          //  child: getHomePageBody(context)));
  }

  getHomePageBody(BuildContext context) {
    return ListView.builder(
      itemCount: _allFood.length,
      itemBuilder: _getItemUI,
      padding: EdgeInsets.all(10.0),
    );
  }

  Widget _getItemUI(BuildContext context, int index) {
    return new Card(
        child: new Column(
      children: <Widget>[
        new ListTile(
          leading: new Image.asset(
            "images/" + _allFood[index].image,
            fit: BoxFit.fill,
            width: 100.0,
            height: 100.0,
          ),
          title: new Text(
            _allFood[index].title,
            style: new TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
          ),
          subtitle: new Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text('Likes: ${_allFood[index].likes}',
                    style: new TextStyle(
                        fontSize: 13.0, fontWeight: FontWeight.normal)),
              ]),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            IconButton(
              icon: (_isFavorited
                  ? Icon(Icons.favorite)
                  : Icon(Icons.favorite_border)),
              color: Colors.red[500],
              onPressed: () {
                setState(() {
                  if (_isFavorited == false) {
                    _isFavorited = true;
                  } else {
                    _isFavorited = false;
                  }
                });
              },
            ),
          ],
        ),
      ],
    ));
  }
}
