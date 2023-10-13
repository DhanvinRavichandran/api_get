import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: apigettask(),
      debugShowCheckedModeBanner: false,
    );
  }
}
class firstpage extends StatefulWidget {
  const firstpage({Key? key}) : super(key: key);

  @override
  State<firstpage> createState() => _firstpageState();
}

class _firstpageState extends State<firstpage> {

  Future<void> getData() async {

    print("function Started");
    var urlString = "https://api.github.com/users/hadley/repos";

    var url = Uri.parse(urlString);

    print("api Started");
    var response = await http.get(url);

    print(response.statusCode);
    print(response.body);
    print("api Completed");

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Api integration"),
      ),

      body: Center(
        child: TextButton(
          onPressed: (){

            print("Button Clicked");
            getData();
            print("Function Completed");
          },
          child: Text("Tap Me"),),
      ),
    );
  }
}

class secondpage extends StatefulWidget {
  const secondpage({Key? key}) : super(key: key);

  @override
  State<secondpage> createState() => _secondpageState();
}

class _secondpageState extends State<secondpage> {
  Future<List>getData()async{
    var urlstring ="https://api.github.com/users/hadley/repos";
    var url = Uri.parse(urlstring);
    var Response = await http.get(url);
    print(Response.statusCode);
    print(Response.body);

    List resp = jsonDecode(Response.body);
    return resp;

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("api inte"),),
      body: FutureBuilder( future: getData(),
        builder: (BuildContext context,AsyncSnapshot snapshot){
        if(snapshot.hasData){
           List totalData = snapshot.data;
           return ListView.builder(itemCount: totalData.length,itemBuilder: (BuildContext context,index)
           {
             Map singleData = totalData[index];
             return ListTile(
               title: Text(singleData["id"].toString()),
               subtitle: Text(singleData["node_id"].toString()),
             );
           });
        }
        else
          {
            return Text("failue");
          }
        },

      ) ,
    );
  }
}


class apigettask extends StatefulWidget {
  const apigettask({Key? key}) : super(key: key);

  @override
  State<apigettask> createState() => _apigettaskState();
}

class _apigettaskState extends State<apigettask> {
  Future<List>getData()async{
    var urlsring = "https://api.github.com/users/hadley/repos";
    var url = Uri.parse(urlsring);
    var Response = await http.get(url);
    List resp = jsonDecode(Response.body);
    return resp;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true,title: Text("EMPLOYES ID NUMBER"),
      backgroundColor: Colors.black45,),
      body: Center(child: FutureBuilder(future: getData(),
      builder: (BuildContext context,AsyncSnapshot snapshot)
        {
          if(snapshot.hasData){
            List totalData = snapshot.data;
            return ListView.builder(itemCount: totalData.length,
                itemBuilder: (BuildContext context,index)
            {
              Map singleData = totalData[index];
              return Padding(
                padding: const EdgeInsets.all(15.0),
                child: Card(elevation: 30,shadowColor: Colors.green,borderOnForeground: true,
                  color: Colors.greenAccent,
                  child:ExpansionTile(
                    leading: Image.network("https://avatars.githubusercontent.com/u/4196?v=4"),
                    title: Text(singleData["id"].toString(),style: TextStyle(color: Colors.purple,fontWeight: FontWeight.bold),),
                    subtitle: Text(singleData["node_id"].toString(),style: TextStyle(color: Colors.purple,fontWeight: FontWeight.bold),),
                    trailing: Icon(Icons.arrow_right),
                  ) ,

                ),
              );


            });
          }
          else{
            return Text("failure");
          }
        },),),
    );
  }
}



