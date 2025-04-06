import 'package:expense_tracker_app1/screens/home/views/home_screen.dart';
import 'package:flutter/material.dart';

class MyAppView extends StatelessWidget {
  const MyAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Expense Tracker",
      theme: ThemeData(
        colorScheme: ColorScheme.light(
          surface: Colors.grey.shade200,
          onSurface: Colors.blue,
         primary: Color.fromARGB(255, 16, 151, 189), 
         secondary: Color.fromARGB(255, 225, 167, 236),
          tertiary: const Color.fromARGB(255, 245, 146, 117),
          outline: Colors.grey.shade600,
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
