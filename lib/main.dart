import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
void main() => runApp(const MyApp());


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
     return MaterialApp(
      debugShowCheckedModeBanner: false, 
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home:  const HomePage(),
    );
  }
}

String? stringResponse;
Map? mapResponse;
Map? dataResponse;
int? index;
List? listResponse=[];

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

 // HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Future apiCall()async{
    http.Response response;
    //https://reqres.in/api/users/2 exercise vidio
    response=await http.get(Uri.parse("https://rest.imagineapps.co/cocoa-contracts"));
    if(response.statusCode==200){
        setState(() {
          stringResponse=response.body;
          mapResponse=json.decode(response.body);
          dataResponse=mapResponse!["1"];
        });
    }
  }

  @override
  void initState() {
    apiCall();
    super.initState();
  }
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fetch Data'),
      ),
      body: Center(
        child: Container(
          height: 500,
          width: 350,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.amber
          ),
          
          //con map Response
          child: mapResponse==null?const Text("Data is loading"):
                  //Complete json   
                    //Text(stringResponse.toString()),
                  //Single part of a json   
                    //Text(mapResponse!['1'].toString()),
                  //Especific part of a single part of a json
                    Text(mapResponse!['1']["Hora"].toString()),
                  //Diferent way to show the same thing as before 
                    //Text(dataResponse!["Hora"].toString()),
        ),
      ),
    );
  }
}
