// ignore_for_file: constant_identifier_names
import 'package:flutter/material.dart';

///
///
///
enum StatusPix {
  UNDEFINED, //Status não definido.

  CREATED, //Transação criada, não finalizada.

  IN_PROCESS, //Transação em processo, não finalizada.

  APPROVED, //Transação aprovada, não finalizada.

  REPROVED, //Transação reprovada, não finalizada.

  DONE, // Transação concluída com sucesso.

  UNDONE, // A transação não pôde ser concluída. O valor foi estornado.

  CANCELED; // A transação foi cancelada. O saldo não foi afetado.
}

///
///
///
class StatusPixConverter {
  static StatusPix fromString(String value) {
    switch (value) {
      case 'CREATED':
        return StatusPix.CREATED;
      case 'IN_PROCESS':
        return StatusPix.IN_PROCESS;
      case 'APPROVED':
        return StatusPix.APPROVED;
      case 'REPROVED':
        return StatusPix.REPROVED;
      case 'DONE':
        return StatusPix.DONE;
      case 'UNDONE':
        return StatusPix.UNDONE;
      case 'CANCELED':
        return StatusPix.CANCELED;
      default:
        return StatusPix.UNDEFINED;
    }
  }

  static String toStringValue(StatusPix value) {
    switch (value) {
      case StatusPix.CREATED:
        return 'CREATED';
      case StatusPix.IN_PROCESS:
        return 'IN_PROCESS';
      case StatusPix.APPROVED:
        return 'APPROVED';
      case StatusPix.REPROVED:
        return 'REPROVED';
      case StatusPix.DONE:
        return 'DONE';
      case StatusPix.UNDONE:
        return 'UNDONE';
      case StatusPix.CANCELED:
        return 'CANCELED';
      case StatusPix.UNDEFINED:
        return 'UNDEFINED';
    }
  }

  static MaterialColor color(StatusPix value) {
    switch (value) {
      case StatusPix.CREATED:
        return Colors.blue;
      case StatusPix.IN_PROCESS:
        return Colors.yellow;
      case StatusPix.APPROVED:
        return Colors.green;
      case StatusPix.REPROVED:
        return Colors.red;
      case StatusPix.DONE:
        return Colors.green;
      case StatusPix.UNDONE:
        return Colors.red;
      case StatusPix.CANCELED:
        return Colors.red;
      case StatusPix.UNDEFINED:
        return Colors.grey;
    }
  }

  static IconData icon(StatusPix value){
    switch (value) {
      case StatusPix.CREATED:
        return Icons.create;
      case StatusPix.IN_PROCESS:
        return Icons.timer;
      case StatusPix.APPROVED:
        return Icons.check_circle;
      case StatusPix.REPROVED:
        return Icons.close_outlined;
      case StatusPix.DONE:
        return Icons.check;
      case StatusPix.UNDONE:
        return Icons.close_outlined;
      case StatusPix.CANCELED:
        return Icons.close_outlined;
      case StatusPix.UNDEFINED:
        return Icons.help;
    }
  }
}
