import 'package:flutter/material.dart';
import 'package:ostadprojects/UI/widgets/task_card.dart';

class CompletedTaskScreen extends StatefulWidget {
  const CompletedTaskScreen({super.key});

  @override
  State<CompletedTaskScreen> createState() => _CompletedTaskScreenState();
}

class _CompletedTaskScreenState extends State<CompletedTaskScreen> {
 
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) {
          return const TaskCard();
        },
        separatorBuilder: (context, index) {
          return const SizedBox(height: 8);
        },
        itemCount: 10);
  }
}
