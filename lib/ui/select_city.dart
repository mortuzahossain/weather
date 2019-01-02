import 'package:flutter/material.dart';

class SelectCity extends StatefulWidget {
  @override
  _SelectCityState createState() => _SelectCityState();
}

class _SelectCityState extends State<SelectCity> {

  var input_city_controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("Input City"),
        backgroundColor: Colors.redAccent,
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: new ListView(
          children: <Widget>[
            new TextField(
              controller: input_city_controller,
              decoration: InputDecoration(
                  labelText: "City Name",
                  hintText: "Dhaka"
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(18.0),
              child: RaisedButton(
                onPressed: (){},
                child: Text("DONE",style: TextStyle(color: Colors.white),),
                color: Colors.cyan,
              ),
            )
          ],
        ),
      ),

    );
  }
}
