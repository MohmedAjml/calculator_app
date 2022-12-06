import 'package:flutter/material.dart';

void main() {
  runApp(const Calculator());
}

class Calculator extends StatelessWidget {
  const Calculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const Homepage(),
    );
  }
}

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  late int firnum;
  late int secnum;
  String texttodisplay = "";
  late String res;
  late String opertiontoperform;

  void btclicked(String bttext) {
    if (bttext == "C") {
      texttodisplay = "";
      firnum = 0;
      secnum = 0;
      res = "";
    } else if (bttext == "+" ||
        bttext == "-" ||
        bttext == "x" ||
        bttext == "/") {
      firnum = int.parse(texttodisplay);
      res = "";
      opertiontoperform = bttext;
    } else if (bttext == "=") {
      secnum = int.parse(texttodisplay);
      if (opertiontoperform == "+") {
        res = (firnum + secnum).toString();
      }
      if (opertiontoperform == "-") {
        res = (firnum - secnum).toString();
      }
      if (opertiontoperform == "x") {
        res = (firnum * secnum).toString();
      }
      if (opertiontoperform == "/") {
        res = (firnum ~/ secnum).toString();
      }
    } else {
      res = int.parse(texttodisplay + bttext).toString();
    }

    setState(() {
      texttodisplay = res;
    });
  }

  Widget custombutton(String btval) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: OutlinedButton(
          onPressed: () => btclicked(btval),
          child: Text(
            // ignore: unnecessary_string_interpolations
            "$btval",
            style: const TextStyle(fontSize: 30.0,color: Colors.white),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.black,
      appBar: AppBar(
        title: const Text(
          'Calculator',
        ),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(10.0),
                alignment: Alignment.bottomRight,
                child: Text(
                  // ignore: unnecessary_string_interpolations
                  "$texttodisplay",
                  style: const TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.w600,color:Colors.white,
                  ),
                ),
              ),
            ),
            Row(
              children: [
                custombutton("7"),
                custombutton("8"),
                custombutton("9"),
                custombutton("+"),
              ],
            ),
            Row(
              children: [
                custombutton("4"),
                custombutton("5"),
                custombutton("6"),
                custombutton("-"),
              ],
            ),
            Row(
              children: [
                custombutton("1"),
                custombutton("2"),
                custombutton("3"),
                custombutton("x"),
              ],
            ),
            Row(
              children: [
                custombutton("C"),
                custombutton("0"),
                custombutton("="),
                custombutton("/"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
