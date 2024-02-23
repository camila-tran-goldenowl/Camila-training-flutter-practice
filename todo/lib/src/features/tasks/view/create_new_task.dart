import 'package:flutter/material.dart';
import 'package:myapp/src/theme/colors.dart';
import 'package:myapp/src/router/coordinator.dart';
import 'package:myapp/widgets/button/text_button.dart';
import 'package:myapp/src/features/home/widgets/intro.dart';

class CreateNewTaskView extends StatelessWidget {
  const CreateNewTaskView({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Intro(),
          SizedBox(
            width: 30,
          ),
          // TodoList(todos: [
          //   'Task 1',
          //   'Task 2',
          //   'Task 3',
          // ]),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
        child: XTextButton(
          buttonStyle: ButtonStyle(
            elevation: MaterialStateProperty.all<double>(0),
            backgroundColor: MaterialStateProperty.all<Color>(AppColors.purple),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                    10), // Adjust the border radius as needed
              ),
            ),
          ),
          title: "Save",
          onPressed: () => AppCoordinator.showHomeScreen(),
        ),
      ),
    );
  }
}
