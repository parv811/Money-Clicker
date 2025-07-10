import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class Bankbalance extends StatelessWidget {
  double bankBalance;
  Bankbalance({super.key, required this.bankBalance});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 8,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Bank Balance:'),
          SizedBox(height: 20),
          Text(
            '\$ ${NumberFormat.simpleCurrency(name: '').format(bankBalance)}',
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
