import 'package:flutter/material.dart';
import 'package:ostadprojects/UI/Screens/add_new_task.dart';
import 'package:ostadprojects/UI/widgets/task_card.dart';
import 'package:ostadprojects/UI/widgets/tasksummaryCard.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _buildSummarySection(),
          Expanded(
            child: ListView.separated(
              itemCount: 10,
              itemBuilder: (context, index) {
                return const TaskCard();
              },
              separatorBuilder: (context, index) {
                return const SizedBox(height: 8);
              },
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onTapAddFAB,
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildSummarySection() {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: TaskSummaryboard(),
      ),
    );
  }

  void _onTapAddFAB() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddNewTask(),
      ),
    );
  }
}

class TaskSummaryboard extends StatelessWidget {
  const TaskSummaryboard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        TaskSummaryCard(
          count: 3,
          title: 'New',
        ),
        TaskSummaryCard(
          count: 15,
          title: 'Completed',
        ),
        TaskSummaryCard(
          count: 12,
          title: 'Cancelled',
        ),
        TaskSummaryCard(
          count: 20,
          title: 'Progress',
        )
      ],
    );
  }
}
