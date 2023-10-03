import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary({super.key, required this.summaryData});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        children: summaryData.map(
          (data) {
            return Row(children: [
              Text((data['index'] as int).toString()),
              Container(
                width: 350,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(data['text'] as String, textAlign: TextAlign.center),
                      const SizedBox(height: 5),
                      Text(data['chosenAnswer'] as String),
                      const SizedBox(height: 5),
                      Text(data['correctAnswer'] as String),
                    ]),
              )
            ]);
          },
        ).toList(),
      ),
    );
  }
}
