import 'package:flutter/material.dart';

Widget errorDialog({required double size}) {
  return SizedBox(
    height: 180,
    width: 200,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'An error occurred when fetching the posts.',
          style: TextStyle(
              fontSize: size, fontWeight: FontWeight.w500, color: Colors.black),
        ),
        const SizedBox(
          height: 10,
        ),
        ElevatedButton(
            onPressed: () {
              // setState(() {
              //   _loading = true;
              //   _error = false;
              //   fetchData();
              //});
            },
            child: const Text(
              "Retry",
              style: TextStyle(fontSize: 20, color: Colors.purpleAccent),
            )),
      ],
    ),
  );
}
