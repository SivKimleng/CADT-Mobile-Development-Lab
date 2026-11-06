  import 'package:flutter/material.dart';

  void main() {
    runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Container(
          color: Colors.blue[300],
          margin: const EdgeInsets.all(50),
          padding: const EdgeInsets.all(40),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.blue[600],
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Center(
              child: Text(
                'CADT STUDENTS',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
