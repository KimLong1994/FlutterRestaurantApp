import 'package:flutter/material.dart';
import '../widgets/fb_answer_item.dart';
import '../widgets/fb_question_item.dart';
import '../widgets/main_drawer_item.dart';
import '../screens_restaurant/tab_screen.dart';

class FeedBackScreen extends StatefulWidget {
  static const routeName = "/Feed-Back-Screen";

  @override
  _FeedBackScreenState createState() => _FeedBackScreenState();
}

class _FeedBackScreenState extends State<FeedBackScreen> {
  final _feedBackList = const [
    {
      "questionText": "What do you think our service ?",
      "answer": [
        {"text": "Excellent", "score": 4},
        {"text": "Good", "score": 3},
        {"text": "So So", "score": 2},
        {"text": "Really Bad", "score": 1}
      ]
    },
    {
      "questionText": "How do you feel these foods ?",
      "answer": [
        {"text": "Excellent", "score": 4},
        {"text": "Good", "score": 3},
        {"text": "So So", "score": 2},
        {"text": "Really Bad", "score": 1}
      ]
    },
    {
      "questionText": "Do we make you comfortable and satisfied ?",
      "answer": [
        {"text": "Excellent", "score": 4},
        {"text": "Good", "score": 3},
        {"text": "So So", "score": 2},
        {"text": "Really Bad", "score": 1}
      ]
    },
    {
      "questionText": "How do you mark your experience here ?",
      "answer": [
        {"text": "Excellent", "score": 4},
        {"text": "Good", "score": 3},
        {"text": "So So", "score": 2},
        {"text": "Really Bad", "score": 1}
      ]
    },
    {
      "questionText": "Do you feel use this easily?",
      "answer": [
        {"text": "Excellent", "score": 4},
        {"text": "Good", "score": 3},
        {"text": "So So", "score": 2},
        {"text": "Really Bad", "score": 1}
      ]
    },
  ];
  var currentIndex = 0;

  void _changeAnswer() {
    setState(() {
      currentIndex += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FeedBack To Us"),
      ),
      drawer: MainDrawer(),
      body: (currentIndex < _feedBackList.length)
          ? Column(
              children: <Widget>[
                SizedBox(height: 25),
                QuestionItem(_feedBackList[currentIndex]["questionText"]),

                // TODO: Remember this solution how to map any list
                ...(_feedBackList[currentIndex]["answer"]
                        as List<Map<String, Object>>)
                    .map((answer) {
                  return AnswerItem(
                    text: answer["text"],
                    selectAnswer: _changeAnswer,
                  );
                }).toList()
              ],
            )
          : Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                  child: Text(
                    "Thank for your feed back to us",
                    style: TextStyle(
                      fontSize: 24,
                      fontFamily: "RobotoCondensed",
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                RaisedButton(
                  color: Theme.of(context).primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(25),
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamed(TabScreen.routeName);
                  },
                  child: Text(
                    "Back To Categories",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Raleway",
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Image.asset(
                    "assets/images/bowdown.jpg",
                    height: 300,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    filterQuality: FilterQuality.high,
                  ),
                ),
              ],
            ),
    );
  }
}
