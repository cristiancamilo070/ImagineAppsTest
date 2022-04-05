// To parse this JSON data, do
//
//     final response = responseFromJson(jsonString);

import 'dart:convert';

Map<String, Response> responseFromJson(String str) 
    => Map.from(json.decode(str)).map((k, v)
      => MapEntry<String, Response>(k, Response.fromJson(v)));

String responseToJson(Map<String, Response> data) => json.encode(Map.from(data).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())));

class Response {
    Response({
        this.unnamed0,
        this.mes,
        this.ltimo,
        this.responseVar,
        this.apertura,
        this.mximo,
        this.mnimo,
        this.volumen,
        this.hora,
        this.grfico,
    });

    String? unnamed0;
    String? mes;
    String? ltimo;
    int? responseVar;
    int? apertura;
    int? mximo;
    int? mnimo;
    int? volumen;
    String? hora;
    String? grfico;

    factory Response.fromJson(Map<String, dynamic> json) => Response(
        unnamed0: json["Unnamed: 0"],
        mes: json["Mes"],
        ltimo: json["Último"],
        responseVar: json["Var."],
        apertura: json["Apertura"],
        mximo: json["Máximo"],
        mnimo: json["Mínimo"],
        volumen: json["Volumen"],
        hora: json["Hora"],
        grfico: json["Gráfico"],
    );

    Map<String, dynamic> toJson() => {
        "Unnamed: 0": unnamed0,
        "Mes": mes,
        "Último": ltimo,
        "Var.": responseVar,
        "Apertura": apertura,
        "Máximo": mximo,
        "Mínimo": mnimo,
        "Volumen": volumen,
        "Hora": hora,
        "Gráfico": grfico,
    };
}

