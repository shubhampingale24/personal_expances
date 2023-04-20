import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import "package:intl/intl.dart";
import './widgets/chart.dart';
import './widgets/new_transection.dart';
import './widgets/transection_list.dart';
import './models/transection.dart';

void main(List<String> args) {
  runApp(ExpenceApp());
}

class ExpenceApp extends StatelessWidget {
  const ExpenceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Expance Application",
      theme: ThemeData(
        primarySwatch: Colors.purple,
        primaryColor: Colors.purple,
        accentColor: Colors.amberAccent,
        textTheme: ThemeData.light().textTheme.copyWith(
              titleMedium: TextStyle(
                  fontFamily: "MarkoOne", fontSize: 25, color: Colors.purple),
            ),
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light()
              .textTheme
              .copyWith(titleLarge: TextStyle(fontFamily: "Chewy")),
        ),
      ),
      home: MyApp(),
    );
  }
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // const MyApp({super.key});

  final List<Transection> _usertransection = [
    Transection(
      id: "t1",
      title: "Shoe",
      amount: 550.0,
      date: DateTime.now(),
    ),
    // Transection(
    //   id: "t2",
    //   title: "Watch",
    //   amount: 5000.0,
    //   date: DateTime.now(),
    // ),
    // Transection(
    //   id: "t2",
    //   title: "bike",
    //   amount: 2000.0,
    //   date: DateTime.now(),
    // ),
    // Transection(
    //   id: "t2",
    //   title: "book",
    //   amount: 300.0,
    //   date: DateTime.now(),
    // ),
    // Transection(
    //   id: "t2",
    //   title: "travel",
    //   amount: 50000.0,
    //   date: DateTime.now(),
    // ),
  ];

  List<Transection> get _recentTransection {
    return _usertransection.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

  void _addNewTransection(String txtitle, double txamount, DateTime txDate) {
    // print("Todays date : $Txdate");
    var newTx = Transection(
        title: txtitle,
        amount: txamount,
        date: txDate,
        id: DateTime.now().toString());

    setState(() {
      _usertransection.add(newTx);
    });
  }

  void _startAddNewTransection(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
            onTap: (() {}),
            child: NewTransection(_addNewTransection),
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  void _deleteTransection(String id) {
    setState(() {
      _usertransection.removeWhere((tx) => tx.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expence App"),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _startAddNewTransection(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Chart(_recentTransection),
              TransectionList(_usertransection, _deleteTransection)
            ]),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startAddNewTransection(context),
      ),
    );
  }
}
