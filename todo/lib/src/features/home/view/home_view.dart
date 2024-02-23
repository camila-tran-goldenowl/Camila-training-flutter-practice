import 'package:flutter/material.dart';
import 'package:myapp/src/dialogs/widget/alert_dialog.dart';
import 'package:myapp/src/features/home/widgets/intro.dart';
import 'package:myapp/src/features/home/widgets/todo_list.dart';
import 'package:myapp/src/router/coordinator.dart';
import 'package:myapp/src/theme/colors.dart';
import 'package:myapp/widgets/button/text_button.dart';
import 'package:myapp/widgets/todo/card.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key});

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
          TodoList(),
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
          title: "Create new task",
          onPressed: () => AppCoordinator.showCreateNewTask(),
        ),
      ),
    );
  }
}
