import 'package:flutterwaystatemanagement/classes/log_provider.dart';
import 'package:flutter/material.dart';

class LogHistory extends StatelessWidget {
  const LogHistory({super.key});

  @override
  Widget build(BuildContext context) {
    LogProvider logProvider = LogProvider.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Log History'),
        backgroundColor: logProvider.color,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: ListTile(
            title: Text(logProvider.log.logHistory),
          ),
        ),
      ),
    );
  }
}
