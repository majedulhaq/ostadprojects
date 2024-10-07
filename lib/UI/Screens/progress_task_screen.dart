import 'package:flutter/material.dart';
import 'package:ostadprojects/UI/widgets/task_card.dart';

class ProgressTaskScreen extends StatefulWidget {
  const ProgressTaskScreen({super.key});

  @override
  State<ProgressTaskScreen> createState() => _ProgressTaskScreenState();
}

class _ProgressTaskScreenState extends State<ProgressTaskScreen> {
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