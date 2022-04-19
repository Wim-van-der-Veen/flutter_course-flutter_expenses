import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionNew extends StatefulWidget {
  final Function _handleNew;
  const TransactionNew(this._handleNew, {Key? key}) : super(key: key);

  @override
  State<TransactionNew> createState() => _TransactionNewState();
}

class _TransactionNewState extends State<TransactionNew> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;

  void submitData() {
    final title = _titleController.text;
    final amount = double.parse(_amountController.text);
    final date = _selectedDate;

    if (title.isEmpty || amount <= 0 || date == null) return;

    widget._handleNew(title, amount, date);

    Navigator.of(context).pop();
  }

  void _showDatePicker(BuildContext context) {
    final lastDate = DateTime.now();
    final firstDate = DateTime(lastDate.year, lastDate.month, lastDate.day - 6);
    final initialDate = DateTime(lastDate.year, lastDate.month, lastDate.day);
    showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
    ).then((chosenDate) {
      if (chosenDate == null) return;
      setState(() {
        _selectedDate = chosenDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.fromLTRB(
            12,
            6,
            12,
            MediaQuery.of(context).viewInsets.bottom + 6,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextField(
                decoration: const InputDecoration(labelText: 'Title'),
                controller: _titleController,
                onSubmitted: (_) => submitData(),
                // onChanged: _onChangedTitle,
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Amount'),
                controller: _amountController,
                keyboardType: TextInputType.number,
                onSubmitted: (_) => submitData(),
                // onChanged: _onChangedAmount,
              ),
              TextButton(
                child: Row(
                    children: _selectedDate == null
                        ? <Widget>[
                            const Spacer(),
                            const Text('choose date'),
                          ]
                        : <Widget>[
                            Text(
                              DateFormat.yMMMd().format(_selectedDate!),
                            ),
                            const Spacer()
                          ]),
                style: _selectedDate == null
                    ? TextButton.styleFrom(
                        primary: Colors.purple,
                        textStyle: const TextStyle(fontWeight: FontWeight.bold),
                      )
                    : TextButton.styleFrom(
                        primary: Theme.of(context).colorScheme.secondary,
                        textStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                onPressed: () => _showDatePicker(context),
              ),
              TextButton(
                child: const Text('Add Transaction'),
                style: TextButton.styleFrom(primary: Colors.purple),
                onPressed: submitData,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
