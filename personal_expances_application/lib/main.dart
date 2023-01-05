import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import "package:intl/intl.dart";
import 'package:personal_expances_application/widgets/user_transection.dart';

void main(List<String> args) {
  runApp(ExpenceApp());
}

class ExpenceApp extends StatelessWidget {
  const ExpenceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Expance Application",
      home: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  // const MyApp({super.key});
  // String titleInput = "";
  // String amountInput = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expence App"),
      ),
      body: SingleChildScrollView(
        child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                width: double.infinity,
                child: Card(
                  color: Colors.amberAccent,
                  child: Text("chart"),
                  elevation: 5,
                ),
              ),
              UserTransection()
            ]),
      ),
    );
  }
}
