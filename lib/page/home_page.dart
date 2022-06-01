import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // nen dung material

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Padding(padding: EdgeInsets.only(top: 80)),
            const Text("Blutooth mouse"),
            const Padding(padding: EdgeInsets.only(top: 80)),
            SizedBox(
              width: 200,
              child: TextField(
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly // chi nhap so
                ],
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 80)),
            ElevatedButton(
              onPressed: () {},
              child: const Text("Check"),
            )
          ],
        ),
      ),
    );
  }
}
