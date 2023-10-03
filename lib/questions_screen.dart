import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestion = 0;

  void answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);
    if (currentQuestion == questions.length - 1) {
      return;
    }
    setState(
      () {
        currentQuestion++;
      },
    );
  }

  @override
  Widget build(context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          SizedBox(
            width: 350,
            child: Text(
              questions[currentQuestion].text,
              textAlign: TextAlign.center,
              style: GoogleFonts.robotoFlex(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 20),
          ...questions[currentQuestion].getShuffledAnswers().map(
            (answer) {
              return Column(
                children: [
                  const SizedBox(height: 10),
                  AnswerButton(
                      answer: answer,
                      onTap: () {
                        answerQuestion(answer);
                      }),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
