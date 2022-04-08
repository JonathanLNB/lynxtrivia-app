import 'dart:convert';

class Usuario {
  Usuario({
    this.idusuario,
    this.correo,
    this.idtipousuario,
    this.tipousuario,
  });

  int idusuario;
  String correo;
  int idtipousuario;
  String tipousuario;

  factory Usuario.fromJson(String str) => Usuario.fromMap(jsonDecode(str));

  String toJson() => jsonEncode(toMap());

  factory Usuario.fromMap(Map<String, dynamic> json) => Usuario(
    idusuario: json["idusuario"] ?? null,
    correo: json["correo"] ?? null,
    idtipousuario: json["idtipousuario"] ?? null,
    tipousuario: json["tipousuario"] ?? null,
  );

  Map<String, dynamic> toMap() => {
    "idusuario": idusuario ?? null,
    "correo": correo ?? null,
    "idtipousuario": idtipousuario ?? null,
    "tipousuario": tipousuario ?? null,
  };
}
