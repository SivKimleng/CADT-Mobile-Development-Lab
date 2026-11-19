import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Custom buttons"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [          
              SelectableButton(),
              SizedBox(height: 10),
              SelectableButton(),
              SizedBox(height: 10),
              SelectableButton(),
              SizedBox(height: 10),
              SelectableButton(),
],
          ),
        ),
      ),
    ),
  );
}

class SelectableButton extends StatefulWidget {
  const SelectableButton({super.key});

  @override
  State<SelectableButton> createState() {
    return _SelectableButtonState();
  }
}
class _SelectableButtonState extends State<SelectableButton> {
  bool isSelected = false;
  String get buttonText {
    if (isSelected) {
      return "Selected";
    } else {
      return "Not selected";
    }
  }
  Color get textColor {
    if (isSelected) {
      return Colors.white;
    } else {
      return Colors.black;
    }
  }
  Color get backgroundColor {
    if (isSelected) {
      return Colors.blue;
    } else {
      return const Color.fromARGB(255, 157, 205, 240);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      height: 100,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: textColor,
        ),
        onPressed: () {
          setState(() {
            isSelected = !isSelected;
          });
        },
        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}
