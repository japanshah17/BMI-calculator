// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

void main() {
  runApp(const Calc());
}

class Calc extends StatefulWidget {
  const Calc({Key? key}) : super(key: key);

  @override
  CalcState createState() {
    return CalcState();
  }
}

class CalcState extends State {
  String dropdownvalue = 'Centi Meter';
  var items = ['Centi Meter', 'Meter'];
  String status = "";
  double bmi = 0;
  TextEditingController controlweight = TextEditingController();
  TextEditingController controlheight = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: Colors.black,
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.black,
            elevation: 0,
            title: const Text(
              'BMI Calculator',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.yellow),
            ),
          ),
          body: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      child: TextField(
                        style: const TextStyle(color: Colors.yellow),
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Enter your Height",
                          labelStyle: TextStyle(color: Colors.yellow),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.yellow, width: 2.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.white, width: 2.0)),
                        ),
                        controller: controlheight,
                      ),
                    ),
                  ),
                  Expanded(
                    child: DropdownButton(
                      dropdownColor: Colors.black,
                      value: dropdownvalue,
                      isExpanded: true,
                      elevation: 16,
                      itemHeight: null,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      items: items.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownvalue = newValue!;
                        });
                      },
                      style: const TextStyle(
                        color: Colors.yellow,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.all(10),
                child: TextField(
                  style: const TextStyle(color: Colors.yellow),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Enter your Weight",
                    labelStyle: TextStyle(color: Colors.yellow),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.yellow, width: 2.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.white, width: 2.0)),
                  ),
                  controller: controlweight,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 50),
                child: FilledButton(
                  onPressed: () {
                    if (controlheight.text != "" && controlweight.text != "") {
                      double h = double.parse(controlheight.text);
                      double w = double.parse(controlweight.text);
                      if (dropdownvalue == "Centi Meter") {
                        h = h / 100;
                      }
                      bmi = (w / (h * h));
                      setState(() {
                        if (bmi < 18.5) {
                          status = "under Weight";
                        } else if (bmi > 24.9) {
                          status = "Over Weight";
                        } else {
                          status = "Normal";
                        }
                      });
                    } else {
                      setState(() {
                        status = "Please write both";
                      });
                    }
                  },
                   style: ButtonStyle(
                  backgroundColor:MaterialStatePropertyAll(
                  Colors.yellow),),
                
                  child: const Text('Check BMI',
                      style: TextStyle(fontSize: 24, color: Colors.black)),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 50),
                child: Text(
                  'BMI: $bmi',
                  style: const TextStyle(
                    color: Colors.yellow,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 50),
                child: Text(
                  status,
                  style: const TextStyle(
                    color: Colors.yellow,
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
