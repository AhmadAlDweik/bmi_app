import 'package:flutter/material.dart';

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
                      GenderCart(context, 'male'),
                      const SizedBox(
                        width: 15,
                      ),
                      GenderCart(context, 'female'),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      ageWeightCart(context, 'male'),
                      const SizedBox(
                        width: 15,
                      ),
                      ageWeightCart(context, 'female'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  Expanded GenderCart(BuildContext context, String type) {
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
            Icon(type == 'male' ? Icons.male : Icons.female),
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
            Icon(type == 'male' ? Icons.male : Icons.female),
            const SizedBox(
              height: 20,
            ),
            Text(
              type == 'male' ? 'Male' : "Female",
              style: Theme.of(context).textTheme.headline2,
            )
          ],
        ),
      ),
    );
  }
}
