
import 'dart:convert';

List<Covid19> covid19FromJson(String str) => List<Covid19>.from(json.decode(str).map((x) => Covid19.fromJson(x)));

String covid19ToJson(List<Covid19> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Covid19 {
    Covid19({
        this.idDeCaso,
        this.fechaDeNotificaciN,
        this.cDigoDivipola,
        this.ciudadDeUbicaciN,
        this.departamento,
        this.atenciN,
        this.edad,
        this.sexo,
        this.tipo,
        this.estado,
        this.paSDeProcedencia,
        this.fis,
        this.fechaDiagnostico,
        this.fechaRecuperado,
        this.fechaReporteWeb,
        this.tipoRecuperaciN,
        this.codigoDepartamento,
        this.codigoPais,
        this.pertenenciaEtnica,
    });

    String idDeCaso;
    DateTime fechaDeNotificaciN;
    String cDigoDivipola;
    String ciudadDeUbicaciN;
    String departamento;
    String atenciN;
    String edad;
    String sexo;
    String tipo;
    String estado;
    String paSDeProcedencia;
    DateTime fis;
    DateTime fechaDiagnostico;
    DateTime fechaRecuperado;
    DateTime fechaReporteWeb;
    String tipoRecuperaciN;
    String codigoDepartamento;
    String codigoPais;
    String pertenenciaEtnica;

    factory Covid19.fromJson(Map<String, dynamic> json) => Covid19(
        idDeCaso: json["id_de_caso"],
        fechaDeNotificaciN: DateTime.parse(json["fecha_de_notificaci_n"]),
        cDigoDivipola: json["c_digo_divipola"],
        ciudadDeUbicaciN: json["ciudad_de_ubicaci_n"],
        departamento: json["departamento"],
        atenciN: json["atenci_n"],
        edad: json["edad"],
        sexo: json["sexo"],
        tipo: json["tipo"],
        estado: json["estado"],
        paSDeProcedencia: json["pa_s_de_procedencia"],
        fis: DateTime.parse(json["fis"]),
        fechaDiagnostico: DateTime.parse(json["fecha_diagnostico"]),
        fechaRecuperado: DateTime.parse(json["fecha_recuperado"]),
        fechaReporteWeb: DateTime.parse(json["fecha_reporte_web"]),
        tipoRecuperaciN: json["tipo_recuperaci_n"],
        codigoDepartamento: json["codigo_departamento"],
        codigoPais: json["codigo_pais"],
        pertenenciaEtnica: json["pertenencia_etnica"],
    );

    Map<String, dynamic> toJson() => {
        "id_de_caso": idDeCaso,
        "fecha_de_notificaci_n": fechaDeNotificaciN.toIso8601String(),
        "c_digo_divipola": cDigoDivipola,
        "ciudad_de_ubicaci_n": ciudadDeUbicaciN,
        "departamento": departamento,
        "atenci_n": atenciN,
        "edad": edad,
        "sexo": sexo,
        "tipo": tipo,
        "estado": estado,
        "pa_s_de_procedencia": paSDeProcedencia,
        "fis": fis.toIso8601String(),
        "fecha_diagnostico": fechaDiagnostico.toIso8601String(),
        "fecha_recuperado": fechaRecuperado.toIso8601String(),
        "fecha_reporte_web": fechaReporteWeb.toIso8601String(),
        "tipo_recuperaci_n": tipoRecuperaciN,
        "codigo_departamento": codigoDepartamento,
        "codigo_pais": codigoPais,
        "pertenencia_etnica": pertenenciaEtnica,
    };
}
