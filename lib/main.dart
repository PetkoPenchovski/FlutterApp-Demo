import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Simple Interest Calculator App",
    home: SIForm(),
    theme: ThemeData(
        primaryColor: Colors.indigo,
        accentColor: Colors.indigoAccent,
        brightness: Brightness.dark),
  ));
}

class SIForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SIFormState();
  }
}

class _SIFormState extends State<SIForm> {
  var formKey = GlobalKey<FormState>();

  final minimumMargin = 5.0;
  final minimumPadding = 5.0;

  var currencies = ['Dollar', 'Lev', 'Euro', 'Kuna'];
  var currentItemSelected = '';

  @override
  void initState() {
    super.initState();
    //Initialize static members
    currentItemSelected = currencies[0];
  }

  TextEditingController principalController = TextEditingController();
  TextEditingController rateOfInterestController = TextEditingController();
  TextEditingController termController = TextEditingController();

  var displayResult = '';

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.headline6;
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text("Simple Interest Calculator App"),
      ),
      body: Form(
          key: formKey,
          child: Padding(
            padding: EdgeInsets.all(minimumPadding * 2),
            child: ListView(
              //ListView allow the App Screen to be adaptive to different screen devices
              children: <Widget>[
                getImageAsset(),
                Padding(
                    padding: EdgeInsets.only(
                        top: minimumPadding, bottom: minimumPadding),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      style: textStyle,
                      controller: principalController,
                      validator: (String value) {
                        if (value.isEmpty) {
                          return "Please enter principal amount";
                        }
                      },
                      decoration: InputDecoration(
                          labelText: 'Principal',
                          hintText: 'Enter Principal e.g. 1000',
                          labelStyle: textStyle,
                          errorStyle: TextStyle(
                            color: Colors.yellowAccent,
                            fontSize: 15.0
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0))),
                    )),
                Padding(
                    padding: EdgeInsets.only(
                        top: minimumPadding, bottom: minimumPadding),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      style: textStyle,
                      controller: rateOfInterestController,
                      validator: (String value) {
                        if (value.isEmpty) {
                          return "Please enter rate of interest";
                        }
                      },
                      decoration: InputDecoration(
                          labelText: 'Rate of Interest',
                          hintText: 'In percent %',
                          labelStyle: textStyle,
                          errorStyle: TextStyle(
                              color: Colors.yellowAccent,
                              fontSize: 15.0
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0))),
                    )),
                Padding(
                    padding: EdgeInsets.only(
                        top: minimumPadding, bottom: minimumPadding),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: TextFormField(
                              keyboardType: TextInputType.number,
                              style: textStyle,
                              controller: termController,
                              validator: (String value) {
                                if (value.isEmpty) {
                                  return "Please enter time in years";
                                }
                              },
                              decoration: InputDecoration(
                                  labelText: 'Term',
                                  hintText: 'Time in years',
                                  labelStyle: textStyle,
                                  errorStyle: TextStyle(
                                      color: Colors.yellowAccent,
                                      fontSize: 15.0
                                  ),
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(5.0)))),
                        ),
                        Container(
                          width: minimumPadding * 5,
                        ),
                        Expanded(
                            child: DropdownButton<String>(
                          items: currencies.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          value: currentItemSelected,
                          onChanged: (String newValueSelected) {
                            _onDropDownItemSelected(newValueSelected);
                          },
                        ))
                      ],
                    )),
                Padding(
                    padding: EdgeInsets.only(
                        top: minimumPadding, bottom: minimumPadding),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: RaisedButton(
                            color: Theme.of(context).accentColor,
                            textColor: Theme.of(context).primaryColorDark,
                            child: Text('Calculate', textScaleFactor: 1.3),
                            onPressed: () {
                              _displayFinalResult();
                            },
                          ),
                        ),
                        Expanded(
                          child: RaisedButton(
                            color: Theme.of(context).primaryColorDark,
                            textColor: Theme.of(context).primaryColorLight,
                            child: Text('Reset', textScaleFactor: 1.3),
                            onPressed: () {
                              _reset();
                            },
                          ),
                        )
                      ],
                    )),
                Padding(
                  padding: EdgeInsets.all(minimumPadding * 2),
                  child: Text(
                    this.displayResult,
                    style: textStyle,
                  ),
                )
              ],
            ),
          )),
    );
  }

  Widget getImageAsset() {
    AssetImage assetImage = AssetImage('images/bank.png');
    Image image = Image(image: assetImage, width: 125.0, height: 125.0);
    return Container(
      child: image,
      margin: EdgeInsets.all(minimumMargin * 10),
    );
  }

  void _onDropDownItemSelected(String newValueSelected) {
    setState(() {
      this.currentItemSelected = newValueSelected;
    });
  }

  String _calculateTotalReturns() {
    double principal = double.parse(principalController.text);
    double rateOfInterest = double.parse(rateOfInterestController.text);
    double term = double.parse(termController.text);

    double totalAmountPayable =
        principal + (principal * rateOfInterest * term) / 100;

    String result =
        'After $term years, your investment will be worth $totalAmountPayable in $currentItemSelected';
    return result;
  }

  void _displayFinalResult() {
    setState(() {
      if (formKey.currentState.validate()) {
        this.displayResult = _calculateTotalReturns();
      }
    });
  }

  void _reset() {
    setState(() {
      principalController.text = '';
      rateOfInterestController.text = '';
      termController.text = '';
      displayResult = '';
      currentItemSelected = currencies[0];
    });
  }
}
