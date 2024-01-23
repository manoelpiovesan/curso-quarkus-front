import 'package:flutter/material.dart';
import 'package:quarkus_front/components/transaction_operations_menu.dart';
import 'package:quarkus_front/enums/statuspix_enum.dart';
import 'package:quarkus_front/models/transaction_model.dart';
import 'package:quarkus_front/utils/config.dart';

class TransactionDetails extends StatefulWidget {
  final Transaction transaction;

  const TransactionDetails({required this.transaction, super.key});

  @override
  State<TransactionDetails> createState() => _TransactionDetailsState();
}

class _TransactionDetailsState extends State<TransactionDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes da transação - ${widget.transaction.id}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    leading: const Icon(Icons.tag),
                    title: const Text('ID'),
                    subtitle: Text(widget.transaction.id),
                  ),
                  ListTile(
                    leading: const Icon(Icons.key),
                    title: Text(
                      'Chave (${widget.transaction.tipoChave.name})',
                    ),
                    subtitle: Text(widget.transaction.chave),
                  ),
                  ListTile(
                    leading: const Icon(Icons.monetization_on),
                    title: const Text('Valor'),
                    subtitle: Text(widget.transaction.valor.toString()),
                  ),
                  ListTile(
                    leading: const Icon(Icons.date_range),
                    title: const Text('Data'),
                    subtitle: Text(widget.transaction.data),
                  ),
                  ListTile(
                    leading: const Icon(Icons.copy),
                    title: const Text('Linha digitável'),
                    subtitle: Text(widget.transaction.linha),
                  ),
                  ListTile(
                    leading: Icon(
                      StatusPixConverter.icon(
                        widget.transaction.statusPix,
                      ),
                      color: StatusPixConverter.color(
                        widget.transaction.statusPix,
                      ),
                    ),
                    title: const Text('Status'),
                    subtitle: Text(
                      widget.transaction.statusPix.name,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            TransactionOperationsMenu(transaction: widget.transaction),
            const SizedBox(
              height: 20,
            ),
            Card(
              child: Image.network(
                '${Config.backUri}/v1/pix/${widget.transaction.id}/qrcode',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
