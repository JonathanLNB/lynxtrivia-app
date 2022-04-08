import 'dart:convert';

class Pregunta {
  Pregunta({
    this.idpregunta,
    this.pregunta,
    this.opciona,
    this.opcionb,
    this.opcionc,
    this.opciond,
    this.respuesta,
    this.idcategoria,
    this.categoria,
  });

  int idpregunta;
  String pregunta;
  String opciona;
  String opcionb;
  String opcionc;
  String opciond;
  int respuesta;
  int idcategoria;
  String categoria;

  factory Pregunta.fromJson(String str) => Pregunta.fromMap(jsonDecode(str));

  String toJson() => jsonEncode(toMap());

  factory Pregunta.fromMap(Map<String, dynamic> json) => Pregunta(
        idpregunta: json["idpregunta"] ?? null,
        pregunta: json["pregunta"] ?? null,
        opciona: json["opciona"] ?? null,
        opcionb: json["opcionb"] ?? null,
        opcionc: json["opcionc"] ?? null,
        opciond: json["opciond"] ?? null,
        respuesta: json["respuesta"] ?? null,
        idcategoria: json["idcategoria"] ?? null,
        categoria: json["categoria"] ?? null,
      );

  Map<String, dynamic> toMap() => {
        "idpregunta": idpregunta ?? null,
        "pregunta": pregunta ?? null,
        "opciona": opciona ?? null,
        "opcionb": opcionb ?? null,
        "opcionc": opcionc ?? null,
        "opciond": opciond ?? null,
        "respuesta": respuesta ?? null,
        "idcategoria": idcategoria ?? null,
        "categoria": categoria ?? null,
      };
}
