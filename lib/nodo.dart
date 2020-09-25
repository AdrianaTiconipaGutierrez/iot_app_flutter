class Nodo {
  final double temperatura;
  final double humedad;
  final double nivelDioxidoCarbono;

  Nodo({this.temperatura, this.humedad, this.nivelDioxidoCarbono});

  factory Nodo.fromJson(Map<dynamic, dynamic> json) {
    double parser(dynamic source) {
      try {
        return double.parse(source.toString());
      } on FormatException {
        return -1;
      }
    }

    return Nodo(
      temperatura: parser(json['temperatura']),
      humedad: parser(json['humedad']),
      nivelDioxidoCarbono: parser(json['nivelDioxidoCarbono']),
    );
  }
}
