import 'dart:ffi';

import 'package:flutter/material.dart';

import 'SDAdapter.dart';

void main() {
  runApp(const MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SDUI',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'SDUI'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: body(),
    );
  }

  Widget body(){
    return Column(
      children: [
        SDAdapter()
      ],
    );
  }

  Widget profile(ImagePosition imagePosition) {
    return Column(children: [
      if (imagePosition == ImagePosition.Center) ...[
        Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              profileImage(0),
              profileContent(0,CrossAxisAlignment.center),
            ],
          ),
        )
      ] else ...[
        Row(
          children: [
            if (ImagePosition.Left == imagePosition) ...[
              profileImage(2),
              profileContent(8,CrossAxisAlignment.start),
            ] else ...[
              profileContent(8,CrossAxisAlignment.start),
              profileImage(2),
            ]
          ],
        )
      ]
    ]);
  }

  Widget testWidget(){
    return Center(
      child: Text("Hello"),
    );
  }

  Widget profileImage(int flexValue){
    return Expanded(
      flex: flexValue,
        child: Padding(
          padding: const EdgeInsets.only(right: 8,left: 8, top: 16, bottom: 16),
          child: Container(
            height: 100,
                  width: 100,
                  child: CircleAvatar(
                      backgroundImage: AssetImage("assets/flutter_Dash.jpeg")))),
        );

  }

  Widget profileContent(int flexValue, CrossAxisAlignment crossAxisAlignment){
    return Expanded(
      flex: flexValue,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: crossAxisAlignment,
          children: const [
            Text("Partha",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),textAlign: TextAlign.left),
            Text("Flutter Developer",style: TextStyle(fontSize: 20,fontWeight: FontWeight.normal),textAlign: TextAlign.left)
          ],
        ),
      ),
    );
  }

  Widget contentList(){
    return ListView.builder(itemCount: 5,itemBuilder: (BuildContext context, int index){
      return Container();
    });
  }
}




enum ImagePosition{
  Left,
  Right,
  Center
}

enum WidgetPosition{
  Left,
  Right,
  Center
}



