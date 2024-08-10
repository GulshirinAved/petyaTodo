import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:petya/screns/home/home_screen.dart';

void main() {
  runApp(Todo_List());
}

// ignore: must_be_immutable, camel_case_types
class Todo_List extends StatelessWidget {
  Todo_List({super.key});
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 74, 26, 172),
      ),
      home: const HomeScreen(), // Your main app screen
    );
  }
}
