import 'package:flutter/material.dart';
import 'app_screens/home.dart';

void main() {
  runApp(MaterialApp(
    title: "Exploring UI widgets",
    home: Scaffold(
      appBar: AppBar(
        title: Text("Long List"),
      ),
      body: getListView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          debugPrint("FAB clicked");
        },
        child: Icon(Icons.add),
        tooltip: 'Add One More Item',
      ),
    ),
  ));
}

//Widget getListView() {
//  var listView = ListView(
//    children: <Widget>[
//
//      ListTile(
//        leading: Icon(Icons.landscape),
//        title: Text("Landscape"),
//        subtitle: Text("Beautiful View!"),
//        trailing: Icon(Icons.wb_sunny),
//        onTap: (){
//          debugPrint("Landscape tapped");
//        },
//      ),
//      ListTile(
//        leading: Icon(Icons.laptop_chromebook),
//        title: Text("Windows"),
//        onTap: (){
//          debugPrint("Landscape tapped");
//        },
//      ),
//      ListTile(
//        leading: Icon(Icons.phone),
//        title: Text("Phone"),
//        onTap: (){
//          debugPrint("Landscape tapped");
//        },
//      ),
//
//      Text("Yet another element in List"),
//
//      Container(color: Colors.red, height: 50.0,)
//    ],
//  );
//  return listView;
//}

void showSnackBar(BuildContext context, String item) {
  var snackBar = SnackBar(
    content: Text("You just tapped $item"),
    action: SnackBarAction(
      label: "UNDO",
      onPressed: (){
        debugPrint('Performing dummy UNDO operation');
      },
    ),
  );

  Scaffold.of(context).showSnackBar(snackBar);
}

List<String> getListElements() {
  var items = List<String>.generate(1000, (counter) => "Item $counter");
  return items;
}

Widget getListView() {
  var listItems = getListElements();

  var listView = ListView.builder(itemBuilder: (context, index) {
    return ListTile(
      leading: Icon(Icons.arrow_right),
      title: Text(listItems[index]),
      onTap: () {
        showSnackBar(context, listItems[index]);
      },
    );
  });

  return listView;
}
