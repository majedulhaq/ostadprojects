import 'package:flutter/material.dart';
import 'package:ostadprojects/UI/Screens/add_new_task.dart';
import 'package:ostadprojects/UI/widgets/tasksummaryCard.dart';
import 'package:ostadprojects/UI/widgets/tmappbar.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TmAppbar(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: _onTapAddFab,
        child: const Text(
          '+',
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: TaskSummeryFunction(),
            ),
            SizedBox(
              height: 500,
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return SizedBox(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Card(
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Translation by H. Rackham',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 5),
                              const Text(
                                'On indignation and dislike ed and.',
                                textAlign: TextAlign.justify,
                                style: TextStyle(fontSize: 16),
                              ),
                              const SizedBox(height: 5),
                              const Text(
                                'Date: 30/2/2024',
                                style: TextStyle(fontSize: 16),
                              ),
                              const SizedBox(height: 5),
                              Row(
                                children: [
                                  const Chip(
                                    padding: EdgeInsets.all(4),
                                    label: Text('Progress'),
                                    backgroundColor: Colors.white,
                                    side: BorderSide(color: Colors.green),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(19))),
                                  ),
                                  const Expanded(child: SizedBox()),
                                  IconButton(
                                      onPressed: _onTapEditButton,
                                      icon: const Icon(Icons.edit,
                                          color: Colors.green)),
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.delete,
                                        color: Colors.red),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 5);
                },
                itemCount: 10,
              ),
            )
          ],
        ),
      ),
    );
  }

  void _onTapAddFab() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const AddNewTask()));
  }

  void _onTapEditButton() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Are you Sure?'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
                children:
                    ['New', 'Completed', 'Cancelled', ' Progress'].map((e) {
              return ListTile(
                onTap: (){},
                title: Text(e),
              );
            }).toList()),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Cancel')),
              TextButton(onPressed: () {}, child: const Text('Okay')),
            ],
          );
        });
  }
}

class TaskSummeryFunction extends StatelessWidget {
  const TaskSummeryFunction({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        TaskSummaryCard(
          count: 8,
          title: 'New Added',
        ),
        TaskSummaryCard(
          count: 10,
          title: 'Completed',
        ),
        TaskSummaryCard(
          count: 15,
          title: 'Cancelled',
        ),
        TaskSummaryCard(
          count: 6,
          title: 'Progress',
        ),
      ],
    );
  }
}
