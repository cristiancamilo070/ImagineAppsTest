import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


String? stringResponse;
Map? mapResponse;
Map? dataResponse;
int? index;
List? listResponse=[];

var key;
//var val;

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
          //stringResponse=response.body;
          mapResponse=json.decode(response.body);
          //dataResponse=mapResponse!["1"];          
          key=mapResponse!.keys.toList();
          //val = mapResponse![key[0]];
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
        title: const Text('Fetch Data'),
      ),
      body: Center(
        child: Container(
          // height: 500,
          // width: 350,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.amber
          ),
           child: FutureBuilder (
            future: apiCall(),
            builder: (BuildContext context, AsyncSnapshot snapshot){
        //       if(snapshot.connectionState == ConnectionState.waiting){
        //         return Center(
        //           child: CircularProgressIndicator(),
        //         );
        // }
        // if(snapshot.hasError){
        //   return Center(
        //     child: Text('error fatch'),
        //   );
        // }
                
                return ListView.builder (
                  itemCount: mapResponse!.length,
                  itemBuilder: (BuildContext context, int index){
                    return Row(
                      children: <Widget>[
                        Text(key[index].toString()+": "),
                        const Divider(height: 30,),
                        Text(mapResponse![key[index]]["Hora"].toString())
                      ],
                    );
                  },
                );
              }
            
            ),

          // LIST BUILDER
          // child:  mapResponse==null?    const Text("Data is loading"):
          //         ListView.builder (
          //         itemCount: mapResponse!.length,
          //         itemBuilder: (BuildContext context, int index){
          //           return Row(
          //             children: <Widget>[
          //               Text(key[index].toString()+": "),
          //               const Divider(height: 20,),
          //               Text(mapResponse![key[index]]["Hora"].toString())
          //             ],
          //           );
          //         },
          //       )


      //JUST RETURNING TEXT 
          //child: mapResponse==null?const Text("Data is loading"):
                  //Complete json   
                    //Text(stringResponse.toString()),
                  //Single part of a json   
                    //Text(mapResponse!['1'].toString()),
                  //Especific part of a single part of a json
                    //Text(mapResponse!['1']["Hora"].toString()),
                  //Diferent way to show the same thing as before 
                    //Text(dataResponse!["Hora"].toString()),
                  //Shows the amount of keys  
                    //Text(key.toString()),
                  //Shows the values of the especific keys  
                    //Text(val.toString()),
        ),
      ),
    );
  }
}