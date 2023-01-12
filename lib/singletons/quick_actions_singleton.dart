import "dart:developer";

import "package:flutter/material.dart";
import "package:quick_actions/quick_actions.dart";
import "package:quick_actions_demo/extension/string_extension.dart";
import "package:quick_actions_demo/screens/event_screen.dart";
import "package:quick_actions_demo/screens/explore_screen.dart";
import "package:quick_actions_demo/screens/profile_screen.dart";
import "package:quick_actions_demo/screens/shop_screen.dart";
import "package:quick_actions_demo/singletons/navigation_singleton.dart";

enum QuickActionsType { profile, event, shop, explore }

class QuickActionsSingleton {
  factory QuickActionsSingleton() {
    return _singleton;
  }

  QuickActionsSingleton._internal();

  static final QuickActionsSingleton _singleton =
      QuickActionsSingleton._internal();

  final QuickActions quickActions = const QuickActions();

  final List<ShortcutItem> shortcutItemList = <ShortcutItem>[];

  void assignShortcutItemToListFunction() {
    for (int i = 0; i <= 3; i++) {
      final ShortcutItem shortcutItem = ShortcutItem(
        type: QuickActionsType.values[i].name,
        localizedTitle: QuickActionsType.values[i].name.capitalize(),
        icon: QuickActionsType.values[i].name,
      );
      shortcutItemList.add(shortcutItem);
    }
    return;
  }

  Future<void> initializeFunction() async {
    await quickActions.initialize(
      (String type) async {
        final CustomClass object = decisionFunction(type);
        await navigationFunction(object);
      },
    );
    return Future<void>.value();
  }

  Future<void> setShortcutItemsFunction() async {
    await quickActions.setShortcutItems(shortcutItemList);
    return Future<void>.value();
  }

  CustomClass decisionFunction(String type) {
    CustomClass object = CustomClass(navigate: false, screen: const SizedBox());
    if (type == shortcutItemList[0].type) {
      object = CustomClass(navigate: true, screen: const ProfileScreen());
    } else if (type == shortcutItemList[1].type) {
      object = CustomClass(navigate: true, screen: const EventScreen());
    } else if (type == shortcutItemList[2].type) {
      object = CustomClass(navigate: true, screen: const ShopScreen());
    } else if (type == shortcutItemList[3].type) {
      object = CustomClass(navigate: true, screen: const ExploreScreen());
    } else {
      log("Error occurred on decisionFunction()");
    }
    return object;
  }

  Future<void> navigationFunction(CustomClass object) async {
    final GlobalKey<NavigatorState> state = NavigationSingleton().navigatorKey;
    final BuildContext context = state.currentContext!;
    final MaterialPageRoute<void> route = MaterialPageRoute<void>(
      builder: (BuildContext context) => object.screen,
    );
    object.navigate
        ? await Navigator.of(context).push(route)
        : log("navigationFunction() - Should Navigate: ${object.navigate}");
    return;
  }
}

class CustomClass {
  CustomClass({required this.navigate, required this.screen});

  final bool navigate;
  final Widget screen;
}
