import 'package:flutter/material.dart';

import './transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense ',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
        id: 't1', title: 'new shoes', amount: 120, date: DateTime.now()),
    Transaction(
        id: 't2', title: 'groceries', amount: 60.30, date: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'App',
            style: TextStyle(color: Color(0xFF432f44)),
          ),
          backgroundColor: Color(0xFFFFD460),
        ),
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Card(
                child: Container(
                  width: double.infinity,
                  height: 100,
                  child: Text('Chart'),
                ),
                elevation: 5.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: transactions.map((tx) {
                  return Card(
                    elevation: 5.0,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.black, width: 2)),
                            child: Text(
                              '${tx.amount}',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Column(
                            children: <Widget>[
                              Text(
                                tx.title,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(tx.date.toString()),
                            ],
                          )
                        ]),
                  );
                }).toList(),
              )
            ]));
  }
}
