import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

// class Response {
//     Null un;
//     String mes;
//     String ultimo;
//     int responseVar;
//     int apertura;
//     int maximo;
//     int minimo;
//     int volumen;
//     String hora;
//     String grafico;


// Response responseFromJson(String str) => Response.fromJson(json.decode(str));

// String responseToJson(Response data) => json.encode(data.toJson());
//     Response({
//         required this.un,
//         required this.mes,
//         required this.ultimo,
//         required this.responseVar,
//         required this.apertura,
//         required this.maximo,
//         required this.minimo,
//         required this.volumen,
//         required this.hora,
//         required this.grafico,
//     });

//     factory Response.fromJson(Map<String, dynamic> json) {
//       return  Response(
//         un: json["Unnamed: 0"],
//         mes: json["Mes"],
//         ultimo: json["Último"],
//         responseVar: json["Var."],
//         apertura: json["Apertura"],
//         maximo: json["Máximo"],
//         minimo: json["Mínimo"],
//         volumen: json["Volumen"],
//         hora: json["Hora"],
//         grafico: json["Gráfico"],
//     );
//     }
// Map<String, dynamic> toJson() => {
//         "Unnamed: 0": un,
//         "Mes": mes,
//         "Último": ultimo,
//         "Var.": responseVar,
//         "Apertura": apertura,
//         "Máximo": maximo,
//         "Mínimo": minimo,
//         "Volumen": volumen,
//         "Hora": hora,
//         "Gráfico": grafico,
//     };
// }
// List<Response> parseResponse(String responseBody){
// var jsonresponse= Map<String, dynamic>.from(json.decode(responseBody)) as List<dynamic>;

// List<Response> lista=jsonresponse.map((model) => Response.fromJson(model)).toList() ;
// return lista;
// }

// Future<List<Response>> getData() async {
//   final respuesta= await http.get(Uri.parse("https://rest.imagineapps.co/cocoa-contracts"));
//   if(respuesta.statusCode == 200){
//     return compute(parseResponse,respuesta.body);
//     } else {
//   throw Exception('Failed to load');
//   }
// }
 
//TEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEESTTTTTTTTTTTTTTTTTTTTTTT
Future<Post> fetchPost() async {
  var url=Uri.parse('https://rest.imagineapps.co/cocoa-contracts');
  final response =
      await http.get(url);
      print(http.get(url)); 

  if (response.statusCode == 200) {
    // Si el servidor devuelve una repuesta OK, parseamos el JSON
    return Post.fromJson(json.decode(response.body));
  } else {
    // Si esta respuesta no fue OK, lanza un error.
    throw Exception('Failed to load post');
  }
}

class Post {
    String? un;
    final String? mes;
    final String? ultimo;
    final int? responseVar;
    final int? apertura;
    final int? maximo;
    final int? minimo;
    final int? volumen;
    final String? hora;
    final String? grafico;

  Post({
        this.un,
         this.mes,
         this.ultimo,
         this.responseVar,
         this.apertura,
         this.maximo,
         this.minimo,
         this.volumen,
         this.hora,
         this.grafico,});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
        un: json["Unnamed: 0"].toString(),
        mes: json["Mes"],
        ultimo: json["Último"],
        responseVar: json["Var."],
        apertura: json["Apertura"],
        maximo: json["Máximo"],
        minimo: json["Mínimo"],
        volumen: json["Volumen"],
        hora: json["Hora"],
        grafico: json["Gráfico"],
    );
  }
}
