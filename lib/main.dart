import 'package:flutter/material.dart';
import 'package:flutter_application_1/currency_converter_material_page.dart';

void main() {
  runApp(
      const MyApp()); //just need to created ones so that it no hace to be creaed every time
}

//Types of Widgets- looks,behaviour
//Stateless - looks,behaviour of data like 0 in counter(immutable) , text not change
//Statefull - text changes ,

//1. Material desing 2.Cupertino design

class MyApp extends StatelessWidget {
  // const MyApp({String? data }) : super(data);
  const MyApp(
      {super.key}); // key helps to identify the constructor , key are used in widget tree

  @override
  Widget build(BuildContext context) {
    //we need to return the widget all the time
    //   return const Text( // const doesn't have to be re build
    //   'Hello kkkkkkkkkkkkkk',
    //   textDirection: TextDirection.ltr,
    // );
    return const MaterialApp( // const get removed due to text editor 
      // home: Text('Hello world'), most basic way
      // home: Scaffold(
      //   //Scaffold is for the one page thing called by material app
      //   // body: Text("###################################")),//here text hasn't controll in the page and same goes for the widget
      //   body: Center(
      //     child: Text("Avnish Pandey"),
      //   ),
      // ),

      home: CurrencyConverterMaterialPage(),
    ); // for the android app
  }
}
