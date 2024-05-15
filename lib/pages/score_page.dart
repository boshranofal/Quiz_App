import 'package:flutter/material.dart';
import 'package:quiz_app/models/question_models.dart';

class ScorePage extends StatelessWidget {
  final int score;
  final void Function()?onTap;
  const ScorePage({super.key,required this.score,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 30,
        ),
        const Center(
          child: Text(
            "Quiz Result!",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.pinkAccent,
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
            child: LinearProgressIndicator(
          value: .25 * score,
          minHeight: 10,
          color: Colors.pink,
        )),
        const SizedBox(
          height: 10,
        ),
        Text(
          'your score is : $score/${questionWithAnswer.length}',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.pinkAccent,
          ),
        ),
        const SizedBox(
          height: 70,
        ),
        const SizedBox(height: 30),
        score >= questionWithAnswer.length / 2
            ? Column(children: [
                Image.network(
                  'https://as2.ftcdn.net/v2/jpg/01/27/98/01/1000_F_127980188_7ADRqTFs1ZvGqF1QCIKE5LvrVldwcs9a.jpg',
                  width: 140,
                  height: 140,
                ),
                const Text(
                  "Succesfull !",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ])
            : Column(children: [
                Image.network(
                  'https://upload.wikimedia.org/wikipedia/commons/3/37/Sad-face.png',
                  width: 140,
                  height: 140,
                ),
                const Text(
                  "Failed !",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ]),
        const SizedBox(
          height: 50,
        ),
        SizedBox(
            height: 40,
            width: double.infinity,
            child: ElevatedButton(
                onPressed: 
                onTap,
                
            style: ElevatedButton.styleFrom(backgroundColor: Colors.pink),
                child: const Text(
                  "Reset",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                )),
              ),
      ],
    );
  }
}
