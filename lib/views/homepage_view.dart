import 'package:flutter/material.dart';
import 'package:quarkus_front/views/lists/transaction_list.dart';
import 'package:quarkus_front/views/transaction_create_view.dart';

class HomepageView extends StatefulWidget {
  const HomepageView({super.key});

  @override
  State<HomepageView> createState() => _HomepageViewState();
}

class _HomepageViewState extends State<HomepageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
              onPressed: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute<Widget>(
                    builder: (BuildContext context) =>
                        const TransactionCreateView(),
                  ),
                );
                setState(() {});
              },
              icon: const Icon(Icons.pix)),
          IconButton(onPressed: refresh, icon: const Icon(Icons.refresh)),
        ],
        title: const Text('Transactions'),
      ),
      body: const TransactionList(),
    );
  }

  void refresh() {
    setState(() {});
  }
}
