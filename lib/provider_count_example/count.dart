import 'dart:async';

import 'package:flutter/material.dart';
import 'package:protutorial/provider_count_example/count_provider.dart';
import 'package:provider/provider.dart';

class CountExample extends StatefulWidget {
  const CountExample({super.key});

  @override
  State<CountExample> createState() => _CountExampleState();
}

class _CountExampleState extends State<CountExample> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final countProvider = Provider.of<CountProvider>(context, listen: false);
    Timer.periodic(Duration(seconds: 2), (timer) {
      countProvider.setcount();
    },);
  }

  @override
  Widget build(BuildContext context) {
    final countProvider = Provider.of<CountProvider>(context, listen: false);
    print("build");
    return Scaffold(
      appBar: AppBar(
        title: Text("Provider Count Example"),
      ),
      body: Center(
        child: Consumer<CountProvider>(builder: (context, value, child){
          print("only this widget builds");
          return Text(countProvider.count.toString(), style: TextStyle(fontSize: 40),);
        },)
        ,),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          countProvider.setcount();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
