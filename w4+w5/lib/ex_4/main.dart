import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          children: [
            const SizedBox(height: 50),

            // the top blue container
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 300,
                    color: Colors.blue,
                  ),
                ),
                const SizedBox(width: 100),
              ],
            ),

            // the green and a little pink containers
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 80,
                    color: Colors.green,
                  ),
                ),
                Container(
                  width: 100,
                  height: 80,
                  color: Colors.pinkAccent,
                ),
              ],
            ),

            // the three yellow containers
            SizedBox(
              height: 80,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      color: Colors.amber,
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Container(
                      color: Colors.amber,
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Container(
                      color: Colors.amber,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // the last one pink container
            Expanded(
              child: Container(
                width: double.infinity,
                color: Colors.pinkAccent,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}