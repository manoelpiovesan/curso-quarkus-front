import 'package:flutter/material.dart';
import 'package:quarkus_front/consumers/transaction_consumer.dart';

class TransactionList extends StatefulWidget {
  const TransactionList({super.key});

  @override
  State<TransactionList> createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  final TransactionConsumer _transactionConsumer = TransactionConsumer();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(future: _transactionConsumer.list(), builder: (BuildContext context, AsyncSnapshot snapshot) {
      if (snapshot.hasData) {
        return ListView.builder(
          itemCount: snapshot.data.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(snapshot.data[index].chave),
              subtitle: Text(snapshot.data[index].data),
            );
          },
        );
      } else if (snapshot.hasError) {
        return Text('${snapshot.error}');
      }
      return const CircularProgressIndicator();
    });
  }
}
