import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class listitems extends StatelessWidget {
  final String taskname;
  final bool taskcompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? delete;

  listitems(
      {required this.taskname,
      required this.taskcompleted,
      required this.onChanged,
      required this.delete});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 30,
        ),
        Slidable(
          endActionPane: ActionPane(
            motion: StretchMotion(),
            children: [
              SlidableAction(
                onPressed: delete,
                icon: Icons.delete,
                backgroundColor: Colors.red,
              )
            ],
          ),
          child: Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 12),
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Row(
                children: [
                  Checkbox(
                    value: taskcompleted,
                    onChanged: onChanged,
                    checkColor: Colors.black,
                    activeColor: Colors.white60,
                    shape: CircleBorder(),
                    splashRadius:10,
                  ),
                  Text(
                    taskname,
                    style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.w600,
                        fontSize: 21,
                        decoration: taskcompleted
                            ? TextDecoration.lineThrough
                            : TextDecoration.none),
                  ),
                ],
              ),
            ),
            decoration: BoxDecoration(
                color: Color(0xFF8D8E98),
                borderRadius: BorderRadius.all(Radius.circular(9))),
          ),
        ),
      ],
    );
  }
}
