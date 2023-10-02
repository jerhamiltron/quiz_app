import 'package:flutter/material.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestion = 0;

  void nextQuestion() {
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
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 30),
          AnswerButton(
            answer: questions[currentQuestion].answers[0],
            onTap: nextQuestion,
          ),
          const SizedBox(height: 10),
          AnswerButton(
            answer: questions[currentQuestion].answers[1],
            onTap: nextQuestion,
          ),
          const SizedBox(height: 10),
          AnswerButton(
            answer: questions[currentQuestion].answers[2],
            onTap: nextQuestion,
          ),
          const SizedBox(height: 10),
          AnswerButton(
            answer: questions[currentQuestion].answers[3],
            onTap: nextQuestion,
          ),
        ],
      ),
    );
  }
}
