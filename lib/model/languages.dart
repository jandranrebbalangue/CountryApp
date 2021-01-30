class Languages {
  String name;
  String nativeName;
  String iso639_1;
  String iso639_2;
  Languages({this.iso639_1, this.iso639_2, this.name, this.nativeName});
  factory Languages.fromJson(Map<String, dynamic> json) => Languages(
      iso639_1: json['iso639_1'],
      iso639_2: json['iso639_2'],
      name: json['name'],
      nativeName: json['nativeName']);
}
