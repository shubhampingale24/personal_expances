import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import "package:intl/intl.dart";
import '../models/transection.dart';

class TransectionList extends StatelessWidget {
  final List<Transection> transection;
  TransectionList(this.transection);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: transection.isEmpty
          ? Column(
              children: [
                Container(
                    height: 200,
                    child: Image(
                      image: AssetImage("assets/img/add_data.jpg"),
                      fit: BoxFit.cover,
                    )),
                Text(
                  "Add Product First",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            )
          : ListView(
              children: transection.map(((tx) {
                return Card(
                  child: Row(
                    children: [
                      Container(
                        // color: Colors.purple,
                        padding: EdgeInsets.all(25),
                        margin:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.purple, width: 3),
                          // borderRadius: BorderRadius. circular(50),
                          // color: Colors.purple,
                        ),

                        child: Text(
                          ("\$ ${tx.amount}").toString(),
                          style: TextStyle(
                              color: Colors.purple,
                              fontSize: 18,
                              // backgroundColor: Colors.purple,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Flexible(
                        fit: FlexFit.tight,
                        flex: 2,
                        child: Container(
                          padding: EdgeInsets.only(top: 10, bottom: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                tx.title,
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              Text(
                                DateFormat().format(tx.date),
                                style: TextStyle(
                                    fontSize: 15,
                                    // fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                );
              })).toList(),
            ),
    );
  }
}
