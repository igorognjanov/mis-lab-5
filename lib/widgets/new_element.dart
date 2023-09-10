import 'package:exam_dates/model/exam_date.dart';
import 'package:flutter/material.dart';
import 'package:nanoid/nanoid.dart';
import 'package:date_time_picker/date_time_picker.dart';

class NewElement extends StatefulWidget {
  final Function addItem;

  const NewElement({super.key, required this.addItem});

  @override
  State<StatefulWidget> createState() {
    return _NewElementState();
  }
}

class _NewElementState extends State<NewElement> {
  final _subjectName = TextEditingController();
  final _examDate = TextEditingController();

  void _submitData() {
    if (_subjectName.text.isEmpty) {
      return;
    }

    final subjectName = _subjectName.text;
    final examDate = _examDate.text;

    final newItem = ExamDate(
      id: nanoid(5),
      subjectName: subjectName,
      date: examDate,
    );

    widget.addItem(newItem);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(children: [
        TextField(
          controller: _subjectName,
          decoration: const InputDecoration(labelText: 'Title'),
        ),
        DateTimePicker(
            controller: _examDate,
            type: DateTimePickerType.dateTime,
            initialValue: null,
            firstDate: DateTime(2000),
            lastDate: DateTime(2100),
            dateLabelText: 'Date'),
        FloatingActionButton(
          onPressed: _submitData,
          child: const Text('Add'),
        )
      ]),
    );
  }
}
