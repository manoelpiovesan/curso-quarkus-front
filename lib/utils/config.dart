class Config {
  static const String backUri = 'http://localhost:8080/';

  static final String transactionListPath =
      <String>['v1', 'pix', 'transacoes'].join('/');

  static final String transactionCreatePath =
      <String>['v1', 'pix', 'linha'].join('/');
}
