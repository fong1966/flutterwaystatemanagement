import 'package:flutter/material.dart';

class InheritedWidgetPageProvider extends InheritedWidget {
  final int numberOfIdeas;
  final VoidCallback increaseNumberOfIdeas;

  const InheritedWidgetPageProvider({
    Key? key,
    required this.numberOfIdeas,
    required this.increaseNumberOfIdeas,
    required Widget child,
  }) : super(key: key, child: child);

  static InheritedWidgetPageProvider? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<InheritedWidgetPageProvider>();
  }

  @override
  bool updateShouldNotify(InheritedWidgetPageProvider oldWidget) {
    return numberOfIdeas != oldWidget.numberOfIdeas;
  }
}
