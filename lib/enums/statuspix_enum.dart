///
///
///
enum StatusPix {
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
        return StatusPix.CREATED;
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
      default:
        return 'CREATED';
    }
  }
}