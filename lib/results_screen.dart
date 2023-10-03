import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(
      {super.key, required this.chosenAnswers, required this.restartQuiz});

  final List<String> chosenAnswers;

  final void Function() restartQuiz;

  List<Map<String, Object>> getSummaryData() {
    print(chosenAnswers);
    final List<Map<String, Object>> summaryData = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      final question = questions[i];
      final chosenAnswer = chosenAnswers[i];
      final correctAnswer = question.answers[0];

      summaryData.add({
        'index': i + 1,
        'text': question.text,
        'chosenAnswer': chosenAnswer,
        'correctAnswer': correctAnswer,
        'answers': question.answers,
        'color': chosenAnswer == correctAnswer ? Colors.green : Colors.red,
      });
    }

    return summaryData;
  }

  @override
  Widget build(context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'You answerd x out of y questions correctly!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(199, 255, 255, 255),
              ),
            ),
            const SizedBox(height: 20),
            QuestionsSummary(summaryData: getSummaryData()),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () {
                restartQuiz();
              },
              child: const Text(
                'Restart Quiz',
                style: TextStyle(
                  fontSize: 18,
                  color: Color.fromRGBO(200, 200, 200, .95),
                ),
              ),
            ),
          ]),
    );
  }
}
