import 'package:flutter/material.dart';

class Location extends StatefulWidget {
  const Location({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text("Location Activity"),
    );
  }
}