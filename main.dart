import 'package:flutter/material.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        brightness: Brightness.dark,
      ),
      home: CalculatorHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class CalculatorHomePage extends StatefulWidget {
  @override
  _CalculatorHomePageState createState() => _CalculatorHomePageState();
}

class _CalculatorHomePageState extends State<CalculatorHomePage> {
  String displayText = '0';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1E1E1E),
      appBar: AppBar(
        title: Text('Calculator'),
        backgroundColor: Color(0xFF1E1E1E),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.symmetric(vertical: 24, horizontal: 12),
            child: Text(
              displayText,
              style: TextStyle(fontSize: 48, color: Colors.white),
            ),
          ),
          Expanded(
            child: Divider(color: Colors.grey),
          ),
          Column(
            children: [
              _buildButtonRow('7', '8', '9', '/'),
              _buildButtonRow('4', '5', '6', '*'),
              _buildButtonRow('1', '2', '3', '-'),
              _buildButtonRow('.', '0', '=', '+'),
              _buildButtonRow('C'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildButtonRow(String first, [String second = '', String third = '', String fourth = '']) {
    List<String> buttons = [first];
    if (second.isNotEmpty) buttons.add(second);
    if (third.isNotEmpty) buttons.add(third);
    if (fourth.isNotEmpty) buttons.add(fourth);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: buttons.map((buttonText) {
        return Expanded(
          child: Padding(
            padding: EdgeInsets.all(8),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: _getButtonColor(buttonText),
                padding: EdgeInsets.all(24),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {},
              child: Text(
                buttonText,
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Color _getButtonColor(String buttonText) {
    switch (buttonText) {
      case 'C':
        return Colors.yellowAccent;
      case '=':
      case '/':
      case '*':
      case '-':
      case '+':
        return Colors.greenAccent;
      default:
        return Color(0xFF2E2E2E);
    }
  }
}
