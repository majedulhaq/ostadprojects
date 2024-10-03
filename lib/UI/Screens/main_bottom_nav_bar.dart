import 'package:flutter/material.dart';
import 'package:ostadprojects/UI/Screens/canceled_task_screen.dart';
import 'package:ostadprojects/UI/Screens/completed_task_screen.dart';
import 'package:ostadprojects/UI/Screens/new_task_screen.dart';
import 'package:ostadprojects/UI/Screens/progress_task_screen.dart';

class MainBottomNavBar extends StatefulWidget {
  const MainBottomNavBar({super.key});

  @override
  State<MainBottomNavBar> createState() => _MainBottomNavBarState();
}

class _MainBottomNavBarState extends State<MainBottomNavBar> {
  int _selectedIndex = 0;
final  List<Widget> _navePagesList = [
    NewTaskScreen(),
    CompletedTaskScreen(),
    CanceledTaskScreen(),
    ProgressTaskScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _navePagesList[_selectedIndex],
      bottomNavigationBar: NavigationBar(
          indicatorColor: Colors.grey[350],
          backgroundColor: Colors.grey[300],
          selectedIndex: _selectedIndex,
          onDestinationSelected: (int index) {
            // _selectedIndex = int.parse('${_navePagesList[index]}');
            _selectedIndex = index;

            setState(() {});
          },
          destinations: const [
            NavigationDestination(
                icon: Icon(
                  Icons.new_label_outlined,
                  color: Colors.green,
                ),
                label: 'New'),
            NavigationDestination(
                icon: Icon(
                  Icons.flatware_rounded,
                  color: Colors.green,
                ),
                label: 'Completed'),
            NavigationDestination(
                icon: Icon(
                  Icons.free_cancellation_outlined,
                  color: Colors.green,
                ),
                label: 'Cancelled'),
            NavigationDestination(
                icon: Icon(
                  Icons.waving_hand_outlined,
                  color: Colors.green,
                ),
                label: 'Progress'),
          ]),
    );
  }
}
