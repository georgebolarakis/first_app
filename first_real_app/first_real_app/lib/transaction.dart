//import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class Transaction {
  final String id;
  final String title;
  final double amount;
  final DateTime date;

  //adding the name arguments in curly, it maps the names to the value
  Transaction({
    required this.amount,
    required this.date,
    required this.id,
    required this.title,
  });
}
