import 'package:flutter/material.dart';
import 'package:flutterwaystatemanagement/classes/idea_type.dart';
import 'package:flutterwaystatemanagement/classes/ideas_inherited_model.dart';
import 'package:flutterwaystatemanagement/classes/log_provider.dart';
import 'log_history.dart';

class InheritedModelPage extends StatefulWidget {
  const InheritedModelPage({super.key});

  @override
  State<InheritedModelPage> createState() => _InheritedModelPageState();
}

class _InheritedModelPageState extends State<InheritedModelPage> {
  int _numberOfIdeas = 0;
  int _numberOfPossibilities = 0;
  late Log _log;

  @override
  void initState() {
    super.initState();
    _log = Log(logHistory: '');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inherited Model'),
        backgroundColor: Colors.deepPurple,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.history),
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (BuildContext context) {
                return LogProvider(
                  log: _log,
                  color: Colors.blueGrey,
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
            child: IdeasInheritedModel(
              numberOfIdeas: _numberOfIdeas,
              numberOfPossibilities: _numberOfPossibilities,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  InkWell(
                    child: Column(
                      children: <Widget>[
                        Stack(
                          alignment: Alignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.lightbulb_outline,
                              size: 184.0,
                              color: Colors.deepPurple.shade500,
                            ),
                            Positioned(
                              bottom: 84.0,
                              child: LogProvider(
                                log: _log,
                                child: const MyNumberOfIdeas(
                                  ideaType: IdeaType.ideas,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Text('Ideas'),
                      ],
                    ),
                    onTap: () {
                      setState(() {
                        _numberOfIdeas += 1;
                      });
                    },
                  ),
                  InkWell(
                    child: Column(
                      children: <Widget>[
                        Stack(
                          alignment: Alignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.notifications_none,
                              size: 184.0,
                              color: Colors.deepPurple.shade500,
                            ),
                            Positioned(
                              bottom: 62.0,
                              child: LogProvider(
                                log: _log,
                                child: const MyNumberOfPossibilities(
                                  ideaType: IdeaType.possibilities,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Text('Possibilities')
                      ],
                    ),
                    onTap: () {
                      setState(() {
                        _numberOfPossibilities += 1;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MyNumberOfIdeas extends StatelessWidget {
  final IdeaType ideaType;

  const MyNumberOfIdeas({Key? key, required this.ideaType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final IdeasInheritedModel? ideasTypeIdea =
        IdeasInheritedModel.of(context, aspect: ideaType);
    final Log? log = LogProvider.of(context)!.log;
    log!.logHistory += '\n$ideaType: ${ideasTypeIdea!.numberOfIdeas}';
    debugPrint('BUILD: $ideaType: ${ideasTypeIdea.numberOfIdeas}');

    return Text(
      '${ideasTypeIdea.numberOfIdeas}',
      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
          fontSize: 48.0,
          fontWeight: FontWeight.bold,
          color: Colors.deepPurple.shade800),
    );
  }
}

class MyNumberOfPossibilities extends StatelessWidget {
  final IdeaType ideaType;

  const MyNumberOfPossibilities({Key? key, required this.ideaType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final IdeasInheritedModel? ideasTypeIdea =
        IdeasInheritedModel.of(context, aspect: ideaType);
    final Log? log = LogProvider.of(context)!.log;
    log?.logHistory += '\n$ideaType: ${ideasTypeIdea!.numberOfPossibilities}';
    debugPrint('BUILD: $ideaType: ${ideasTypeIdea!.numberOfPossibilities}');

    return Text(
      '${ideasTypeIdea.numberOfPossibilities}',
      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
          fontSize: 48.0,
          fontWeight: FontWeight.bold,
          color: Colors.deepPurple.shade800),
    );
  }
}
