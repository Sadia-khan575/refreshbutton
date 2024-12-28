import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});  // Correct constructor with 'key'

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ButtonClass1(),
      debugShowCheckedModeBanner: false,// This will navigate to the ButtonClass1 screen
    );
  }
}

class ButtonClass1 extends StatefulWidget {
  const ButtonClass1({super.key});  // Correct constructor with 'key'

  @override
  _ButtonClass1State createState() => _ButtonClass1State();  // State class for this widget
}

class _ButtonClass1State extends State<ButtonClass1> {
  String addResult = ''; // Result for addition
  String subResult = ''; // Result for subtraction
  String mulResult = ''; // Result for multiplication
  String divResult = ''; // Result for division
  String modResult = ''; // Result for modulo

  // Helper Method to Build Buttons
  Widget _buildButton({
    required String label,
    required Color color,
    required VoidCallback onPressed,
  }) {
    return Container(
      width: 150,
      height: 60,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          label,
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }

  // Method to clear all results
  void _clearResults() {
    setState(() {
      addResult = '';
      subResult = '';
      mulResult = '';
      divResult = '';
      modResult = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: const Text(
          'Arithmetic Operators',
        ),
      ),
      body: SingleChildScrollView(  // Make the entire body scrollable
        child: Padding(
          padding: const EdgeInsets.all(16.0), // Add padding for better spacing
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Center Container with Name and Roll No
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.lightBlue,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: const [
                    Text(
                      'Name: SADIA KHAN',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 10), // Spacing between name and roll no
                    Text(
                      'Roll No: 4',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30), // Spacing between the text and buttons

              // Row 1 with Add and Subtract Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildButton(
                    label: "Add",
                    color: Colors.pink,
                    onPressed: () {
                      setState(() {
                        int n1 = 5, n2 = 4;
                        addResult = 'Addition: ${n1 + n2}';
                      });
                    },
                  ),
                  _buildButton(
                    label: "Subtract",
                    color: Colors.green,
                    onPressed: () {
                      setState(() {
                        int n1 = 5, n2 = 4;
                        subResult = 'Subtraction: ${n1 - n2}';
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20), // Spacing between rows

              // Row 2 with Multiply and Divide Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildButton(
                    label: "Multiply",
                    color: Colors.orange,
                    onPressed: () {
                      setState(() {
                        int n1 = 5, n2 = 4;
                        mulResult = 'Multiplication: ${n1 * n2}';
                      });
                    },
                  ),
                  _buildButton(
                    label: "Divide",
                    color: Colors.blue,
                    onPressed: () {
                      setState(() {
                        int n1 = 5, n2 = 4;
                        divResult = 'Division: ${n1 / n2}';
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20), // Spacing between rows

              // Row 3 with Modulo Button
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildButton(
                    label: "Modulo",
                    color: Colors.purple,
                    onPressed: () {
                      setState(() {
                        int n1 = 5, n2 = 4;
                        modResult = 'Modulo: ${n1 % n2}';
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20), // Spacing between rows

              // Refresh Button in the middle of the screen
              TextButton(
                onPressed: _clearResults,
                style: TextButton.styleFrom(
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(20),
                  backgroundColor: Colors.red, // Correct property for button color
                ),
                child: const Icon(
                  Icons.refresh,
                  color: Colors.white,
                  size: 30,
                ),
              ),

              const SizedBox(height: 20), // Spacing between rows

              // Display Result Containers for Each Operation
              _buildResultContainer(label: addResult, color: Colors.pink),
              const SizedBox(height: 10),
              _buildResultContainer(label: subResult, color: Colors.green),
              const SizedBox(height: 10),
              _buildResultContainer(label: mulResult, color: Colors.orange),
              const SizedBox(height: 10),
              _buildResultContainer(label: divResult, color: Colors.blue),
              const SizedBox(height: 10),
              _buildResultContainer(label: modResult, color: Colors.purple),
            ],
          ),
        ),
      ),
    );
  }

  // Widget to Display Result Containers
  Widget _buildResultContainer({required String label, required Color color}) {
    return Container(
      width: 150,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        label.isEmpty ? '' : label,  // Default message if empty
        style: const TextStyle(color: Colors.white, fontSize: 18),
        textAlign: TextAlign.center,
      ),
    );
  }
}
