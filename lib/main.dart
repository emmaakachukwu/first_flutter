import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import './transaction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
      id: 't1',
      title: 'New Shoes',
      amount: 89.90,
      date: DateTime.now()
    ),
    Transaction(
      id: 't2',
      title: 'New Stuffs',
      amount: 59.65,
      date: DateTime.now()
    ),
  ];

  // String titleInput;
  // String amountInput;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Xpense App'),
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Card(
              color: Colors.blue,
              child: Text('Chart'),
              elevation: 5,
            ),
          ),
          Column(
            children: transactions.map((tx){
              return Card(
                child: Row(
                  children: <Widget>[
                    Container(
                              decoration: InputDecoration(labelText: 'Title'),
                              decoration: InputDecoration(labelText: 'Title'),
                      margin: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 15
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 1
                        )
                      ),
                      padding: EdgeInsets.all(10),
                      child: Text(
                        '\$${tx.amount}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.purple,
                        ),
                      )
                    ),
                    Card(
                      elevation: 3,
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            TextField(
                              decoration: InputDecoration(labelText: 'Title'),
                              // onChanged: (value) => titleInput = value
                              controller: titleController,
                            ),
                            TextField(
                              decoration: InputDecoration(labelText: 'Title'),
                              decoration: InputDecoration(labelText: 'Amount'),
                              // onChanged: (val) => amountInput = val
                              controller: amountController,
                            ),
                            FlatButton(
                              child: Text('Add Transaction'),
                              textColor: Colors.purple,
                              onPressed: (){}
                            )
                          ]
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          tx.title,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold
                          )
                        ),
                        Text(
                          DateFormat.yMMMd().format(tx.date),
                          style: TextStyle(
                            color: Colors.grey
                          )
                        )
                      ]
                    )
                  ]
                )
              )
            }).toList(),
          )
        ]
      )
    )
  }
}