import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sundae_app/about.dart';
import 'package:sundae_app/orders.dart';



void main() {
  runApp(MaterialApp(home: sundaeApp()));
}

class sundaeApp extends StatefulWidget {
  const sundaeApp({Key? key}) : super(key: key);

  @override

  State<sundaeApp> createState() => _sundaeAppState();
}

class _sundaeAppState extends State<sundaeApp> {
  var _peanuts = false;
  var _almonds = false;
  var _strawberries = false;
  var _gummybears = false;
  var _mms = false;
  var _brownies = false;
  var _oreos = false;
  var _marshmallows = false;

  var _size = ['small', 'medium', 'large'];
  var selSize = "small";
  var selFlavor = "vanilla";
  var _flavor = ['vanilla', 'strawberry', 'chocolate'];

  var fudge = 0;

  var total = 0.00;
  var price = 0.00;
  var fudgePrice = 0.00;
  var sizePrice = 2.99;
  var theWorks = false;

  final List<Order> _orders = [];

  List<DropdownMenuItem<String>> buildSizeMenu(){
    List<DropdownMenuItem<String>> sizeItems =[];
    for (String size in _size){
      var newSize = DropdownMenuItem(
        child: Text(size),
        value:size,
      );
      sizeItems.add(newSize);
    }
    return sizeItems;
  }

  List<DropdownMenuItem<String>> buildFlavorMenu(){
    List<DropdownMenuItem<String>> flavItems =[];
    for (String flavor in _flavor){
      var newFlav = DropdownMenuItem(
        child: Text(flavor),
        value:flavor,
      );
      flavItems.add(newFlav);
    }
    return flavItems;
  }

  void handleCheckBox(String name, bool val){
    setState(() {
      switch (name){
        case 'Peanuts':
          _peanuts = val;
          if (_peanuts == true){
            price += 0.15;
          }
          else{
            price -= 0.15;
          }
          break;

        case 'Almonds':
          _almonds = val;
          if (_almonds == true){
            price += 0.15;
          }
          else{
            price -= 0.15;
          }
          break;

        case 'Strawberries':
          _strawberries = val;
          if (_strawberries == true){
            price += 0.20;
          }
          else{
            price -= 0.20;
          }
          break;

        case 'Gummy Bears':
          _gummybears = val;
          if (_gummybears == true){
            price += 0.20;
          }
          else{
            price -= 0.20;
          }
          break;

        case 'M&Ms':
          _mms = val;
          if (_mms == true){
            price += 0.25;
          }
          else{
            price -= 0.25;
          }
          break;

        case 'Brownies':
          _brownies = val;
          if (_brownies == true){
            price += 0.20;
          }
          else{
            price -= 0.20;
          }
          break;

        case 'Oreos':
          _oreos = val;
          if (_oreos == true){
            price += 0.20;
          }
          else{
            price -= 0.20;
          }
          break;

        case 'Marshmallows':
          _marshmallows = val;
          if (_marshmallows == true){
            price += 0.15;
          }
          else{
            price -= 0.15;
          }
          break;

      }
    });
  }

  void fudgePricing(){
    if (fudge == 0){
      fudgePrice = 0.0;
    }
    if (fudge == 1){
      fudgePrice = 0.15;
    }
    if (fudge == 2){
      fudgePrice = 0.25;
    }
    if (fudge == 3){
      fudgePrice = 0.30;
    }
  }

  void sizePricing(){
    if (selSize == "small"){
      sizePrice = 2.99;
    }
    if (selSize == "medium"){
      sizePrice = 3.99;
    }
    if (selSize == "large"){
      sizePrice = 4.99;
    }
  }

  void aboutMenu() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const AboutScreen(),
      ),
    );
  }

  void ordersMenu() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => OrdersScreen(orders: _orders,) // New file OrderScreen
      ),
    );
  }

  void reset(){
    if (_peanuts == true) {
      handleCheckBox("Peanuts", false);
    }
    if (_almonds == true) {
      handleCheckBox("Almonds", false);
    }
    if (_strawberries == true) {
      handleCheckBox("Strawberries", false);
    }
    if (_gummybears == true) {
      handleCheckBox("Gummy Bears", false);
    }
    if (_mms == true){
      handleCheckBox("M&Ms", false);
    }
    if (_oreos == true){
      handleCheckBox("Oreos", false);
    }
    if (_brownies == true){
      handleCheckBox("Brownies", false);
    }
    if (_marshmallows == true){
      handleCheckBox("Marshmallows", false);
    }

    if (fudge != 0){
      fudge = 0;
      fudgePricing();
    }

    if (selSize != "small"){
      selSize = "small";
      sizePricing();
    }

    if (selFlavor != "vanilla"){
      selFlavor = "vanilla";
    }
  }

  @override

  Widget build(BuildContext context) {

    total = sizePrice + price + fudgePrice;
    var totalPrice = total.toStringAsFixed(2);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Ice Cream Sundae"),
          actions: <Widget>[
            PopupMenuButton<String>(
              onSelected: (choice){
                if (choice == "About"){
                  //go to about screen
                  aboutMenu();
                }
                else{
                  //go to orders
                  ordersMenu();
                }
              },
              itemBuilder: (BuildContext context){
                 return {"Orders", "About"}.map((String choice) {
                   return PopupMenuItem<String>(
                     value:choice,
                     child:Text(choice),
                   );
                  }).toList();
                }
            )
          ],
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/icecream.png', width: 60,),
                  Text("Sundae Maker", style: TextStyle(fontSize: 36.0),),
                ],
              ),

              Column(
                children: [
                  Text("\$$totalPrice", style: TextStyle(fontSize: 36.0),),
                ],
              ),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Size:  "),
                  DropdownButton(
                      value: selSize,
                      items: buildSizeMenu(),
                      onChanged: (String? str){
                        setState(() {
                          selSize = str!;
                          sizePricing();
                        });
                      }),
                  ]),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children:[
                     Text("Flavor:  "),
                     DropdownButton(
                         value: selFlavor,
                         items: buildFlavorMenu(),
                         onChanged: (String? str){
                           setState(() {
                             selFlavor = str!;
                           });
                         })
                   ]
                 ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:[
                Expanded(
            child: Column(
                  children: [
                    CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                        value: _peanuts,
                        title: Text("Peanuts"),
                        onChanged: (bool? val){
                        setState(() {
                          handleCheckBox("Peanuts", val!);
                        });
                        }),
                    CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        value: _almonds,
                        title: Text("Almonds"),
                        onChanged: (bool? val){
                          setState(() {
                            handleCheckBox("Almonds", val!);
                          });
                        }),
                    CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        value: _strawberries,
                        title: Text("Strawberries"),
                        onChanged: (bool? val){
                          setState(() {
                            handleCheckBox("Strawberries", val!);
                          });
                        }),
                    CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        value: _gummybears,
                        title: Text("Gummy Bears"),
                        onChanged: (bool? val){
                          setState(() {
                            handleCheckBox("Gummy Bears", val!);
                          });
                        }),
                  ],
                ),),
              Expanded(child: Column(
                children: [
                  CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      value: _mms,
                      title: Text("M&Ms"),
                      onChanged: (bool? val){
                        setState(() {
                          handleCheckBox("M&Ms", val!);
                        });
                      }),
                  CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      value: _brownies,
                      title: Text("Brownies"),
                      onChanged: (bool? val){
                        setState(() {
                          handleCheckBox("Brownies", val!);
                        });
                      }),
                  CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      value: _oreos,
                      title: Text("Oreos"),
                      onChanged: (bool? val){
                        setState(() {
                          handleCheckBox("Oreos", val!);
                        });
                      }),
                  CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      value: _marshmallows,
                      title: Text("Marshmallows"),
                      onChanged: (bool? val){
                        setState(() {
                          handleCheckBox("Marshmallows", val!);
                        });
                      })
                ],
              ),),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Fudge: "),
                Slider(
                    value: fudge.toDouble(),
                    min: 0.0,
                    max: 3.0,
                    label: fudge.toString(),
                    divisions: 3,
                    onChanged: (double val){
                      setState(() {
                        fudge = val.toInt();
                        fudgePricing();
                      });
                    }
                ),
                Text("$fudge oz")
              ],
            ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed: (){
                        setState(() {
                          if (_peanuts == false) {
                            handleCheckBox("Peanuts", true);
                          }
                          if (_almonds == false) {
                            handleCheckBox("Almonds", true);
                          }
                          if (_strawberries == false) {
                            handleCheckBox("Strawberries", true);
                          }
                          if (_gummybears == false) {
                          handleCheckBox("Gummy Bears", true);
                          }
                          if (_mms == false){
                            handleCheckBox("M&Ms", true);
                          }
                          if (_oreos == false){
                            handleCheckBox("Oreos", true);
                          }
                          if (_brownies == false){
                            handleCheckBox("Brownies", true);
                          }
                          if (_marshmallows == false){
                            handleCheckBox("Marshmallows", true);
                          }

                          if (fudge != 3){
                            fudge = 3;
                            fudgePricing();
                          }

                          if (selSize != "large"){
                            selSize = "large";
                            sizePricing();
                          }

                        });
                      },
                      child: Text("The Works!", style: TextStyle(fontSize: 18.0),),
                  ),
                  TextButton( onPressed: () {
                    setState(() {
                      reset();
                    });
                  }, child: Text("Reset", style: TextStyle(fontSize: 18.0)),
                  ),
                  TextButton( onPressed: () {
                    setState(() {
                      Fluttertoast.showToast(msg: "Thank you for your order!");
                      var ordered = Order(selSize, selFlavor, totalPrice);
                      _orders.add(ordered);

                      reset();
                    });
                  }, child: Text("Order", style: TextStyle(fontSize: 18.0)),
                  ),
                ],
              )
            ],), //Everything goes before this!!!!!!
        ),
      ),
    );
  }
}

