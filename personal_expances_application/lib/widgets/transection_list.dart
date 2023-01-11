import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import "package:intl/intl.dart";
import '../models/transection.dart';

class TransectionList extends StatelessWidget {
  final List<Transection> transection;
  final Function deleteTx;
  TransectionList(this.transection, this.deleteTx);
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
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                  elevation: 7.0,
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: FittedBox(
                            child: Text(
                          '\$ ${transection[index].amount}',
                          style: TextStyle(fontWeight: FontWeight.w400),
                        )),
                      ),
                    ),
                    title: Text(
                      transection[index].title,
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: "EricaOne",
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                        DateFormat.yMMMd().format(transection[index].date)),
                    trailing: IconButton(
                      icon: new Icon(Icons.delete),
                      color: Theme.of(context).errorColor,
                      onPressed: () => deleteTx(transection[index].id),
                    ),
                  ),
                );
              },
              itemCount: transection.length,
            ),
    );
  }
}
