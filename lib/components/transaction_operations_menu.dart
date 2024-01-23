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
      ],
    );
  }

  Future<bool> approve() async {
    bool response =
        await _transactionConsumer.approveTransaction(widget.transaction.id);
    setState(() {});
    return response;
  }
}
