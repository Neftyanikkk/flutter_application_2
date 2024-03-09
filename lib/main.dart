// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PageView(
        children: [
          Screen1(),
          Screen2(),
          
        ],
      ),
      theme: ThemeData.dark(),
    );
  }
}

class Screen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home page'),
      ),
      body: Stack(
        children: <Widget>[
          Center(
            child: Text(
              'Добро пожаловать!',
              textDirection: TextDirection.ltr,
              style: TextStyle(fontSize: 30.0),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Text('Свайпните вправо, чтобы продолжить ->',
                  textDirection: TextDirection.ltr),
            ),
          ),
        ],
      ),
    );
  }
}

class Screen2 extends StatefulWidget {
  @override
  _Screen2State createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  final _formKey = GlobalKey<FormState>();
  String _cryptoName = '';
  String _cryptoAmount = '';

  void _buyCrypto() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final message = 'Куплено: $_cryptoName, Количество: $_cryptoAmount';
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
    }
  }

  void _sellCrypto() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final message = 'Продано: $_cryptoName, Количество: $_cryptoAmount';
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Trade screen'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                onSaved: (value) => _cryptoName = value!,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Name of cryptocurrency',
                ),
              ),
              SizedBox(height: 20.0),
              TextFormField(
                onSaved: (value) => _cryptoAmount = value!,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Amount',
                ),
              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: _buyCrypto,
                    child: Text('Купить'),
                  ),
                  ElevatedButton(
                    onPressed: _sellCrypto,
                    child: Text('Продать'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
