import 'package:flutter/cupertino.dart';

class NavigationService {
  static NavigationService? _instance;

  static NavigationService get instance => _instance ??= NavigationService._();

  NavigationService._();

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<Object?>? navigateTo(String route, {arg}) {
    if (navigatorKey.currentState != null) {
      return navigatorKey.currentState!.pushNamed(route, arguments: arg);
    }
    return null;
  }

  Future<Object?>? navigateToReplacement(String route, {arg}) {
    if (navigatorKey.currentState != null) {
      return navigatorKey.currentState!.pushReplacementNamed(
          route, arguments: arg);
    }
    return null;
  }

  Future<Object?>? navigateBack({arg}) {
    if (navigatorKey.currentState != null) {
      navigatorKey.currentState!.pop(arg);
    }
    return null;
  }

  Future<Object?>? navigateToDestination(String route, {arg}) {
    if (navigatorKey.currentState != null) {
      navigatorKey.currentState!.popUntil((f) => f.settings.name == route);
    }
    return null;
  }

  Future<Object?>? navigateToRemoveUntil(String route, {arg}) {
    if (navigatorKey.currentState != null) {
      navigatorKey.currentState!.pushNamedAndRemoveUntil(
          route, (f) => f.settings.name == route);
    }
    return null;
  }
}