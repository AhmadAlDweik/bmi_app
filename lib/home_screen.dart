import 'package:bmi/result_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, a}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isMale = true;
  double heightVal = 170;
  int weight = 50;
  int age = 25;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Body Mass Index "),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      genderCart(context, 'male'),
                      const SizedBox(
                        width: 15,
                      ),
                      genderCart(context, 'female'),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      ageWeightCart(context, 'weight'),
                      const SizedBox(
                        width: 15,
                      ),
                      ageWeightCart(context, 'age'),
                    ],
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height / 16,
                color: Colors.teal,
                width: double.infinity,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return Result(
                          age: age,
                          result: 23.4,
                          isMale: isMale,
                        );
                      },
                    ));
                  },
                  child: const Text(
                    "Calculate",
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ));
  }

  Expanded genderCart(BuildContext context, String type) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            type == 'male' ? isMale = true : isMale = false;
          });
        },
        child: Container(
          decoration: BoxDecoration(
              color: (isMale && type == "male") || (!isMale && type == "female")
                  ? Colors.teal
                  : Colors.blueGrey,
              borderRadius: BorderRadius.circular(10)),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Icon(
              type == 'male' ? Icons.male : Icons.female,
              size: 90,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              type == 'male' ? 'Male' : "Female",
              style: Theme.of(context).textTheme.headline2,
            )
          ]),
        ),
      ),
    );
  }

  Expanded ageWeightCart(BuildContext context, String type) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            color: Colors.blueGrey, borderRadius: BorderRadius.circular(10)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              type == 'age' ? 'Age' : "Weight",
              style: Theme.of(context).textTheme.headline2,
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              type == 'age' ? '$age' : "$weight",
              style: Theme.of(context).textTheme.headline1,
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  heroTag: type == 'age' ? 'age--' : "Weight--",
                  onPressed: () {
                    setState(() {
                      type == 'age' ? age-- : weight--;
                    });
                  },
                  child: const Icon(Icons.remove),
                  mini: true,
                ),
                FloatingActionButton(
                  heroTag: type == 'age' ? 'age++' : 'Weight++',
                  onPressed: () {
                    setState(() {
                      type == 'age' ? age++ : weight++;
                    });
                  },
                  child: const Icon(Icons.add),
                  mini: true,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
