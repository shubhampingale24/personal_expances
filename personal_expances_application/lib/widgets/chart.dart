import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../models/transection.dart';
import 'package:intl/intl.dart';
import './chart_bar.dart';

class Chart extends StatelessWidget {
  // const Chart({super.key});

  final List<Transection> recentTransection;
  Chart(this.recentTransection);
  List<Map<String, Object>> get groupedTransection {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );
      var totalSum = 0.0;
      for (var i = 0; i < recentTransection.length; i++) {
        if (recentTransection[i].date.day == weekDay.day &&
            recentTransection[i].date.month == weekDay.month &&
            recentTransection[i].date.year == weekDay.year) {
          totalSum = recentTransection[i].amount;
        }
      }
      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': totalSum
      };
    });
  }

  double get maxSpeanding {
    return groupedTransection.fold(0.0, (sum, item) {
      return sum + (item['amount'] as double);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: groupedTransection.map((data) {
              return Flexible(
                fit: FlexFit.tight,
                child: ChartBar(
                    (data['day'] as String),
                    (data['amount'] as double),
                    maxSpeanding == 0.0
                        ? 0.0
                        : (data['amount'] as double) / maxSpeanding),
              );
            }).toList()),
      ),
    );
  }
}
