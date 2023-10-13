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
class thirdpage extends StatefulWidget {
  const thirdpage({Key? key}) : super(key: key);

  @override
  State<thirdpage> createState() => _thirdpageState();
}

class _thirdpageState extends State<thirdpage> {

  Future<List> getData() async {

    print("function Started");
    var urlString = "https://api.github.com/users/hadley/repos";

    var url = Uri.parse(urlString);

    print("api Started");
    var response = await http.get(url);

    print(response.statusCode);
    print(response.body);
    print("api Completed");

    List resp = jsonDecode(response.body);

    return resp;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Api integration"),
        ),

        body: Center(
            child: FutureBuilder(
              future: getData(),
              builder: (BuildContext context, AsyncSnapshot snapshot)
              {
                if (snapshot.hasData){

                  List totalData = snapshot.data;

                  return ListView.builder(
                      itemCount: totalData.length,
                      itemBuilder: (BuildContext context, Index)
                      {
                        Map singleData = totalData[Index];
                        return ListTile(
                          title: Text(singleData["id"].toString()),
                          subtitle: Text(singleData["node_id"].toString()),
                        );
                      });
                }
                else {
                  return Text("Failure");
                }

              },
            )
        )
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


class carpostproj extends StatefulWidget {
  const carpostproj({Key? key}) : super(key: key);



  @override
  State<carpostproj> createState() => _carpostprojState();
}

class _carpostprojState extends State<carpostproj> {
  List yearlist = ["2014","2015","2016","2017","2018","2019","2020","2021","2022","2023"];

   var yeartextcontroller = TextEditingController();
   var brandtextcontroller = TextEditingController();
   var modeltextcontoller = TextEditingController();
  var vatianttextcontoller = TextEditingController();
  TextEditingController locatextcontroller = TextEditingController();

  List? makeList;
  List? modelList;
  List? variantList;
  List? locationList;

  @override
  void initState() {
    super.initState();
    fetch();
    getData();
    postData();
    locanData();

  }

  Future<String> fetch() async {
    final data = {'year': '2020', 'make': brandtextcontroller.text};
    var headers = {'Content-Type':'application/json',};
    final response = await http.post(Uri.parse('https://kuwycredit.in/servlet/rest/ltv/forecast/ltvModels'),
        headers: headers,
        body: jsonEncode(data));
    var responseData = json.decode(response.body);
    if (response.statusCode == 200) {
      modelList = responseData["modelList"];
      print("Data : "+modelList.toString());
    } else {
      throw Exception('Failed.');
    }
    return "";
  }

  Future<String> getData() async {
    final data = {'year': '2020'};
    var headers = {'Content-Type': 'application/json',};
    final response = await http.post(
        Uri.parse('https://kuwycredit.in/servlet/rest/ltv/forecast/ltvMakes'),
        headers: headers,
        body: jsonEncode(data));
    var responseData = json.decode(response.body);
    if (response.statusCode == 200) {
      modelList = responseData["makeList"];
      print("Data : " + makeList.toString());
    } else {
      throw Exception('Failed.');
    }
    return "";
  }

  Future<String> postData() async {
    final data = {'year': '2020', 'make': brandtextcontroller.text,'model':modeltextcontoller.text};
    var headers = {'Content-Type':'application/json',};
    final response = await http.post(Uri.parse('https://kuwycredit.in/servlet/rest/ltv/forecast/ltvVariants'),
        headers: headers,
        body: jsonEncode(data));
    var responseData = json.decode(response.body);
    if (response.statusCode == 200) {
      modelList = responseData["variantList"];
      print("Data : "+variantList.toString());
    } else {
      throw Exception('Failed.');
    }
    return "";
  }

  Future<String> locanData() async {
    final data = {'year': '2020', 'make': brandtextcontroller.text,'model':modeltextcontoller.text,'variant':vatianttextcontoller.text};
    var headers = {'Content-Type':'application/json',};
    final response = await http.post(Uri.parse('https://kuwycredit.in/servlet/rest/ltv/forecast/ltvLoc'),
        headers: headers,
        body: jsonEncode(data));
    var responseData = json.decode(response.body);
    if (response.statusCode == 200) {
      modelList = responseData["locationList"];
      print("Data : "+locationList.toString());
    } else {
      throw Exception('Failed.');
    }
    return "";
  }





    @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true,title: Text("True value",style: TextStyle(color: Colors.white,
        fontWeight: FontWeight.w900,fontSize: 25,fontStyle:FontStyle.italic,
        overflow: TextOverflow.ellipsis)),backgroundColor: Colors.brown,
      ),
    body: SingleChildScrollView(
      child: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,children: [ SizedBox(height: 20,),
        //year
        Row(children: [const Icon(Icons.calendar_month,color: Colors.black,size: 30,),SizedBox(width: 25,),
        SizedBox(child:TextField(controller: yeartextcontroller,decoration: InputDecoration(hintText:"Select year",),) ,width: 300,)
          , IconButton(onPressed: (){
            showModalBottomSheet(context: context, builder: (BuildContext context)
            {

              return SizedBox(height: 400,
                child: ListView.builder(itemCount: yearlist.length,itemBuilder: (BuildContext context,index)
                {
                  return Column(children: [
                    ListTile(
                      title: Text(yearlist[index],style: TextStyle(fontSize: 20),
                      ) ,
                      onTap: (){
                        setState(() {
                          yeartextcontroller.text = yearlist[index].toString();
                        });
                      },
                    )
                  ],);
                }),);

            });
          }, icon: const Icon(Icons.keyboard_arrow_down,color: Colors.black,size: 30,))],),


        //make
        SizedBox(height: 20,),
        Row(children: [const Icon(Icons.car_repair,color: Colors.black,size: 30,),SizedBox(width: 25,),
          SizedBox(child:TextField(controller: modeltextcontoller,decoration: InputDecoration(hintText:"Select model",),) ,width: 300,)
          , IconButton(onPressed: ()
          {
            showModalBottomSheet(context: context, builder: (BuildContext context)
            {
              return SizedBox(height: 400,child: FutureBuilder(
                  future: fetch(),
                  builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                    if (snapshot.data != null) {
                      return ListView.builder(
                        itemCount:  makeList!.length,
                        itemBuilder: (BuildContext context, int i) {
                          return ListTile(
                            title: Text(makeList![i].toString()),
                          );
                        },
                      );
                    } else {
                      return Container(
                          child: Center(child: Text('Failed'),)
                      );
                    }
                  }
              ),
              );

            });

          }
              , icon: const Icon(Icons.keyboard_arrow_down,color: Colors.black,size: 30,))],),



        //model
          SizedBox(height: 20,),
          Row(children: [const Icon(Icons.car_repair,color: Colors.black,size: 30,),SizedBox(width: 25,),
            SizedBox(child:TextField(controller: brandtextcontroller,decoration: InputDecoration(hintText:"Select company",),) ,width: 300,)
            , IconButton(onPressed: ()
            {
              showModalBottomSheet(context: context, builder: (BuildContext context)
              {
                return SizedBox(height: 400,child: FutureBuilder(
                    future: fetch(),
                    builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                      if (snapshot.data != null) {
                        return ListView.builder(
                          itemCount:  modelList!.length,
                          itemBuilder: (BuildContext context, int i) {
                            return ListTile(
                              title: Text(modelList![i].toString()),
                            );
                          },
                        );
                      } else {
                        return Container(
                            child: Center(child: Text('Failed'),)
                        );
                      }
                    }
                ),
                );

              });
            }
                , icon: const Icon(Icons.keyboard_arrow_down,color: Colors.black,size: 30,))],),







        SizedBox(height: 20,),
          Row(children: [const Icon(Icons.car_repair,color: Colors.black,size: 30,),SizedBox(width: 25,),
            SizedBox(child:TextField(controller: vatianttextcontoller,decoration: InputDecoration(hintText:"Select variant",),) ,width: 300,)
            , IconButton(onPressed: ()
            {
              showModalBottomSheet(context: context, builder: (BuildContext context)
              {
                return SizedBox(height: 400,child: FutureBuilder(
                    future: fetch(),
                    builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                      if (snapshot.data != null) {
                        return ListView.builder(
                          itemCount:  variantList!.length,
                          itemBuilder: (BuildContext context, int i) {
                            return ListTile(
                              title: Text(variantList![i].toString()),
                            );
                          },
                        );
                      } else {
                        return Container(
                            child: Center(child: Text('Failed'),)
                        );
                      }
                    }
                ),
                );

              });
            },
                icon: const Icon(Icons.keyboard_arrow_down,color: Colors.black,size: 30,))],),




          SizedBox(height: 20,),
          Row(children: [Icon(Icons.location_on_outlined,color: Colors.black,size: 30,),SizedBox(width: 25,),
             SizedBox(width: 300,child:TextField(controller: locatextcontroller ,decoration: InputDecoration(hintText:"Select location",),) ,)
            ,IconButton(onPressed: ()
            {
              showModalBottomSheet(context: context, builder: (BuildContext context)
              {
                return SizedBox(height: 400,child: FutureBuilder(
                    future: fetch(),
                    builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                      if (snapshot.data != null) {
                        return ListView.builder(
                          itemCount:  locationList!.length,
                          itemBuilder: (BuildContext context, int i) {
                            return ListTile(
                              title: Text(locationList![i].toString()),
                            );
                          },
                        );
                      } else {
                        return Container(
                            child: Center(child: Text('Failed'),)
                        );
                      }
                    }
                ),
                );

              });

            }
            , icon: const Icon(Icons.keyboard_arrow_down,color: Colors.black,size: 30,))],),
           SizedBox(height: 20,),


          SizedBox(width: 150,),ElevatedButton(onPressed: (){}, child: const Text("Clear"))




        ],) ,),
    )
    );
  }
}
