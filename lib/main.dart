//import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:quiz_app/pages/question-page.dart';
//import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

 
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home:QuestionPage() ,
    );
  }
}


