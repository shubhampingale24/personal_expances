import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransection extends StatefulWidget {
  // const NewTransection({super.key});
  final Function addTx;

  NewTransection(this.addTx);

  @override
  State<NewTransection> createState() => _NewTransectionState();
}

class _NewTransectionState extends State<NewTransection> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _selectDate = DateTime.now();

  void _submitData() {
    if (_amountController.text.isEmpty) {
      return;
    }
    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);
    final selectedDate = _selectDate;
    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }
    print(selectedDate);
    widget.addTx(enteredTitle, enteredAmount, selectedDate);
    Navigator.of(context).pop();
  }

  void _getDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((PickedDate) {
      if (PickedDate == null) {
        return;
      }
      // print("$PickedDate");
      setState(() {
        _selectDate = PickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Title',
              ),
              controller: _titleController,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: _amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => _submitData,
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: Text(_selectDate == null
                          ? "No Date Choosen!"
                          : "Picked Date : ${DateFormat.yMMMd().format(_selectDate)}"
                      // style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                      ),
                ),
                TextButton(
                  onPressed: _getDatePicker,
                  child: Text(
                    "Choose date",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
            ElevatedButton(
              onPressed: _submitData,
              child: Text(
                "Add Transection",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
