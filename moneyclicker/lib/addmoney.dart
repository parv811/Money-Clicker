import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Addmoney extends StatelessWidget {
  String name;
  Color color;
  void Function() func;
  Addmoney({
    super.key,
    required this.func,
    required this.name,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          minimumSize: Size(double.infinity, 0),
        ),
        onPressed: func,
        child: Text('$name', style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
