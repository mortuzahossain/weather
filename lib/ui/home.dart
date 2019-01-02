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

  String _cityEntered;

  Future _goToNextScreen(BuildContext context) async {
    Map results = await Navigator
        .of(context)
        .push(new MaterialPageRoute<Map>(builder: (BuildContext context) { //change to Map instead of dynamic for this to work
      return new ChangeCity();
    }));

    if ( results != null && results.containsKey('enter')) {
      _cityEntered = results['enter'];
      debugPrint("From First screen" + results['enter'].toString());
      ChangeCityText();
    }

  }

  ChangeCityText(){
    city = _cityEntered;
    showStuff();
  }

  var temp,pressure,humidity,maxtemp,mintemp,description,icon;
  String city = "Dhaka";

  void showStuff() async{
    Map data = await getWeather(city);
    setState(() {
      temp = data["main"]["temp"].toString();
      humidity  = data["main"]["humidity"].toString();
      pressure = data["main"]["pressure"].toString();
      maxtemp = data["main"]["temp_max"].toString();
      mintemp = data["main"]["temp_min"].toString();
      description = data['weather'][0]["description"].toString();
      icon = data['weather'][0]["icon"].toString();
//      print(data['weather'][0]['description']);
    });
  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Kimatic"),
        backgroundColor: Colors.redAccent,
        centerTitle: true,
        actions: <Widget>[
//          IconButton(icon: Icon(Icons.menu), onPressed: (){
//            var router = MaterialPageRoute(
//              builder: (BuildContext context) => new ChangeCity()
//            );
//            Navigator.of(context).push(router);
//          }),
          IconButton(icon: Icon(Icons.menu), onPressed: ()=>_goToNextScreen(context))

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
              colorBlendMode: BlendMode.colorDodge,
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

          new Container(
//            margin: EdgeInsets.fromLTRB(0.0, MediaQuery.of(context).size.height/4, 0, 0),
            alignment: Alignment.center,
            margin: EdgeInsets.fromLTRB(0, 85, 0, 0),
            child: Text( description !=null ?"$description":"",style: cityStyle(),),
          ),

          Container(
            alignment: Alignment.center,
            child: icon==null?Text("Please Hit Refress !!",style: cityStyle(),):
            Image.network("http://openweathermap.org/img/w/$icon.png",scale: 0.5,),
          ),


          new Container(
            margin: EdgeInsets.fromLTRB(0.0, MediaQuery.of(context).size.height/4, 0, 0),
            alignment: Alignment.center,
            child:Text(temp!=null?"$temp°C":"",style: tempTextStyle(),),
          ),

          new Container(
            margin: EdgeInsets.fromLTRB(10, 0, 0, 70),
            alignment: Alignment.bottomLeft,
            child: Text(maxtemp != null?"Max: $maxtemp°C":"",style: otherTextStyle(),),
          ),

          new Container(
            margin: EdgeInsets.fromLTRB(10, 0, 0, 50),
            alignment: Alignment.bottomLeft,
            child: Text(maxtemp != null?"Min : $mintemp°C":"",style: otherTextStyle(),),
          ),

          new Container(
            margin: EdgeInsets.fromLTRB(10, 0, 0, 30),
            alignment: Alignment.bottomLeft,
            child: Text(maxtemp != null?"Presure: $pressure":"",style: otherTextStyle(),),
          ),

          new Container(
            margin: EdgeInsets.fromLTRB(10, 0, 0, 10),
            alignment: Alignment.bottomLeft,
            child: Text(maxtemp != null?"Humidity: $humidity":"",style: otherTextStyle(),),
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
      color: Colors.white70,
      fontSize: 23.0
  );
}

