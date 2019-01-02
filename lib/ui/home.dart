import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:kimatic/util/apiinfo.dart';
import 'dart:convert';
import 'select_city.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  var temp,pressure,humidity,maxtemp,mintemp;
  String city = "Dhaka";

  void showStuff() async{
    Map data = await getWeather(city);
    setState(() {
      temp = data["main"]["temp"].toString();
      humidity  = data["main"]["humidity"].toString();
      pressure = data["main"]["pressure"].toString();
      maxtemp = data["main"]["temp_max"].toString();
      mintemp = data["main"]["temp_min"].toString();
    });
  }



  @override
  Widget build(BuildContext context) {
    if(temp == null){
      showStuff();
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("Kimatic"),
        backgroundColor: Colors.redAccent,
        centerTitle: true,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.menu), onPressed: (){
            var router = MaterialPageRoute(
              builder: (BuildContext context) => new SelectCity()
            );
            Navigator.of(context).push(router);
          })
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: showStuff,
        child: Icon(Icons.refresh),
        backgroundColor: Colors.redAccent,
      ),
      
      body: new Stack(
        children: <Widget>[
          Center(
            child: new Image.asset(
              "images/umbrella.png",
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              fit: BoxFit.fill,),
          ),
          
          Container(
            alignment: Alignment.topRight,
            margin: EdgeInsets.fromLTRB(0.0, 10.0, 10.0, 10.0),
            child: Text(
              "${city.toUpperCase()}",
              style: cityStyle(),
            ),
          ),
          
          Container(
            alignment: Alignment.center,
            child: Image.asset("images/light_rain.png"),
          ),

          new Container(
            margin: EdgeInsets.fromLTRB(0.0, MediaQuery.of(context).size.height/4, 0, 0),
            alignment: Alignment.center,
            child:Text("$temp°C",style: tempTextStyle(),),
          ),

          new Container(
            margin: EdgeInsets.fromLTRB(10, 0, 0, 90),
            alignment: Alignment.bottomLeft,
            child: Text("Max: $maxtemp°C",style: otherTextStyle(),),
          ),

          new Container(
            margin: EdgeInsets.fromLTRB(10, 0, 0, 65),
            alignment: Alignment.bottomLeft,
            child: Text("Min : $mintemp°C",style: otherTextStyle(),),
          ),

          new Container(
            margin: EdgeInsets.fromLTRB(10, 0, 0, 37),
            alignment: Alignment.bottomLeft,
            child: Text("Presure: $pressure",style: otherTextStyle(),),
          ),

          new Container(
            margin: EdgeInsets.fromLTRB(10, 0, 0, 10),
            alignment: Alignment.bottomLeft,
            child: Text("Humidity: $humidity",style: otherTextStyle(),),
          )

        ],
      ),
      
    );
  }

  Future<Map> getWeather(String city) async {
//    String url = "http://api.openweathermap.org/data/2.5/weather?q=$city&appid=${appID}&units=matric";
    String url = "http://api.openweathermap.org/data/2.5/weather?q=$city&appid=$appID&units=metric";
    http.Response response = await http.get(url);
    return json.decode(response.body);
  }



}


TextStyle cityStyle(){
  return new TextStyle(
    fontSize: 29.9,
    color: Colors.white,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.bold
  );
}

TextStyle tempTextStyle(){
  return TextStyle(
    color: Colors.white,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w500,
    fontSize: 49.9
  );
}


TextStyle otherTextStyle(){
  return TextStyle(
      color: Colors.white,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w400,
      fontSize: 30.0
  );
}