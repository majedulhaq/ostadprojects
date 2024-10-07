import 'package:flutter/material.dart';
import 'package:ostadprojects/UI/widgets/task_card.dart';

class CanceledTaskScreen extends StatefulWidget {
  const CanceledTaskScreen({super.key});

  @override
  State<CanceledTaskScreen> createState() => _CanceledTaskScreenState();
}

class _CanceledTaskScreenState extends State<CanceledTaskScreen> {
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