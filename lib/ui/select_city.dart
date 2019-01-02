import 'package:flutter/material.dart';
class ChangeCity extends StatelessWidget {
  var inputCityController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Input City"),
        backgroundColor: Colors.redAccent,
        centerTitle: true,
        elevation: 10.0,
      ),

      body: Stack(
          children: <Widget>[
            ListView(
              padding: EdgeInsets.all(20.0),
              children: <Widget>[
                new TextField(
                  controller: inputCityController,
                  decoration: InputDecoration(
                      labelText: "City Name",
                      hintText: "Dhaka"
                  ),
                ),

                Padding(padding: EdgeInsets.all(5.0)),
                
                RaisedButton(
                  onPressed: (){
                    print(inputCityController.text);
                    Navigator.of(context).pop({
                      'enter': inputCityController.text
                    });
                  },
                  child: Text("DONE",style: TextStyle(color: Colors.white),),
                  color: Colors.cyan,
                ),
              ],
            )


          ],
        ),

    );
  }
}
