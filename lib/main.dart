// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:shimmer_effect/api_respons.dart';
import 'package:shimmer_effect/shimmer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key,});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.green,
        title: const Text('Shimmer',style: TextStyle(fontSize: 15),),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const Apidemo(),));
              }, 
              child: const Text("Shimmer Effect")
            ),
          ],
        ),
      ),
    );
  }
}

class Apidemo extends StatefulWidget {
  const Apidemo({super.key});

  @override
  State<Apidemo> createState() => _ApidemoState();
}

class _ApidemoState extends State<Apidemo> {

  var usd = [];
  var rate = [];
  int load = 0;

  @override
  void initState() {
    Usdratedata();
    super.initState();
  }

  Usdratedata()async{
    usdratedata = await fetchusdrate();
    usdratedata!.rates.forEach((key, value) {
      usd.add(key);
      rate.add(value);
    });
    setState(() {
      load = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('USD Rates',style: TextStyle(fontSize: 15),),
        backgroundColor: Colors.green,
      ),
      body: load == 0 ? usdrateshimmer() :  Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: usd.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.green.withOpacity(0.5),
                    child: Text("${index+1}",style: const TextStyle(color: Colors.black),),
                  ),
                  title: Text(usd[index]),
                  trailing: Text(rate[index].toString()),
                );
              }, 
            ),
          )
        ],
      )
    );
  }
}
