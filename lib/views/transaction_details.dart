import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
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
        title: const Text('Detalhes da transação'),
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
                    trailing: IconButton(
                      icon: const Icon(Icons.copy),
                      onPressed: () {
                        Clipboard.setData(
                          ClipboardData(text: widget.transaction.id),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('ID copiado!'),
                          ),
                        );
                      },
                    ),
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
                    subtitle: Text(
                      NumberFormat.currency(locale: 'pt_BR', symbol: r'R$')
                          .format(widget.transaction.valor),
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.date_range),
                    title: const Text('Data'),
                    subtitle: Text(widget.transaction.data),
                  ),
                  ListTile(
                    leading: const Icon(Icons.segment),
                    title: const Text('Linha digitável', overflow: TextOverflow.ellipsis,),
                    subtitle: Text(widget.transaction.linha),
                    trailing:IconButton(
                      icon: const Icon(Icons.copy),
                      onPressed: () {
                        Clipboard.setData(
                          ClipboardData(text: widget.transaction.linha),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Linha digitável copiada!'),
                          ),
                        );
                      },
                    ),
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
                  Image.network(
                    '${Config.backUri}/v1/pix/${widget.transaction.id}/qrcode',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            TransactionOperationsMenu(transaction: widget.transaction),
            const SizedBox(
              height: 20,
            ),

          ],
        ),
      ),
    );
  }
}
