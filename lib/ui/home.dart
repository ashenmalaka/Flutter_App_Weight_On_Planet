import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HomeState();
  }
    
}
    
class HomeState extends State<Home> {

  final TextEditingController _weightController = new TextEditingController();

  int radioValue = 0;
  double _finalResult = 0.0;
  String _formattedText = "";

  void handleRadioValueChanged(int value){
    setState(() {
      radioValue = value;

      switch(radioValue){
        case 0:
          _finalResult = calculateWeight(_weightController.text, 0.06);
          _formattedText = "Your Weight on Pluto is ${_finalResult.toStringAsFixed(1)}";
          break;
        case 1:
          _finalResult = calculateWeight(_weightController.text, 0.38);
          _formattedText = "Your Weight on Mars is ${_finalResult.toStringAsFixed(1)}";
          break;
        case 2:
          _finalResult = calculateWeight(_weightController.text, 0.91);
          _formattedText = "Your Weight on Venus is ${_finalResult.toStringAsFixed(1)}";
          break;
        default:
          print("Nothing Selected");

          _formattedText = "Nothing is Selected!";
          
      }
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
                        onChanged: handleRadioValueChanged
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
                        onChanged: handleRadioValueChanged
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
                        onChanged: handleRadioValueChanged
                        ),

                        new Text(
                          "Venus",
                          style: new TextStyle(
                            color: Colors.white30,
                          ),
                        ),

                    ],
                  ),
                  
                  new Padding(padding: new EdgeInsets.all(15.5)),

                  //Result Text
                  new Text(
                    _weightController.text.isEmpty ? "Please Enter Your Weight" : _formattedText + "lbs",
                    //"$_formattedText lbs",
                    style: new TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 19.5
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

   double calculateWeight(String weight, double multiplier){

    if(int.parse(weight).toString().isNotEmpty && int.parse(weight) > 0){
      return int.parse(weight) * multiplier;
    }else{
      print("Wrong!");

      return int.parse("180.0") * 0.38;
    }
  }

}