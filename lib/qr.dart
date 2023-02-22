import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:qr_flutter/qr_flutter.dart';

class Qr extends StatefulWidget {
  const Qr({super.key});

  @override
  State<Qr> createState() => _QrState();
}

class _QrState extends State<Qr> {
  String data = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.yellow, Colors.orange],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            QrImage(
              data: data,
              size: 300,
              version: QrVersions.auto,
              gapless: true,

              errorStateBuilder: (cxt, err) {
                return Container(
                  child: Center(
                    child: Text(
                      "Uh oh! Something went wrong...",
                      textAlign: TextAlign.center,
                    ),
                  ),
                );
              },
              // backgroundColor: Colors.w,
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                onChanged: (value) {
                  setState(() {
                    data = value;
                  });
                },
                decoration: InputDecoration(
                  hintText: "Enter the data ",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            OutlinedButton(
                onPressed: () {
                  setState(() {});
                },
                child: Text("Generate"))
          ],
        ),
      ),
    );
  }
}
