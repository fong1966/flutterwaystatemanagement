import 'package:flutter/material.dart';

class Log {
  String logHistory;

  Log({required this.logHistory});
}

class LogProvider extends InheritedWidget {
  final Log? log;
  final Color? color;

  const LogProvider({
    Key? key,
    this.log,
    this.color,
    required Widget child,
  }) : super(key: key, child: child);

  static LogProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<LogProvider>();
  }

  @override
  bool updateShouldNotify(LogProvider oldWidget) {
    return log != oldWidget.log;
  }
}
