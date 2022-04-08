import 'dart:convert';

class Juego {
  Juego({
    this.idjuego,
    this.idusuario,
    this.puntaje,
    this.pregunta,
  });

  int idjuego;
  int idusuario;
  int puntaje;
  int pregunta;

  factory Juego.fromJson(String str) => Juego.fromMap(jsonDecode(str));

  String toJson() => jsonEncode(toMap());

  factory Juego.fromMap(Map<String, dynamic> json) => Juego(
    idjuego: json["idjuego"] ?? null,
    idusuario: json["idusuario"] ?? null,
    puntaje: json["puntaje"] ?? null,
    pregunta: json["pregunta"] ?? null,
  );

  Map<String, dynamic> toMap() => {
    "idjuego": idjuego ?? null,
    "idusuario": idusuario ?? null,
    "puntaje": puntaje ?? null,
    "pregunta": pregunta ?? null,
  };
}
