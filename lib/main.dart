import 'package:flutter/material.dart';

import 'screens/home_screen.dart';

void main() {
  runApp(LabWork());
}

class LabWork extends StatelessWidget {
  const LabWork({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
