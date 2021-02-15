// To parse this JSON data, do
//
//     final reqEducacion = reqEducacionFromJson(jsonString);

import 'dart:convert';

ReqEducacion reqEducacionFromJson(String str) => ReqEducacion.fromJson(json.decode(str));
String reqEducacionToJson(ReqEducacion data) => json.encode(data.toJson());

class ReqEducacion {
    ReqEducacion({
        this.data,
    });

    List<Educacion> data;

    factory ReqEducacion.fromJson(Map<String, dynamic> json) => ReqEducacion(
        data: List<Educacion>.from(json["data"].map((x) => Educacion.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Educacion {
    Educacion({
        this.n,
        this.daneAntiguoSede,
        this.nombreDeLaSede,
        this.matriculaPorSede,
        this.jornada,
        this.contacto,
        this.telefono,
        this.correoElectronico,
        this.direcciN,
        this.barrio,
        this.zona,
    });

    String n;
    String daneAntiguoSede;
    String nombreDeLaSede;
    String matriculaPorSede;
    String jornada;
    String contacto;
    String telefono;
    String correoElectronico;
    String direcciN;
    String barrio;
    String zona;

    factory Educacion.fromJson(Map<String, dynamic> json) => Educacion(
        n: json["n"],
        daneAntiguoSede: json["dane_antiguo_sede"],
        nombreDeLaSede: json["nombre_de_la_sede"],
        matriculaPorSede: json["matricula_por_sede"],
        jornada: json["jornada"],
        contacto: json["contacto"],
        telefono: json["telefono"],
        correoElectronico: json["correo_electronico"],
        direcciN: json["direcci_n"],
        barrio: json["barrio"],
        zona: json["zona"],
    );

    Map<String, dynamic> toJson() => {
        "n": n,
        "dane_antiguo_sede": daneAntiguoSede,
        "nombre_de_la_sede": nombreDeLaSede,
        "matricula_por_sede": matriculaPorSede,
        "jornada": jornada,
        "contacto": contacto,
        "telefono": telefono,
        "correo_electronico": correoElectronico,
        "direcci_n": direcciN,
        "barrio": barrio,
        "zona": zona,
    };
}
