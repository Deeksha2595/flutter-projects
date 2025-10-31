import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:quizzler/question.dart';

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  const Quizzler({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = []; int score=0;
  List<Question> questions = [
    Question('You can lead a cow down stairs but not up stairs.',false),
    Question('Approximately one quarter of human bones are in the feet.',true),
    Question('A slug\'s blood is green.',true),
  ];
  int qno = 0;

  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                questions[qno].question,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            margin: EdgeInsets.all(10.0),
            color: Colors.green,
            child: TextButton(
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                setState(() {
                  if (qno<2) {
                    checkOrClose(qno,true);
                    qno++;
                  }
                  else {
                    checkOrClose(qno,true);
                    alertbox();
                  }
                });
              },
            ),
          ),
        ),
        Expanded(
          child: Container(
            margin: EdgeInsets.all(10.0),
            color: Colors.red,
            child: TextButton(
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                setState(() {
                  if (qno<2) {
                    checkOrClose(qno,false);
                    qno++;
                  }
                  else {
                    alertbox();
                  }
                });
              },
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        )
      ],
    );
  }

  void checkOrClose(int qno, bool bool) {
    if (questions[qno].answer!=bool){
      scoreKeeper.add(Icon(Icons.close,color: Colors.red,));
    }
    else{
      score++;
      scoreKeeper.add(Icon(Icons.check,color: Colors.green,));
    }
  }

  void alertbox() {
    Alert(
      context: context,
      type: AlertType.warning,
      image: null,
      title: "Finished",
      desc: "View Score?",
      style: AlertStyle(
        backgroundColor: Colors.grey.shade900,
        titleStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        descStyle: TextStyle(color: Colors.white70),
      ),
      buttons: [
        DialogButton(
          onPressed: () => Navigator.pop(context),
          color: Color.fromRGBO(0, 179, 134, 1.0),
          child: Text(
            "No",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
        DialogButton(
          onPressed: () {
            Navigator.pop(context); // close alert
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ScorePage(score: score),
              ),
            );
          },
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(116, 116, 191, 1.0),
              Color.fromRGBO(52, 138, 199, 1.0)
            ],
          ),
          child: Text(
            "Yes",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ],
    ).show();
  }
}

class ScorePage extends StatelessWidget {
  final int score;
  const ScorePage({super.key,required this.score});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: Text(
                  "Your Score: $score",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
            )
          ],
        ),
      ),
    );
  }
}
