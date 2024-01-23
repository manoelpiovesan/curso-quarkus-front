///
///
///
enum TipoChave {
  CPF, CNPJ, EMAIL, TELEFONE;
}

///
///
///
class TipoChaveConverter {
  static TipoChave fromString(String tipoChave) {
    switch (tipoChave) {
      case 'CPF':
        return TipoChave.CPF;
      case 'CNPJ':
        return TipoChave.CNPJ;
      case 'EMAIL':
        return TipoChave.EMAIL;
      case 'TELEFONE':
        return TipoChave.TELEFONE;
      default:
        return TipoChave.CPF;
    }
  }
  static String toText(TipoChave tipoChave) {
    switch (tipoChave) {
      case TipoChave.CPF:
        return 'CPF';
      case TipoChave.CNPJ:
        return 'CNPJ';
      case TipoChave.EMAIL:
        return 'EMAIL';
      case TipoChave.TELEFONE:
        return 'TELEFONE';
      default:
        return 'CPF';
    }
  }
}