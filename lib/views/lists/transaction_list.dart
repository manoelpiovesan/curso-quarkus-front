import 'package:flutter/material.dart';
import 'package:quarkus_front/consumers/transaction_consumer.dart';
import 'package:quarkus_front/enums/statuspix_enum.dart';
import 'package:quarkus_front/models/transaction_model.dart';
import 'package:quarkus_front/views/transaction_details.dart';

class TransactionList extends StatefulWidget {
  const TransactionList({super.key});

  @override
  State<TransactionList> createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  final TransactionConsumer _transactionConsumer = TransactionConsumer();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Transaction>>(
      future: _transactionConsumer.list(),
      builder:
          (BuildContext context, AsyncSnapshot<List<Transaction>> snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(snapshot.data![index].chave),
                subtitle: Text(snapshot.data![index].data),
                leading:  Icon(Icons.pix, color: StatusPixConverter.color(snapshot.data![index].statusPix),),
                onTap: () async{
                  await Navigator.push(
                    context,
                    MaterialPageRoute<Widget>(
                      builder: (BuildContext context) => TransactionDetails(
                        transaction: snapshot.data![index],
                      ),
                    ),
                  );
                  setState(() {});
                },
              );
            },
          );
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }
        return const CircularProgressIndicator();
      },
    );
  }
}
