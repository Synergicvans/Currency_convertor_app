import 'package:flutter/material.dart';

// 1. create variable to store data
//2. create function that multiplies the value given by the textfield
// 3. store the value in variable
// 4. display the variable

//new class for stateful widget as the result gives problem in printing it
class CurrencyConverterMaterialPage extends StatefulWidget {
  //we can't access the statefull directly so we made fuction to access state

  const CurrencyConverterMaterialPage({super.key});
  // {
  //   print('constructor');
  // }

  @override
  State<CurrencyConverterMaterialPage> createState() =>
      _CurrencyConverterMaterialPageState();
  // {
  //   print('createState');
  //   return _CurrencyConverterMaterialPageState();
  // }
}

class _CurrencyConverterMaterialPageState
    extends State<CurrencyConverterMaterialPage> {
  //it's help to create all the variable and all useful things
  //private class as _ is in the first
  //no need to set super key as it's subclass

  // @override
  // void initState() {
  //   // helps to call the class in such a way that it get called by the
  //   //before build fn
  //   super.initState();
  //   print('rebuitl');
  // }

  double result = 0;
  final TextEditingController textEditingController = TextEditingController();
//making the build fuc small so that the frame not got drops , make it simple

  @override
  void dispose() {
    textEditingController.dispose(); //it used at the end as if another page we
    //visit , texteditor should not store value , so it resets it at the
    super.dispose();
  }

  void convert() {
    //set state vey IMPORTANT
    //helps to know that the result needs to be rebuilt or updated
    result = double.parse(textEditingController.text) * 83.75;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // print('build fn');
    final border = OutlineInputBorder(
      borderSide: const BorderSide(
        width: 2,
        style: BorderStyle.solid,
      ),
      borderRadius: BorderRadius.circular(10),
    );

    return Scaffold(
      backgroundColor: Colors.blueGrey,

      //app bar
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        elevation: 0, // used for the merging to the background
        title: const Text(
          'Currency Converter',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle:
            true, //always true for the center in both ios and android and false give the left side text to be shown
      ),

      body: Center(
        // color: Color.fromRGBO(255, 0, 0, 1),

        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            // Center horizontal with remoce factor
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                //for the INR sign
                'INR ${result != 0 ? result.toStringAsFixed(3) : result.toStringAsFixed(0)}',
                //as inside the text of the result , it goes beyond the view field , so we use
                //if and else condition for it
                style: const TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
              const Text(
                "AVNISH",
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: AutofillHints.creditCardFamilyName,
                    fontSize: 20,
                    fontWeight: FontWeight.w400),
              ),
              //Text field adding
              TextField(
                //controller for text editing controller
                controller: textEditingController,

                style: const TextStyle(
                  color: Colors.black,
                ),

                decoration: InputDecoration(
                  hintText: 'Please Enter the Amount in USD',
                  hintStyle: const TextStyle(
                    // added cost due to scaffold is not const
                    color: Colors.black,
                  ),
                  prefixIcon: const Icon(Icons.monetization_on_outlined),
                  //suffix
                  prefixIconColor: Colors.black,

                  filled: true,
                  fillColor: Colors.white,

                  //now to remove the thin blue line
                  focusedBorder: border, //OutlineInputBorder(

                  //#########################
                  enabledBorder: border,
                ),
                // for the keyboard to get only nos. access
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                  signed: true,
                ),
              ),
              //button

              //raised
              //appears like a text

              //don't use container use instead sizebox as it save time
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                //TextButton normal button  // used for shadows
                onPressed:
                    convert, // as both are void thus no problem don't use convert(),
                style: TextButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),

                child:
                    const Text('Convert'), //child should be at last in button
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// //const removed due to text editor
// class CurrencyConverterMaterialPagee extends StatelessWidget {
//   const CurrencyConverterMaterialPagee({super.key});

//   @override
//   Widget build(BuildContext context) {
//     print('rebuilt');
//     // its inside the function as statelesswidget can't be changed and in function , it can be changed
//     double result = 0;

//     //text editing controller for the widgets to access the value entered in the text field
//     final TextEditingController textEditingController = TextEditingController();

//     //for the border thing not to be zoon in or out when clicked
//     final border = OutlineInputBorder(
//       borderSide: const BorderSide(
//         width: 2,
//         style: BorderStyle.solid,
//       ),
//       borderRadius: BorderRadius.circular(10),
//     ); // its a function

//     // buildcontext is class inside widget // for navigation and all the location things in widget tree
//     return Scaffold(
//       // removed cost due to radius border issue
//       backgroundColor: Colors.blueGrey,

//       //app bar
//       appBar: AppBar(
//         backgroundColor: Colors.blueGrey,
//         elevation: 0, // used for the merging to the background
//         title: const Text(
//           'Currency Converter',
//           style: TextStyle(
//             color: Colors.white,
//           ),
//         ),
//         centerTitle:
//             true, //always true for the center in both ios and android and false give the left side text to be shown
//       ),

//       body: Center(
//         // color: Color.fromRGBO(255, 0, 0, 1),

//         child: Column(
//           // Center horizontal with remoce factor
//           mainAxisAlignment: MainAxisAlignment.center,
//           // crossAxisAlignment: CrossAxisAlignment.end,//it doesn't change as child takes the required space
//           // //now it can accept list of widgets
//           // child: Text('Hello paaje'),
//           children: [
//             Text(
//               // added cost due to scaffold is not const
//               result.toString(), //as it is in double convert it to str
//               //result =0 , thus it doesn't got changed

//               style: const TextStyle(
//                 fontSize: 35,
//                 fontWeight: FontWeight.bold,
//                 color:
//                     Color.fromARGB(255, 255, 255, 255), //255 is fully visible
//               ),
//             ),
//             const Text(
//               // added cost due to scaffold is not const
//               "AVNISH",
//               style: TextStyle(
//                   color: Colors.white,
//                   fontFamily: AutofillHints.creditCardFamilyName,
//                   fontSize: 20,
//                   fontWeight: FontWeight.w400),
//             ),
//             //Text field adding
//             Padding(
//               padding: const EdgeInsets.all(10),
//               child: TextField(
//                 //controller for text editing controller
//                 controller: textEditingController,

//                 //for text to be added

//                 //onsubmitted triggered only when enter button will be submitted
//                 //I want the button to be triggered on the convert button also
//                 // onSubmitted: (value) => print(value),

//                 style: const TextStyle(
//                   // added cost due to scaffold is not const
//                   color:
//                       Colors.black, //this is textstyle and it's for the texts
//                 ),

//                 decoration: InputDecoration(
//                   // label: Text(
//                   //   'Please enter the amount in INR',
//                   //   style: TextStyle(
//                   //     color: Colors.white,
//                   //   ),
//                   // ),
//                   hintText: 'Please Enter the Amount in USD',
//                   hintStyle: const TextStyle(
//                     // added cost due to scaffold is not const
//                     color: Colors.black,
//                   ),
//                   prefixIcon: const Icon(Icons.monetization_on_outlined),
//                   //suffix
//                   prefixIconColor: Colors.black,

//                   //for textfield inside its own boundary
//                   filled: true,
//                   fillColor: Colors.white,

//                   //now to remove the thin blue line
//                   focusedBorder: border, //OutlineInputBorder(
//                   //   borderSide: const BorderSide(
//                   //     // added cost due to scaffold is not const
//                   //     // color: Colors.black,
//                   //     width: 2,
//                   //     // style: BorderStyle.none,
//                   //     style: BorderStyle.solid,
//                   //     //strokealign for center , inside , outside box
//                   //     // strokeAlign: BorderSide.strokeAlignOutside,
//                   //   ),
//                   //   // borderRadius: BorderRadius.all(Radius.circular(10)),
//                   //   borderRadius: BorderRadius.circular(10),
//                   //   // borderRadius: BorderRadius.horizontal(SSSSSS
//                   //   //   right: Radius.circular(60), // right side will not get bordered
//                   //   // borderRadius: BorderRadius.vertical(
//                   //   //   top: Radius.circular(60), // top side will not get bordered
//                   //   // ),
//                   // ),

//                   //#########################
//                   enabledBorder: border, //const OutlineInputBorder(
//                   //   //as we used focusedbordered name so we used enable bordered
//                   //   borderSide: BorderSide(
//                   //     width: 2,
//                   //     style: BorderStyle.solid,
//                   //   ),
//                   // ),
//                 ),
//                 // for the keyboard to get only nos. access
//                 keyboardType: const TextInputType.numberWithOptions(
//                   decimal: true,
//                   signed: true,
//                 ),
//               ),
//             ),
//             //button

//             //raised
//             //appears like a text
//             Padding(
//               padding: const EdgeInsets.all(10.0),
//               child: ElevatedButton(
//                 //TextButton normal button  // used for shadows
//                 onPressed: () {
//                   // // modes - debug, release ,profile
//                   // if (kDebugMode) {
//                   //   print('button clicked');
//                   // }
//                   // print(textEditingController.text);
//                   // print(double.parse(textEditingController.text) * 81);

//                   result = double.parse(textEditingController.text) * 81;
//                   build(context); //to call the full function from the top
//                   //result =0 get set everytime initially and global variable also not worked

//                   //it is due to stateless widget as it is immutable
//                 },

//                 //Used for the in long terms button property

//                 // style: const ButtonStyle(
//                 //   backgroundColor: WidgetStatePropertyAll(Colors.black),
//                 //   foregroundColor: WidgetStatePropertyAll(Colors.white),
//                 //   minimumSize:
//                 //       WidgetStatePropertyAll(Size(double.infinity, 50)),
//                 //   shape: WidgetStatePropertyAll(RoundedRectangleBorder()),
//                 // ),

//                 //sortcut style
//                 style: TextButton.styleFrom(
//                   backgroundColor: Colors.black,
//                   foregroundColor: Colors.white,
//                   minimumSize: const Size(double.infinity, 50),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(5),
//                   ),
//                 ),

//                 child:
//                     const Text('Convert'), //child should be at last in button
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
