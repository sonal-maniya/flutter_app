import 'package:flutter/material.dart';

class TableWidget extends StatelessWidget {
  const TableWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Table(
          columnWidths: {1: FractionColumnWidth(0.5)},
          border: TableBorder.all(),
          children: [
            TableRow(children: [
              Container(
                height: 30,
                color: Colors.amber,
              ),
              Container(
                color: Colors.cyan,
                child: const Text("First Row Data"),
              ),
              Container(
                height: 30,
                color: Colors.pinkAccent,
              )
            ]),
            TableRow(children: [
              Container(
                height: 100,
                color: Colors.blueGrey,
              ),
              Container(
                color: Colors.cyan,
                child: const Text(
                    "First Row Data dfkljg ljkfhlkj lkjdflkj lkjfkjdfglkjsd ;lkdf;lk ;dflkgl;dfgk"),
              ),
              Container(
                height: 30,
                color: Colors.pinkAccent,
              )
            ]),
          ],
        ),
      ),
    );
  }
}
