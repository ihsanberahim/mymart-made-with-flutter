import 'package:flutter/material.dart';


class BaseSlidingRoute<T> extends MaterialPageRoute<T> {
  BaseSlidingRoute({WidgetBuilder builder, RouteSettings settings})
      : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    if (settings.isInitialRoute) return child;

    return new SlideTransition(
      position: new Tween<Offset>(
        begin: const Offset(0.0, 0.1),
        end: const Offset(0.0, 0.0),
      )
      .animate(
        new CurvedAnimation(
          parent: animation,
          curve: Curves.fastOutSlowIn,
        )
      ),
      child: child,
    );
  }
}
