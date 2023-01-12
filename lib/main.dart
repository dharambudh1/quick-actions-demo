import "dart:async";

import "package:after_layout/after_layout.dart";
import "package:flutter/material.dart";
import "package:quick_actions_demo/screens/default_screen.dart";
import "package:quick_actions_demo/singletons/navigation_singleton.dart";
import "package:quick_actions_demo/singletons/quick_actions_singleton.dart";

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with AfterLayoutMixin<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Quick Actions Demo",
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        colorSchemeSeed: Colors.blue,
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorSchemeSeed: Colors.blue,
      ),
      home: const DefaultScreen(),
      debugShowCheckedModeBanner: false,
      navigatorKey: NavigationSingleton().navigatorKey,
    );
  }

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) async {
    QuickActionsSingleton().assignShortcutItemToListFunction();
    await QuickActionsSingleton().initializeFunction();
    await QuickActionsSingleton().setShortcutItemsFunction();
    return Future<void>.value();
  }
}
