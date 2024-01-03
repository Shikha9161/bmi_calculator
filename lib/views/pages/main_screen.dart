import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();
  var result = "";
  var bgColor = Colors.white;
  var textColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Center(
            child: Text(
              "Find Your BMI",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          )),
      body: Container(
        color: bgColor,
        child: Center(
          child: Container(
            width: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "BMI CALCULATOR",
                  style: TextStyle(
                      color: textColor,
                      fontSize: 22,
                      fontWeight: FontWeight.w600),
                ),
                Divider(color: Colors.teal,),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  style: TextStyle(color: textColor),
                  controller: wtController,
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                      color: textColor,
                    )),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                      color: textColor,
                    )),
                    label: Text(
                      "Enter weight",
                      style: TextStyle(color: textColor),
                    ),
                    prefixIcon: Icon(
                      Icons.line_weight,
                      color: textColor,
                    ),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 15,
                ),
                TextField(
                  style: TextStyle(color: textColor),
                  controller: ftController,
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                      color: textColor,
                    )),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                      color: textColor,
                    )),
                    label: Text(
                      "Enter height(in foot)",
                      style: TextStyle(color: textColor),
                    ),
                    prefixIcon: Icon(
                      Icons.height_outlined,
                      color: textColor,
                    ),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 15,
                ),
                TextField(
                  style: TextStyle(color: textColor),
                  controller: inController,
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                      color: textColor,
                    )),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                      color: textColor,
                    )),
                    label: Text(
                      "Enter height(in inch)",
                      style: TextStyle(color: textColor),
                    ),
                    prefixIcon: Icon(
                      Icons.height_outlined,
                      color: textColor,
                    ),
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                    ),
                    onPressed: () {
                      var wt = wtController.text.toString();
                      var ft = ftController.text.toString();
                      var inch = inController.text.toString();

                      if (wt != "" && ft != "" && inch != "") {
                        var iWt = int.parse(wt);
                        var iFt = int.parse(ft);
                        var iInch = int.parse(inch);

                        var tInch = (iFt * 12) + iInch;
                        var tCm = tInch * 2.54;
                        var tM = tCm / 100;
                        var bmi = iWt / (tM * tM);
                        var msg = "";
                        if (bmi > 25) {
                          msg = "You are overweight!";
                          bgColor = Colors.orange.shade400;
                        } else if (bmi < 18) {
                          msg = "You are underweight!";
                          bgColor = Colors.red.shade400;
                        } else {
                          msg = "you are healthy!";
                          bgColor = Colors.green.shade400;
                        }
                        textColor = Colors.white;
                        setState(() {
                          result =
                              "$msg \n Your Bmi is: ${bmi.toStringAsFixed(3)}";
                        });
                      } else {
                        setState(() {
                          result = "Please fill all the required fields";
                        });
                      }
                    },
                    child: Text(
                      "Calculate",
                      style: TextStyle(color: Colors.white),
                    )),
                SizedBox(
                  height: 20,
                ),
                Text(
                  result,
                  style: TextStyle(fontSize: 20, color: textColor),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
