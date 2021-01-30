class Currencies {
  String name;
  String code;
  String symbol;
  Currencies({this.code, this.name, this.symbol});
  factory Currencies.fromJson(Map<String, dynamic> json) => Currencies(
      code: json['code'], name: json['name'], symbol: json['symbol']);
}
