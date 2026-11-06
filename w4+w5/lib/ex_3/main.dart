
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Container(
        color: Colors.grey[300],
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              height: 55,
              margin: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: Colors.blue[100],
                borderRadius: BorderRadius.circular(30),
              ),
              child: const Center(
                child: Text(
                  'OOP',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
            ),

            Container(
              width: double.infinity,
              height: 55,
              margin: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: Colors.blue[300],
                borderRadius: BorderRadius.circular(30),
              ),
              child: const Center(
                child: Text(
                  'DART',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
            ),

            Container(
              width: double.infinity,
              height: 55,
              margin: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.blue[300]!,
                    Colors.blue[600]!,
                  ],
                ),
                borderRadius: BorderRadius.circular(30),
              ),
              child: const Center(
                child: Text(
                  'FLUTTER',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
