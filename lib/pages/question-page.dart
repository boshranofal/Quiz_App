import 'package:flutter/material.dart';
import 'package:quiz_app/models/question_models.dart';
import 'package:quiz_app/pages/score_page.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage({super.key});

  @override
  State<QuestionPage> createState() => QuestionpageState();
}

class QuestionpageState extends State<QuestionPage> {
  int questionIndex = 0;
  bool showScor = false;
  int score = 0;
  String? selectAnswer;
  double progress = 0.25;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: !showScor
              ? Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(
                    questionWithAnswer[questionIndex].question,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  const Text(
                    "Answer and get points",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.normal,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Text(
                        "step ${questionIndex + 1}",
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "of ${questionWithAnswer.length} ",
                        style: const TextStyle(color: Colors.grey),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    child: LinearProgressIndicator(
                      value: progress,
                      color: Colors.pinkAccent,
                      minHeight: 8,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Column(
                    children: (questionWithAnswer[questionIndex].answer)
                        .map((answer) => Padding(
                            padding: const EdgeInsets.only(bottom: 16),
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  selectAnswer = answer;
                                });
                              },
                              child: Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.all(16.0),
                                  decoration: BoxDecoration(
                                    color: selectAnswer == answer
                                        ? Colors.green
                                        : null,
                                    border: Border.all(
                                      color: Colors.grey.withOpacity(0.3),
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.add,
                                        color: answer == selectAnswer
                                            ? Colors.white
                                            : null,
                                      ),
                                      const SizedBox(
                                        width: 16,
                                      ),
                                      Text(
                                        answer,
                                        style: TextStyle(
                                            color: answer == selectAnswer
                                                ? Colors.white
                                                : null),
                                      ),
                                    ],
                                  )),
                            )))
                        .toList(),
                  ),
                  const Spacer(),
                  SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                          onPressed: () {
                            if (selectAnswer != null) {
                              setState(() {
                                progress = progress + 0.25;
                              });
                              if (selectAnswer ==
                                  questionWithAnswer[questionIndex]
                                      .correctanswer) {
                                score++;
                                print(score);
                              }
                              if (questionIndex <
                                  questionWithAnswer.length - 1) {
                                setState(() {
                                  questionIndex++;
                                  // print(questionIndex);
                                });
                              } else {
                                setState(() {
                                  showScor = true;
                                });
                              }
                              setState(() {
                                selectAnswer = null;
                              });
                            } else {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content: Text('Please select an answer'),
                                duration: Duration(seconds: 2),
                              ));
                            }
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              )),
                          child: const Text(
                            'Next',
                          )))
                ])
              : ScorePage(
                  score: score,
                  onTap:(){ 
                    setState( () {
                    questionIndex = 0;
                    score = 0;
                    showScor = false;
                    selectAnswer = null;
                    progress = .25;
                      });
  }
  ),
                ),
        ),
      );
    
  }
}
