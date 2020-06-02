import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "Simple Interest Calculator App",
    home: SIForm(),
  ));
}

class SIForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SIFormState();
  }
}

class _SIFormState extends State<SIForm> {
  String nameCity = "";
  final _minimumMargin = 5.0;
  final _minimumPadding = 5.0;

  var _currencies = ['Dollar', 'Lev', 'Euro', 'Kuna'];
  var _ccurentItemSelected = 'Dollar';

  @override
  Widget build(BuildContext context) {
    debugPrint("Favorite City widget is creating");

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text("Simple Interest Calculator App"),
      ),
      body: Container(
        margin: EdgeInsets.all(_minimumMargin * 2),
        child: ListView(           //ListView allow the App Screen to be adaptive to different screen devices
          children: <Widget>[
            getImageAsset(),
            Padding(
                padding: EdgeInsets.only(
                    top: _minimumPadding, bottom: _minimumPadding),
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: 'Principal',
                      hintText: 'Enter Principal e.g. 1000',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                )),
            Padding(
                padding: EdgeInsets.only(
                    top: _minimumPadding, bottom: _minimumPadding),
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: 'Rate of Interest',
                      hintText: 'In percent %',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                )),
            Padding(
                padding: EdgeInsets.only(
                    top: _minimumPadding, bottom: _minimumPadding),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              labelText: 'Rate of Interest',
                              hintText: 'In percent %',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0)))),
                    ),
                    Container(
                      width: _minimumPadding * 5,
                    ),
                    Expanded(
                        child: DropdownButton<String>(
                      items: _currencies.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      value: 'Dollar',
                      onChanged: (String newValueSelected) {},
                    ))
                  ],
                )),
            Padding(
                padding: EdgeInsets.only(
                    top: _minimumPadding, bottom: _minimumPadding),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: RaisedButton(
                        child: Text('Calculate'),
                        onPressed: () {},
                      ),
                    ),
                    Expanded(
                      child: RaisedButton(
                        child: Text('Reset'),
                        onPressed: () {},
                      ),
                    )
                  ],
                )),
            Padding(
              padding: EdgeInsets.all(_minimumPadding * 2),
              child: Text('TODO Next'),
            )
          ],
        ),
      ),
    );
  }

  Widget getImageAsset() {
    AssetImage assetImage = AssetImage('images/bank.png');
    Image image = Image(image: assetImage, width: 125.0, height: 125.0);
    return Container(
      child: image,
      margin: EdgeInsets.all(_minimumMargin * 10),
    );
  }
}
