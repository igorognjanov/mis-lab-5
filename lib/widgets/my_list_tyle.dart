import 'package:exam_dates/model/exam_date.dart';
import 'package:flutter/material.dart';

class MyListTile extends StatelessWidget {
  final ExamDate examDate;
  final Function removeExamDate;

  MyListTile({required this.examDate, required this.removeExamDate});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      child: ListTile(
        title: Text(
          examDate.subjectName,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          examDate.date.toString(),
          style: const TextStyle(color: Colors.grey),
        ),
        trailing: IconButton(
          icon: const Icon(Icons.delete),
          onPressed: () => removeExamDate(examDate.id),
        ),
      ),
    );
  }
}
