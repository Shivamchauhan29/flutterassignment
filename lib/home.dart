import 'package:assignmentproject/createPoll.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  int currentIndex = 0;
  bool isSelected = false;
  late AnimationController _controller;
  final List<String> options = [
    'option1',
    'option2',
    'option3',
    'option4',
  ];

  bool tileOne = false;
  bool tileTwo = false;
  bool tileThree = false;
  bool tileFour = false;

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: const Text('Start Post'),
                onTap: () {
                  // Handle Start Post action
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Create Poll'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => // Handle Create Poll action
                              const CreatePoll()));
                },
              ),
              ListTile(
                title: Text('Share Project'),
                onTap: () {
                  // Handle Share Project action
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Open Discussion'),
                onTap: () {
                  // Handle Open Discussion action
                  Navigator.pop(context);
                },
              ),
              SizedBox(
                height: 48,
              )
            ],
          ),
        );
      },
    );
  }

  Widget buildAnimatedTile(String text, int index) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(-1.0, 0.0),
        end: const Offset(0.0, 0.0),
      ).animate(CurvedAnimation(
        parent: _controller,
        curve:
            Interval((index - 1) * 0.2, index * 0.2, curve: Curves.easeInOut),
      )),
      child: ListTile(
        title: Text(text),
        onTap: () {
          _controller.forward(from: 0.0);
          // Add your onTap logic here
        },
      ),
    );
  }

  Widget polls() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children: [
                  CircleAvatar(
                    // Add photo here
                    radius: 30,
                    // backgroundImage: AssetImage('path_to_your_photo'),
                  ),
                  SizedBox(width: 8), // Adjust spacing as needed
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Karim Saif',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        'Position', // Add the position of the person here
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  Spacer(), // Takes remaining space
                  Row(
                    children: [
                      Text(
                        'Poll',
                        style: TextStyle(
                          color: Colors.blue, // Customize color as needed
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Icon(
                        Icons.more_horiz, // More horizontal icon
                        color: Colors.grey, // Customize color as needed
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'What is the reason guys, yesterday I uploaded same type of content?',
                  ),
                  const SizedBox(height: 8),
                  ListTile(
                    // tileColor: tileOne ? Colors.blue : Colors.transparent,
                    title: const Text('What is the reason '),
                    onTap: () {
                      // setState(() {
                      //   tileOne = !tileOne;
                      // });
                      buildAnimatedTile('What is the reason ', 1);

                      // change the color of the tile
                    },
                  ),
                  ListTile(
                    tileColor: tileTwo ? Colors.blue : Colors.transparent,
                    title: const Text('What is the reason '),
                    onTap: () {
                      setState(() {
                        tileTwo = !tileTwo;
                      });
                      // change the color of the tile
                    },
                  ),
                  ListTile(
                    tileColor: tileThree ? Colors.blue : Colors.transparent,
                    title: const Text('What is the reason '),
                    onTap: () {
                      setState(() {
                        tileThree = !tileThree;
                      });
                      // change the color of the tile
                    },
                  ),
                  ListTile(
                    tileColor: tileFour ? Colors.blue : Colors.transparent,
                    title: const Text('What is the reason '),
                    onTap: () {
                      setState(() {
                        tileFour = !tileFour;
                      });
                      // change the color of the tile
                    },
                  ),
                  buildAnimatedTile('What is the reason ', 1),
                  buildAnimatedTile('What is the reason ', 2),
                  buildAnimatedTile('What is the reason ', 3),
                  buildAnimatedTile('What is the reason ', 4),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('My Feed'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Home'),
              Tab(text: 'Explore'),
            ],
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.segment),
              onPressed: () {},
            ),
          ],
        ),
        body: TabBarView(
          children: [
            polls(),
            const Center(child: Text('Tab 2')),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          selectedItemColor: Colors.deepPurple,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Find',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add),
              label: 'Add',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.event_note),
              label: 'Invites',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: 'Profile',
            ),
          ],
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
            if (index == 2) {
              _showBottomSheet(context);
            }
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
