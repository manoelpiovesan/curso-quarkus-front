import 'package:flutter/material.dart';
import 'package:quarkus_front/consumers/transaction_consumer.dart';

class TransactionCreateView extends StatefulWidget {
  const TransactionCreateView({super.key});

  @override
  State<TransactionCreateView> createState() => _TransactionCreateViewState();
}

class _TransactionCreateViewState extends State<TransactionCreateView> {
  final TransactionConsumer _transactionConsumer = TransactionConsumer();
  String chave = '';
  int valor = 0;
  String cidadeRemetente = '';
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Criar transação'),
      ),
      body: Center(
        child: Card(
          child: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextFormField(
                    onSaved: (String? value) => chave = value!,
                    decoration: const InputDecoration(
                      labelText: 'Chave',
                    ),
                  ),
                  TextFormField(
                    onSaved: (String? value) => valor = int.parse(value!),
                    decoration: const InputDecoration(
                      labelText: 'Valor',
                    ),
                  ),
                  TextFormField(
                    onSaved: (String? value) => cidadeRemetente = value!,
                    decoration: const InputDecoration(
                      labelText: 'Cidade remetente',
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: createTransaction,
                    child: const Text('Criar'),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> createTransaction() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      await _transactionConsumer.create(chave, valor, cidadeRemetente);
      Navigator.of(context).pop();
    }
  }
}
