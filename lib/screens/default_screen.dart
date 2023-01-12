import "dart:io";

import "package:flutter/material.dart";

class DefaultScreen extends StatelessWidget {
  const DefaultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Default"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              children: <Widget>[
                const Text(
                  "This demo application allows you to manage and interact with the application's home screen with quick actions.",
                ),
                const SizedBox(height: 10),
                const Text(
                  "Go back to the home screen (for iOS) or app launcher (for Android) & hold down this app's icon to see the available quick actions.",
                ),
                const SizedBox(height: 10),
                const SizedBox(height: 10),
                Text(
                  Platform.isIOS ? "iOS Preview:" : "Android Preview:",
                ),
                Image.asset(
                  Platform.isIOS ? "assets/ios.png" : "assets/android.png",
                ),
                const SizedBox(height: 10),
                Text(
                  Platform.isAndroid ? "iOS Preview:" : "Android Preview:",
                ),
                Image.asset(
                  Platform.isAndroid ? "assets/ios.png" : "assets/android.png",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
