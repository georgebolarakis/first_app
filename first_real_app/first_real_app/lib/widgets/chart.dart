import "package:flutter/material.dart";
import 'package:flutter_complete_guide/widgets/chart_bar.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';
import './chart_bar.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  //constractor for receiving the recent transactions and store them in our List above
  Chart(this.recentTransactions);

//we are adding a new getter(method) that will add
  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );

      double totalSum = 0.0;

      for (var i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date.day == weekDay.day &&
            recentTransactions[i].date.month == weekDay.month &&
            recentTransactions[i].date.year == weekDay.year) {
          totalSum += recentTransactions[i].amount;
        }
        ;
      }

      // print(DateFormat.E().format(weekDay));

      //the .E gives us the sortcut for the day
      return {
        "day": DateFormat.E().format(weekDay).substring(0, 1),
        "amount": totalSum,
      };
    }).reversed.toList();
  }

  //we need to calculate the total spent for the week
  //we make a getter

  double get totalSpending {
    return groupedTransactionValues.fold(
        0.0, (sum, item) => sum + item["amount"]);
  }

  @override
  Widget build(BuildContext context) {
    print("build() Chart state");
    // print(groupedTransactionValues);
    return Card(
      elevation: 6,
      margin: const EdgeInsets.all(20),
      child: Container(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransactionValues.map((data) {
            //we need to wrap the chartbar in a different widget to keep each elemnt of the row the same
            //in our case is flexible
            //using flexible we make sure that each child only uses its space and doesn't expand on anothe child
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                  data["day"],
                  data["amount"],
                  //if we have no transactions  pass 0.0 value to the chatbar so it will not crass
                  totalSpending == 0.0
                      ? 0.0
                      : (data["amount"] as double) / totalSpending),
            );
          }).toList(),
        ),
      ),
    );
  }
}
