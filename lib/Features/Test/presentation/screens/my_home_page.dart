import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_code/Features/Test/presentation/widgets/product_list.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key,  });



  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text('Test Code'),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: ProductList(),
      ),
    );
  }
}