import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kimatic"),
        backgroundColor: Colors.redAccent,
        centerTitle: true,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.menu), onPressed: ()=> debugPrint("Menu Press"))
        ],
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
              "DHAKA",
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
            child: Text("67.8 °F",style: tempTextStyle(),),
          )

        ],
      ),
      
    );
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