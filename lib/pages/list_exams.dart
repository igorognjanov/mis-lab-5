import 'package:flutter/material.dart';

import '../model/exam_date.dart';
import '../widgets/my_list_tyle.dart';
import '../widgets/new_element.dart';

class ListExams extends StatefulWidget {
  ListExams();

  @override
  State<ListExams> createState() => _ListExamsState();
}

class _ListExamsState extends State<ListExams> {
  final List<ExamDate> _examDates = [];

  void _removeExamDate(String id) {
    setState(() {
      _examDates.removeWhere((element) => element.id == id);
    });
  }

  void _addItem(ExamDate examDate) {
    setState(() {
      _examDates.add(examDate);
    });
  }

  void _addItemFunction(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            behavior: HitTestBehavior.opaque,
            child: NewElement(addItem: _addItem),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Exams"),
        actions: [
          IconButton(
              onPressed: () => _addItemFunction(context),
              icon: const Icon(Icons.add)),
        ],
      ),
      body: Center(
        child: ListView.builder(
          itemCount: _examDates.length,
          itemBuilder: (contx, index) {
            return MyListTile(
              examDate: _examDates[index],
              removeExamDate: _removeExamDate,
            );
          },
        ),
      ),
    );
  }
}
