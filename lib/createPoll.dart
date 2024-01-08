import 'package:flutter/material.dart';

class CreatePoll extends StatefulWidget {
  const CreatePoll({Key? key}) : super(key: key);

  @override
  State<CreatePoll> createState() => _CreatePollState();
}

class _CreatePollState extends State<CreatePoll> {
  final TextEditingController _questionController = TextEditingController();
  final List<TextEditingController> _optionControllers = [
    TextEditingController()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Poll'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                // Handle post action
              },
              child: const Text('Post'),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              controller: _questionController,
              maxLines: 5,
              decoration: const InputDecoration(
                hintText: 'Ask a question',
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.all(16),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView(
                children: List.generate(_optionControllers.length, (index) {
                  print(index);

                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: _optionControllers[index],
                            decoration: const InputDecoration(
                              hintText: 'Option',
                              border: OutlineInputBorder(),
                              contentPadding: EdgeInsets.all(16),
                            ),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            print(index);

                            _removeOption(index);
                          },
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (_optionControllers.length < 4) {
                  _addOption();
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('You can only add up to 4 options'),
                    ),
                  );
                }
              },
              child: const Text('Add Option'),
            ),
          ],
        ),
      ),
    );
  }

  void _addOption() {
    setState(() {
      _optionControllers.add(TextEditingController());
    });
  }

  void _removeOption(int index) {
    setState(() {
      _optionControllers.removeAt(index);
    });
  }
}
