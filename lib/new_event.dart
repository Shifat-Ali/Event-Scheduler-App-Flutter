import 'package:flutter/material.dart';

class NewEventScreen extends StatefulWidget {
  const NewEventScreen({super.key});

  @override
  State<NewEventScreen> createState() => _NewEventScreenState();
}

class _NewEventScreenState extends State<NewEventScreen> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Event'),
        backgroundColor: const Color.fromARGB(235, 37, 22, 175),
      ),
      backgroundColor: const Color.fromARGB(255, 159, 145, 211),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: const Color.fromARGB(255, 65, 24, 212),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                child: TextField(
                  maxLines: 2,
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    icon: Icon(
                      Icons.event,
                      color: Colors.white,
                    ),
                    label: Text(
                      'Event',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                  controller: _textEditingController,
                ),
              ),
            ),
          ),
          Builder(builder: (context) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: const Color.fromARGB(255, 192, 182, 229),
                ),
                child: TextButton(
                    style: TextButton.styleFrom(
                        minimumSize: const Size.fromHeight(25)),
                    onPressed: () {
                      String newEventText = _textEditingController.text;
                      Navigator.of(context).pop(newEventText);
                    },
                    child: const Text(
                      'ADD',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    )),
              ),
            );
          })
        ],
      ),
    );
  }
}
