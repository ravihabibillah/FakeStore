
import 'package:flutter/widgets.dart';

import '../data/models/product.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class Navigation {
  static intentWithData (String routeName, Object arguments) {
    navigatorKey.currentState?.pushNamed(routeName, arguments: arguments);
  }
  static intentWithProduct (String routeName, Product arguments) {
    navigatorKey.currentState?.pushNamed(routeName, arguments: arguments);
  }

  static intentWithoutData (String routeName) {
    navigatorKey.currentState?.pushNamed(routeName);
  }
  static back() => navigatorKey.currentState?.pop();
}