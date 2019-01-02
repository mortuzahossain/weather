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
      ),

      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: new ListView(
          children: <Widget>[
            new TextField(
              controller: inputCityController,
              decoration: InputDecoration(
                  labelText: "City Name",
                  hintText: "Dhaka"
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(18.0),
              child: RaisedButton(
                onPressed: (){
                  print(inputCityController.text);
                  Navigator.of(context).pop({
                    'enter': inputCityController.text
                  });
                },
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
