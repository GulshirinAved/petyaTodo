import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petya/model/task.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';
import 'package:petya/screns/home/home_controller.dart';

class Addnew extends StatefulWidget {
  const Addnew({super.key});
  @override
  State<Addnew> createState() => AddNewScreen();
}

class AddNewScreen extends State<Addnew> {
  final HomeScreenController homecontroller = Get.put(HomeScreenController());
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController titleController = TextEditingController();
  DateFormat formatter = DateFormat('dd.MM');
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: Get.height,
                height: Get.height / 9,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/header2.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(
                        Icons.close,
                        size: 40,
                        color: Colors.white,
                      ),
                    ),
                    const Expanded(
                      child: Text(
                        "Add new task",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Gilroy',
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 60),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: titleController,
                                decoration: InputDecoration(
                                    labelText: "Task Title",
                                    labelStyle: const TextStyle(
                                      color: Color.fromARGB(255, 47, 47, 47),
                                      fontFamily: 'Raleway',
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: const BorderSide(
                                        color:
                                            Color.fromARGB(255, 106, 29, 206),
                                        width: 2.0,
                                      ),
                                    ),
                                    fillColor: Colors.grey[100]),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Task title cannot be empty';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                const Text(
                                  "Date",
                                  style: TextStyle(
                                    fontFamily: 'Raleway',
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: IconButton(
                                    onPressed: () async {
                                      // Use showDatePicker instead of showTimePicker
                                      DateTime? pickedDate =
                                          await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(2000),
                                        lastDate: DateTime(2100),
                                      );

                                      if (pickedDate != null) {
                                        // Update the text field with the selected date in a formatted string
                                        dateController.text = pickedDate
                                            .toString()
                                            .split(' ')
                                            .first; // Get only the date part
                                      }
                                    },
                                    icon: const Icon(
                                      Icons.calendar_today,
                                      size: 40,
                                      color: Color.fromARGB(255, 106, 29, 206),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                const Text(
                                  "Time",
                                  style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontFamily: 'Raleway',
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: IconButton(
                                    onPressed: () async {
                                      TimeOfDay? pickedTime =
                                          await showTimePicker(
                                        context: context,
                                        initialTime: TimeOfDay.now(),
                                      );

                                      if (pickedTime != null) {
                                        // Format the TimeOfDay object to a String in HH:mm format
                                        final formattedTime =
                                            // ignore: use_build_context_synchronously
                                            pickedTime.format(context);
                                        timeController.text = formattedTime;
                                      }
                                    },
                                    icon: const Icon(
                                      Icons.timelapse,
                                      size: 40,
                                      color: Color.fromARGB(255, 106, 29, 206),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 60),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: descriptionController,
                                maxLines: 5,
                                decoration: InputDecoration(
                                    labelText: " Description ",
                                    labelStyle: const TextStyle(
                                      color: Color.fromARGB(255, 47, 47, 47),
                                      fontFamily: 'Raleway',
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: const BorderSide(
                                        color:
                                            Color.fromARGB(255, 106, 29, 206),
                                        width: 2.0,
                                      ),
                                    ),
                                    fillColor: Colors.grey[100]),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Task title cannot be empty';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 30),
                      child: ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            // Form geçerliyse yeni bir görev oluşturun ve addNewTask'a geçirin
                            Task newTask = Task(
                              title: titleController.text,
                              date: dateController.text,
                              time: timeController.text,
                              description: descriptionController.text,
                            );
                            homecontroller.addNewTask(newTask);
                            Navigator.of(context).pop();
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 106, 29, 206),
                          minimumSize: const Size(200, 50),
                        ),
                        child: const Text(
                          "Save",
                          style: TextStyle(
                              fontFamily: 'Gilroy',
                              fontWeight: FontWeight.normal,
                              fontSize: 18,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
