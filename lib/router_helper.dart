import 'package:flutter/material.dart';
import 'package:shopping_store/ui/screens/widgt/profile/person.dart';
import 'package:shopping_store/ui/screens/widgt/profile/profilescreen.dart';

class RouterHelper {
  RouterHelper._();
  static RouterHelper routerHelper = RouterHelper._();
  GlobalKey<NavigatorState> routerKey = GlobalKey<NavigatorState>();
  routingToSpecificWidget(Widget widget) {
    BuildContext context = routerKey.currentState.context;
    routerKey.currentState
        .push(MaterialPageRoute(builder: (context) {
      return widget;
    }));
  }
  pushToSpecificScreenByName(String screenName) {
    routerKey.currentState.pushNamed(screenName);
  }

  Map<String, Widget Function(BuildContext)> map = {
    'ProfileScreen': (context) => ProfileScreen(),
    'PersonalScreen': (context) => PersonalScreen(),
  };
  routingToSpecificWidgetWithoutPop(Widget widget) {
    BuildContext context = routerKey.currentState.context;
    routerKey.currentState.push(MaterialPageRoute(builder: (context) {
      return widget;
    }));
  }
}
