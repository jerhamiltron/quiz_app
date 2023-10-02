import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Image.asset('assets/images/quiz-logo.png',
              width: 250, color: Colors.white60),
        ),
        const SizedBox(height: 30),
        const Text(
          "Learn Flutter the fun way!",
          style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(199, 255, 255, 255)),
        ),
        const SizedBox(height: 30),
        OutlinedButton.icon(
          onPressed: startQuiz,
          style: OutlinedButton.styleFrom(
            foregroundColor: const Color.fromARGB(199, 255, 255, 255),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
            ),
          ),
          label: const Text(
            'Start Quiz',
          ),
          icon: const Icon(Icons.arrow_right_alt),
        ),
      ],
    );
  }
}
