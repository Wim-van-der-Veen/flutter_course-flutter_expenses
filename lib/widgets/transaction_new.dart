import 'package:flutter/material.dart';

class TransactionNew extends StatefulWidget {
  final Function _handleNew;
  const TransactionNew(this._handleNew, {Key? key}) : super(key: key);

  @override
  State<TransactionNew> createState() => _TransactionNewState();
}

class _TransactionNewState extends State<TransactionNew> {
  final _titleController = TextEditingController();

  final _amountController = TextEditingController();

  void submitData() {
    final title = _titleController.text;
    final amount = double.parse(_amountController.text);

    if (title.isEmpty || amount <= 0) return;

    widget._handleNew(title, amount);

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: const EdgeInsets.fromLTRB(12, 6, 12, 6),
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
              child: const Text('Add Transaction'),
              style: TextButton.styleFrom(primary: Colors.purple),
              onPressed: submitData,
            )
          ],
        ),
      ),
    );
  }
}
