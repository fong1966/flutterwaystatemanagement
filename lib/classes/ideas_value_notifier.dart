import 'package:flutter/material.dart';

class IdeaPossibilitiesCount {
  ValueNotifier<int>? numberOfIdeasValueNotifier = ValueNotifier<int>(0);
  ValueNotifier<int>? numberOfPossibilitiesValueNotifier =
      ValueNotifier<int>(0);

  IdeaPossibilitiesCount(
      {this.numberOfIdeasValueNotifier,
      this.numberOfPossibilitiesValueNotifier});
}

class IdeasPossibilitiesValueNotifier
    extends ValueNotifier<IdeaPossibilitiesCount> {
  IdeaPossibilitiesCount? ideaPossibilitiesCount;

  IdeasPossibilitiesValueNotifier({this.ideaPossibilitiesCount})
      : super(ideaPossibilitiesCount!);

  void addNumberOfIdeas(int numberOfIdeas) {
    ideaPossibilitiesCount!.numberOfIdeasValueNotifier!.value += numberOfIdeas;
    debugPrint('${value.numberOfIdeasValueNotifier!.value} !!!');
    // notifyListeners();
  }

  void addNumberOfPossibilities(int numberOfPossibilities) {
    ideaPossibilitiesCount!.numberOfPossibilitiesValueNotifier!.value +=
        numberOfPossibilities;
    debugPrint('${value.numberOfPossibilitiesValueNotifier!.value} !!!!!');
    // notifyListeners();
  }
}
