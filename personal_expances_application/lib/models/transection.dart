import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class Transection {
  final String id;
  final String title;
  final double amount;
  DateTime date;

  Transection({
    @required this.id = "1",
    @required this.title = "hello",
    @required this.amount = 0,
    DateTime? date,
  }) : this.date = DateTime.now();
}
