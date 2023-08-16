import 'package:flutter/material.dart';
import 'package:flutterwaystatemanagement/classes/inherited_widget_page_provider.dart';
import 'package:flutterwaystatemanagement/pages/inherited_widget_bottom_page.dart';
import 'package:flutterwaystatemanagement/pages/inherited_widget_top_page.dart';

class InheritedWidgetPage extends StatefulWidget {
  const InheritedWidgetPage({super.key});

  @override
  State<InheritedWidgetPage> createState() => _InheritedWidgetPageState();
}

class _InheritedWidgetPageState extends State<InheritedWidgetPage> {
  int _numberOfIdeas = 0;

  void _increaseNumberOfIdeas() {
    setState(() {
      _numberOfIdeas += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('InheritedWidget'),
        backgroundColor: Colors.lightGreen,
        actions: <Widget>[
          TextButton.icon(
            icon: const Icon(Icons.add),
            label: const Text('Add Ideas'),
            style: ButtonStyle(
                textStyle: MaterialStateProperty.resolveWith((states) => null)),
            onPressed: _increaseNumberOfIdeas,
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            ParentWidget(numberOfIdeas: _numberOfIdeas),
            Expanded(
              child: InheritedWidgetPageProvider(
                numberOfIdeas: _numberOfIdeas,
                increaseNumberOfIdeas: _increaseNumberOfIdeas,
                child: const Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: InheritedWidgetTopPage(),
                      ),
                      Expanded(
                        child: InheritedWidgetBottomPage(),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ParentWidget extends StatelessWidget {
  final int _numberOfIdeas;

  const ParentWidget({
    Key? key,
    required int numberOfIdeas,
  })  : _numberOfIdeas = numberOfIdeas,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint('PARENT WIDGET');
    return Container(
      color: Colors.lightGreen.shade400,
      width: double.infinity,
      child: Column(
        children: <Widget>[
          const SizedBox(height: 16.0),
          const Text('PARENT WIDGET'),
          Text(
            '$_numberOfIdeas',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontSize: 48.0,
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey.shade800),
          ),
        ],
      ),
    );
  }
}
