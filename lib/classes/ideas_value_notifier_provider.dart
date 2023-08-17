import 'package:flutter/material.dart';
import 'ideas_value_notifier.dart';

class IdeasValueNotifierProvider extends InheritedWidget {
  final IdeasPossibilitiesValueNotifier? ideasPossibilitiesValueNotifier;

  const IdeasValueNotifierProvider({
    super.key,
    this.ideasPossibilitiesValueNotifier,
    required Widget child,
  }) : super(child: child);

  static IdeasValueNotifierProvider? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<IdeasValueNotifierProvider>();
  }

  @override
  bool updateShouldNotify(IdeasValueNotifierProvider oldWidget) {
    return ideasPossibilitiesValueNotifier!
                .ideaPossibilitiesCount!.numberOfIdeasValueNotifier !=
            oldWidget.ideasPossibilitiesValueNotifier!.ideaPossibilitiesCount!
                .numberOfIdeasValueNotifier ||
        ideasPossibilitiesValueNotifier!
                .ideaPossibilitiesCount!.numberOfPossibilitiesValueNotifier !=
            oldWidget.ideasPossibilitiesValueNotifier!.ideaPossibilitiesCount!
                .numberOfPossibilitiesValueNotifier;
  }
}
