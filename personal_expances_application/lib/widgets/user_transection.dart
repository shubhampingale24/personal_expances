import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import './transection_list.dart';
import './new_transection.dart';
import '../models/transection.dart';

class UserTransection extends StatefulWidget {
  const UserTransection({super.key});

  @override
  State<UserTransection> createState() => _UserTransectionState();
}

class _UserTransectionState extends State<UserTransection> {
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
  ];

  void _addNewTransection(String txtitle, double txamount) {
    final newTx = Transection(
        title: txtitle,
        amount: txamount,
        date: DateTime.now(),
        id: DateTime.now().toString());

    setState() {
      _usertransection.add(newTx);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransection(_addNewTransection),
        TransectionList(_usertransection),
      ],
    );
  }
}
