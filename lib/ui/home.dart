import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HomeState();
  }
    
}
    
class HomeState extends State<Home> {

  int radioValue = 0;

  void handleRadioValueChanged(int value){
    setState(() {
      radioValue = value;

      print(radioValue);
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Weight On Planet X"),
        centerTitle: true,
        backgroundColor: Colors.black38,
      ),

      backgroundColor: Colors.blueGrey,

      body: new Container(
        alignment: Alignment.topCenter,
        child: new ListView(
          padding: const EdgeInsets.all(2.5),
          children: <Widget>[
            new Image.asset("images/planet.png",
              height: 133.0,
              width: 200.0,
            ),

            new Container(
              margin: const EdgeInsets.all(3.0),
              alignment: Alignment.center,
              child: new Column(
                children: <Widget>[

                  new TextField(
                    controller: null,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                      labelText: 'Your Weight on Earth',
                      hintText: 'In Pounds',
                      icon: new Icon(Icons.person_outline),
                    ),
                  ),

                  new Padding(padding: EdgeInsets.all(5.0)),

                  //Three Radio Buttons
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: <Widget>[

                      new Radio<int>(
                        activeColor: Colors.brown,
                        value: 0,
                        groupValue: radioValue,
                        onChanged: handleRadioValueChanged,
                        ),

                        new Text(
                          "Pluto",
                          style: new TextStyle(
                            color: Colors.white30,
                          ),
                        ),

                      new Radio<int>(
                        activeColor: Colors.red,
                        value: 1,
                        groupValue: radioValue,
                        onChanged: handleRadioValueChanged,
                        ),

                        new Text(
                          "Mars",
                          style: new TextStyle(
                            color: Colors.white30,
                          ),
                        ),

                      new Radio<int>(
                        activeColor: Colors.orangeAccent,
                        value: 2,
                        groupValue: radioValue,
                        onChanged: handleRadioValueChanged,
                        ),

                        new Text(
                          "Venus",
                          style: new TextStyle(
                            color: Colors.white30,
                          ),
                        ),

                    ],
                  ),

                  new Text(
                    "Hello There",
                    style: new TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 19.5,
                    ),
                  )

                ],
              ),
            )
          ],
        ),
      ),
    );
  }

}