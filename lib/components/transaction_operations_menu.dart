import 'package:flutter/material.dart';
import 'package:quarkus_front/consumers/transaction_consumer.dart';
import 'package:quarkus_front/models/transaction_model.dart';

class TransactionOperationsMenu extends StatefulWidget {
  final Transaction transaction;

  const TransactionOperationsMenu({required this.transaction, super.key});

  @override
  State<TransactionOperationsMenu> createState() =>
      _TransactionOperationsMenuState();
}

class _TransactionOperationsMenuState extends State<TransactionOperationsMenu> {
  final TransactionConsumer _transactionConsumer = TransactionConsumer();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
          ),
          onPressed: approve,
          child: const Padding(
            padding: EdgeInsets.all(8),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Icon(Icons.check),
                SizedBox(
                  width: 5,
                ),
                Text('Aprovar'),
              ],
            ),
          ),
        ),
        const SizedBox(width: 20),
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(Colors.red.shade800),
          ),
          onPressed: reprove,
          child: const Padding(
            padding: EdgeInsets.all(8),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Icon(Icons.close),
                SizedBox(
                  width: 5,
                ),
                Text('Reprovar'),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Future<bool> approve() async {
    bool response =
        await _transactionConsumer.approveTransaction(widget.transaction.id);
    Navigator.pop(context);
    return response;
  }

  Future<bool> reprove() async {
    bool response =
        await _transactionConsumer.reproveTransaction(widget.transaction.id);
    Navigator.pop(context);
    return response;
  }
}
