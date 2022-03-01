import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<MaterialColor> theColors = [
    Colors.green,
    Colors.grey,
    Colors.yellow,
    Colors.orange,
    Colors.cyan,
    Colors.red,
    Colors.blueGrey
  ];

  int theIndex = 0;

  void updateTheColor(int newIndex){
    setState(() {
      theIndex = newIndex;
    });
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Testing Global State Mgmt'),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TheColorBox(theColors[theIndex]),
            SizedBox(height: 30,),
            TheColorOptions(theColors: theColors, theFunction: updateTheColor)
          ],
        ),
      ),
    );
  }
}


class TheColorOptions extends StatefulWidget {
  final Function theFunction;
  const TheColorOptions({
    Key? key,
    required this.theColors,
    required this.theFunction
  }) : super(key: key);

  final List<MaterialColor> theColors;

  @override
  State<TheColorOptions> createState() => _TheColorOptionsState();
}

class _TheColorOptionsState extends State<TheColorOptions> {

  @override
  Widget build(BuildContext context) {

    return Container(
      child: Expanded(
        child: ListView.builder(
          itemCount:widget.theColors.length,itemBuilder: (context,index){
          return GestureDetector(
            onTap: (){
              print(index);
              widget.theFunction(index);
            },
            child: Container(
              width: double.infinity,
              color: widget.theColors[index],
              height: 100,
              child: Text('Some Color'),
            ),
          );
        }),
      ),
    );
  }
}

class TheColorBox extends StatefulWidget {
  MaterialColor mc;
  TheColorBox(this.mc, {Key? key}) : super(key: key);

  @override
  _TheColorBoxState createState() => _TheColorBoxState();
}

class _TheColorBoxState extends State<TheColorBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.mc,
      height: 150,
      width: double.infinity,
    );
  }
}

