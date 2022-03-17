import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  //we need to add the delete function
  //now deleteTx is a pointer to the _deleteTransaction method on our main.dart
  final Function deleteTx;

  TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return
        //we need to calculate the size of the screen dynamicaly
        //to do that we implement the MediaQuery method
        //where we define how much of the height of the screen we want for the widget to fill
        //values btw 0-1 where 0.6 means 60% of the screen
        //we sort this out on the main appBar
        //height: MediaQuery.of(context).size.height * 0.57,
        transactions.isEmpty
            ? LayoutBuilder(
                builder: ((ctx, constraints) {
                  return Column(
                    children: <Widget>[
                      Text(
                        'No transactions added yet!',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      //we are adding a box with a size of 20 between our image and our header in our column
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                          height: constraints.maxHeight * 0.6,
                          child: Image.asset(
                            'assets/images/waiting.png',
                            fit: BoxFit.cover,
                          )),
                    ],
                  );
                }),
              )
            : ListView.builder(
                itemBuilder: (ctx, index) {
                  //repalced the Card with the listTile
                  return Card(
                    elevation: 5,
                    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                    child: ListTile(
                      leading: CircleAvatar(
                        //maxRadius: 30.0,
                        radius: 30,
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: FittedBox(
                            child: Text("\£${transactions[index].amount}"),
                          ),
                        ),
                      ),
                      title: Text(
                        transactions[index].title,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      subtitle: Text(
                        DateFormat.yMMMd().format(transactions[index].date),
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        color: Theme.of(context).errorColor,
                        onPressed: () => deleteTx(transactions[index].id),
                      ),
                    ),
                  );
                },
                itemCount: transactions.length,
              );
  }
}


//our initial setup on how the userInputs will look
// Card(
//                   child: Row(
//                     children: <Widget>[
//                       Container(
//                         margin: EdgeInsets.symmetric(
//                           vertical: 10,
//                           horizontal: 15,
//                         ),
//                         decoration: BoxDecoration(
//                           border: Border.all(
//                             color: Theme.of(context).primaryColor,
//                             width: 2,
//                           ),
//                         ),
//                         padding: EdgeInsets.all(10),
//                         child: Text(
//                           '\$${transactions[index].amount.toStringAsFixed(2)}',
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 20,
//                             color: Theme.of(context).primaryColor,
//                           ),
//                         ),
//                       ),
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: <Widget>[
//                           Text(
//                             transactions[index].title,
//                             style: Theme.of(context).textTheme.headline6,
//                           ),
//                           Text(
//                             DateFormat.yMMMd().format(transactions[index].date),
//                             style: TextStyle(
//                               color: Colors.grey,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 );

// to make a container into cicle
// Container(
  // height: 60,
  // width: 60,
//   decoration: BoxDecoration(
//     color: Theme.of(context).primaryColor,
//     shape: BoxShape.circle,
//   )
// )
