import 'package:flutter/material.dart';

class BasicWidget extends StatefulWidget {
  const BasicWidget({super.key});

  @override
  State<BasicWidget> createState() => _BasicWidgetState();
}

class _BasicWidgetState extends State<BasicWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [],
        title: const Text("Basic Layouts"),
      ),
      body: SafeArea(
        child: Column(children: [
          Expanded(
              flex: 1,
              child: Column(
                children: [
                  _buildContainer(Colors.purple),
                  const Spacer(),
                  _buildContainer(Colors.amberAccent),
                  const Spacer(),
                  _buildContainer(Colors.redAccent),
                  const Spacer(),
                  _buildContainer(Colors.cyanAccent),
                ],
              )),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.blue,
              child: Wrap(
                runSpacing: 20,
                spacing: 10,
                alignment: WrapAlignment.start,
                children: [
                  _buildText('Text 1'),
                  _buildText('Text 2'),
                  _buildText('Text 3'),
                  _buildText('Text 4'),
                  _buildText('Text 5'),
                  _buildText('Text 6'),
                  _buildText('Text 7'),
                  _buildText('Text 8'),
                  _buildText('Text 9'),
                  _buildText('Text 10'),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.max,
              children: [
                _buildText('Row Text 1'),
                _buildText('Row Text 2'),
                _buildText('Row Text 3'),
              ],
            ),
          )
        ]),
      ),
    );
  }

  Widget _buildText(String text) {
    return Text(
      text,
      style: const TextStyle(color: Colors.black, fontSize: 20),
    );
  }

  Widget _buildContainer(Color boxColor) {
    return Container(
      height: 50,
      color: boxColor,
    );
  }
}
