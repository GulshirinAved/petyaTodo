import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petya/model/task.dart';
import 'package:petya/screns/home/home_controller.dart';

class Todoitem extends StatefulWidget {
  final Task task;
  Todoitem({super.key, required this.task});

  @override
  State<Todoitem> createState() => TodoitemState();
}

class TodoitemState extends State<Todoitem> {
  final HomeScreenController homecontroller = Get.put(HomeScreenController());

  @override
  Widget build(BuildContext context) {
    return Card(
      color: widget.task.isCompleted
          ? const Color.fromARGB(255, 112, 58, 224)
          : const Color.fromARGB(255, 255, 255, 255),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        leading: Checkbox(
          activeColor: const Color.fromARGB(255, 100, 35, 186),
          value: widget.task.isCompleted,
          onChanged: (value) {
            homecontroller.onChanged(widget.task);
          },
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.task.date,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  widget.task.time,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              widget.task.title,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
          ],
        ),
        trailing: IconButton(
          iconSize: 24,
          icon: const Icon(Icons.delete),
          onPressed: () {
            homecontroller.deleteTask(widget.task);
          },
        ),
      ),
    );
  }
}
