import "package:flutter/material.dart";

class EventScreen extends StatelessWidget {
  const EventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Event"),
      ),
      body: const SafeArea(
        child: Center(
          child: Text("Event Screen"),
        ),
      ),
    );
  }
}
