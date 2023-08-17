import 'package:flutter/material.dart';
import 'package:flutterwaystatemanagement/classes/idea_type.dart';
import 'package:flutterwaystatemanagement/classes/ideas_value_notifier.dart';
import 'package:flutterwaystatemanagement/classes/ideas_value_notifier_provider.dart';
import 'package:flutterwaystatemanagement/classes/log_provider.dart';
import 'log_history.dart';

class ValueNotifierPage extends StatefulWidget {
  const ValueNotifierPage({super.key});

  @override
  State<ValueNotifierPage> createState() => ValueNotifierPageState();
}

class ValueNotifierPageState extends State<ValueNotifierPage> {
  IdeasPossibilitiesValueNotifier? ideasPossibilitiesValueNotifier;
  Log? log;

  @override
  void initState() {
    super.initState();
    ideasPossibilitiesValueNotifier = IdeasPossibilitiesValueNotifier(
      ideaPossibilitiesCount: IdeaPossibilitiesCount(
        numberOfIdeasValueNotifier: ValueNotifier<int>(0),
        numberOfPossibilitiesValueNotifier: ValueNotifier<int>(0),
      ),
    );
    log = Log(logHistory: '');
  }

  @override
  void dispose() {
    ideasPossibilitiesValueNotifier!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ValueNotifier'),
        backgroundColor: Colors.orange,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.history),
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (BuildContext context) {
                return LogProvider(
                  log: log,
                  color: Colors.orange,
                  child: const LogHistory(),
                );
              }));
            },
          )
        ],
      ),
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: 100.0,
            child: Row(
              children: <Widget>[
                ValueListenableBuilder(
                  valueListenable: ideasPossibilitiesValueNotifier!
                      .value.numberOfIdeasValueNotifier!,
                  builder: (BuildContext context, int value, Widget? child) {
                    return InkWell(
                      child: Column(
                        children: <Widget>[
                          Stack(
                            alignment: Alignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.lightbulb_outline,
                                size: 184.0,
                                color: Colors.orange.shade500,
                              ),
                              Positioned(
                                bottom: 84.0,
                                child: LogProvider(
                                  log: log,
                                  child: IdeasValueNotifierProvider(
                                    ideasPossibilitiesValueNotifier:
                                        ideasPossibilitiesValueNotifier,
                                    child: const NumberOfIdeas(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const Text('Ideas'),
                        ],
                      ),
                      onTap: () {
                        ideasPossibilitiesValueNotifier!.addNumberOfIdeas(1);
                      },
                    );
                  },
                ),
                ValueListenableBuilder(
                  valueListenable: ideasPossibilitiesValueNotifier!
                      .value.numberOfPossibilitiesValueNotifier!,
                  builder: (BuildContext context, int value, Widget? child) {
                    return InkWell(
                      child: Column(
                        children: <Widget>[
                          Stack(
                            alignment: Alignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.notifications_none,
                                size: 184.0,
                                color: Colors.orange.shade500,
                              ),
                              // Text('$value'),
                              Positioned(
                                bottom: 62.0,
                                child: LogProvider(
                                  log: log,
                                  child: IdeasValueNotifierProvider(
                                    ideasPossibilitiesValueNotifier:
                                        ideasPossibilitiesValueNotifier,
                                    child: const NumberOfPossibilities(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const Text('Possibilities'),
                        ],
                      ),
                      onTap: () {
                        ideasPossibilitiesValueNotifier!
                            .addNumberOfPossibilities(1);
                      },
                    );
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class NumberOfIdeas extends StatelessWidget {
  final IdeaType? ideaType;

  const NumberOfIdeas({Key? key, this.ideaType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Log? log = LogProvider.of(context)!.log;
    final IdeasPossibilitiesValueNotifier?
        ideasPossibilitiesValueNotifierInstance =
        IdeasValueNotifierProvider.of(context)!.ideasPossibilitiesValueNotifier;
    log!.logHistory +=
        '\n${IdeaType.ideas}: ${ideasPossibilitiesValueNotifierInstance!.value.numberOfIdeasValueNotifier!.value}';
    debugPrint(
        'BUILD: ${IdeaType.ideas}: ${ideasPossibilitiesValueNotifierInstance.value.numberOfIdeasValueNotifier!.value}');

    return Text(
      '${ideasPossibilitiesValueNotifierInstance.value.numberOfIdeasValueNotifier!.value}',
      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
          fontSize: 48.0,
          fontWeight: FontWeight.bold,
          color: Colors.blueGrey.shade800),
    );
  }
}

class NumberOfPossibilities extends StatelessWidget {
  final IdeaType? ideaType;

  const NumberOfPossibilities({Key? key, this.ideaType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Log? log = LogProvider.of(context)!.log;
    final IdeasPossibilitiesValueNotifier? ideasPossibilitiesValueNotifier =
        IdeasValueNotifierProvider.of(context)!.ideasPossibilitiesValueNotifier;
    log!.logHistory +=
        '\n${IdeaType.possibilities}: ${ideasPossibilitiesValueNotifier!.value.numberOfPossibilitiesValueNotifier!.value}';
    debugPrint(
        'BUILD: ${IdeaType.possibilities}: ${ideasPossibilitiesValueNotifier.value.numberOfPossibilitiesValueNotifier!.value}');

    return Text(
      '${ideasPossibilitiesValueNotifier.value.numberOfPossibilitiesValueNotifier!.value}',
      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
          fontSize: 48.0,
          fontWeight: FontWeight.bold,
          color: Colors.blueGrey.shade800),
    );
  }
}
