import 'package:flutter/material.dart';

class TunkinPage extends StatefulWidget{
  @override
  _TunkinPageState createState() => _TunkinPageState();
}

class _TunkinPageState extends State<TunkinPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("This tunkin page"),
      ),
    );
  }

}