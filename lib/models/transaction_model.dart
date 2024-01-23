import 'package:quarkus_front/enums/statuspix_enum.dart';
import 'package:quarkus_front/enums/tipo_chave_enum.dart';

class Transaction {
  final String id;
  final TipoChave tipoChave;
  final String chave;
  final String linha;
  final String data;
  final int valor;
  StatusPix statusPix;

  ///
  ///
  ///
  Transaction({
    required this.id,
    required this.tipoChave,
    required this.chave,
    required this.linha,
    required this.data,
    required this.valor,
    required this.statusPix,
  });

  ///
  ///
  ///
  Transaction.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        tipoChave = TipoChaveConverter.fromString(json['tipoChave']),
        chave = json['chave'],
        linha = json['linha'],
        data = json['data'],
        valor = json['valor'],
        statusPix = StatusPixConverter.fromString(json['status']);

  ///
  ///
  ///
  Map<String, dynamic> toMap() => <String, dynamic>{
        'id': id,
        'tipoChave': tipoChave,
        'chave': chave,
        'linha': linha,
        'data': data,
        'valor': valor,
        'statusPix': statusPix,
      };
}
