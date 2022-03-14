import 'package:flutter/material.dart';
import './transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  //we are adding a map for the transaction since it will hold diffrent data
  //in this case though we will create a class for defining the object
  //and we call it here by creating a list of transaction that will hold an empty list of transactions
  final List<Transaction> transactions = [
    Transaction(
      amount: 7.99,
      date: DateTime.now(),
      id: "t1",
      title: "New Shoes",
    ),
    Transaction(
      amount: 97.99,
      date: DateTime.now(),
      id: "t2",
      title: "New laptop",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
      ),
      //we add a column to add two items in there
      body: Column(
        //experiment with the different kinds of mainAxisAlignment
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          //we are adding two areas
          //the first
          Card(
            //we wrap the text in a container to be able to add more configuration to it
            child: Container(
              color: Colors.blue,
              //width: 100,
              //to take the full length of the screen
              width: double.infinity,
              child: Text("Chart"),
            ),
            //make the card look a bit better, a card is text inside a really small box
            //elevation brings it a bit forward with a bit more shadow
            elevation: 5,
          ),
          //The second area
          // Container(
          //   width: double.infinity,
          //   child: Card(
          //     color: Colors.red,
          //     child: Text("List of transaction"),
          //   ),
          // ),
          Column(
            //we will transform the list of transactions to a list of cards where each card puts the title of the transaction
            //map gets a variable and a function in the curly
            children: transactions.map((tx) {
              //we add the values of tx into the card
              return Card(
                child: Row(
                  children: <Widget>[
                    Container(
                      //adding space between the row inside the container
                      margin: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 15,
                      ),
                      //adding bold border with a width
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.purple,
                          width: 2,
                        ),
                      ),
                      padding: EdgeInsets.all(10),
                      child: Text(
                        ("£" + tx.amount.toString()),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.purple),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          tx.title,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          tx.date.toString(),
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}
