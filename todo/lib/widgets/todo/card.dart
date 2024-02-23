import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myapp/gen/assets.gen.dart';
import 'package:myapp/src/theme/colors.dart';
import 'package:myapp/widgets/button/text_button.dart';
import 'package:myapp/widgets/card/card.dart';

class TodoCard extends StatelessWidget {
  final String task;
  final bool completed;
  final VoidCallback onDelete;
  final VoidCallback onEdit;

  const TodoCard({
    super.key,
    required this.task,
    this.completed = false,
    required this.onDelete,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return XCard(
      borderColor: AppColors.grayBorder,
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 0),
      child: ListTile(
        leading: Checkbox(
          value: completed,
          onChanged: (value) {},
        ),
        title: Text(
          task,
          style: TextStyle(
            decoration: completed ? TextDecoration.lineThrough : null,
            fontWeight: FontWeight.bold,
          ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            XTextButton(
              icon: SvgPicture.asset(Assets.svgs.edit),
              onPressed: onEdit,
              buttonStyle: ButtonStyle(
                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                  const EdgeInsets.all(0),
                ),
                elevation: MaterialStateProperty.all<double>(0),
              ),
            ),
            XTextButton(
              icon: SvgPicture.asset(Assets.svgs.trash),
              onPressed: onDelete,
              buttonStyle: ButtonStyle(
                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                  const EdgeInsets.all(0),
                ),
                elevation: MaterialStateProperty.all<double>(0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
