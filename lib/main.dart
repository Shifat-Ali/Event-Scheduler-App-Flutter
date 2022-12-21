import 'package:event_scheduler_app/new_event.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyApp();
}

class _MyApp extends State<MyApp> {
  final List<Widget> _list = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Event Scheduler'),
          backgroundColor: const Color.fromARGB(235, 37, 22, 175),
        ),
        backgroundColor: const Color.fromARGB(255, 159, 145, 211),
        body: ListView.builder(
            itemCount: _list.length,
            itemBuilder: (context, index) {
              return Dismissible(
                key: UniqueKey(),
                direction: DismissDirection.horizontal,
                onDismissed: (direction) {
                  setState(() {
                    _list.removeAt(index);
                  });
                },
                child: _list[index],
              );
            },
            padding: const EdgeInsets.all(10)),
        floatingActionButton: Builder(builder: (context) {
          return FloatingActionButton(
            onPressed: () async {
              String? newText = await Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => const NewEventScreen()));
              if (newText != null && newText.trim().isNotEmpty) {
                setState(() {
                  _list.add(Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            newText,
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 18),
                          ),
                        )),
                  ));
                });
              }
            },
            backgroundColor: const Color.fromARGB(235, 37, 22, 210),
            child: const Icon(Icons.add),
          );
        }),
      ),
    );
  }
}
