import 'package:flutter/material.dart';
import 'package:quarkus_front/views/lists/transaction_list.dart';

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
        title: const Text('Quarkus front'),
      ),
      body: const TransactionList(),
    );
  }
}
