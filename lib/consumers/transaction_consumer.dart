import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:quarkus_front/models/transaction_model.dart';
import 'package:quarkus_front/utils/config.dart';

///
///
///
class TransactionConsumer {
  ///
  ///
  ///
  Future<List<Transaction>> list() async {
    http.Response response = await http.get(
      Uri.parse(
        '${Config.backUri}${Config.transactionListPath}?dataInicio=2021-01-01&dataFim=2025-12-31',
      ),
    );

    if (response.statusCode == 200) {
      List<Transaction> transactions = <Transaction>[];
      List<dynamic> body = json.decode(response.body);
      body
          .map((dynamic e) => transactions.add(Transaction.fromJson(e)))
          .toList();
      return transactions;
    }

    throw Exception('Failed to load transactions');
  }

  ///
  ///
  ///
  Future<bool> approveTransaction(String id) async {
    http.Response response = await http.patch(
      Uri.parse(
        '${Config.backUri}/v1/pix/$id/aprovar',
      ),
    );

    if (response.statusCode == 200) {
      return true;
    }

    return false;
  }
}
