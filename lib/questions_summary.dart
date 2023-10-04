import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary({super.key, required this.summaryData});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: summaryData.map(
            (data) {
              return Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: const Color.fromRGBO(10, 19, 25, 1.0),
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        color: data['color'] as Color,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        (data['index'] as int).toString(),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(data['text'] as String,
                                textAlign: TextAlign.center),
                            const SizedBox(height: 5),
                            Text('Chosen: ${data['chosenAnswer']}',
                                textAlign: TextAlign.center),
                            const SizedBox(height: 5),
                            Text('Correct: ${data['correctAnswer']}',
                                textAlign: TextAlign.center),
                            const SizedBox(height: 10),
                          ]),
                    )
                  ],
                ),
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
