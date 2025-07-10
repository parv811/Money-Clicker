import 'package:flutter/material.dart';
import 'package:moneyclicker/addmoney.dart';
import 'package:moneyclicker/bankbalance.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double bankBalance = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadBalance();
  }

  void addMoney() async {
    setState(() {
      bankBalance += 500;
    });

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('bankBalance', bankBalance);
  }

  void loadBalance() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      bankBalance = prefs.getDouble('bankBalance') ?? 0;
    });
  }

  void resetBalance() async {
    setState(() {
      bankBalance = 0;
    });

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('bankBalance', bankBalance);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(useMaterial3: true),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Money Clicker'),
          backgroundColor: Colors.grey[700],
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          padding: EdgeInsets.all(20),
          color: Colors.blueGrey[700],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Bankbalance(bankBalance: bankBalance),
              Addmoney(func: addMoney, name: 'Add Money', color: Colors.green),
              SizedBox(height: 20),
              Addmoney(
                func: resetBalance,
                name: 'Reset Balance',
                color: Colors.red,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
