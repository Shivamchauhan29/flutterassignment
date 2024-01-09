import 'package:assignmentproject/createPoll.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  int currentIndex = 0;

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
                title: const Text('Share Project'),
                onTap: () {
                  // Handle Share Project action
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Open Discussion'),
                onTap: () {
                  // Handle Open Discussion action
                  Navigator.pop(context);
                },
              ),
              const SizedBox(
                height: 48,
              )
            ],
          ),
        );
      },
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
                    radius: 30,
                    // backgroundImage: AssetImage('path_to_your_photo'),
                  ),
                  SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Shivam Chauhan',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        'Position',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Row(
                    children: [
                      Text(
                        'Poll',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Icon(
                        Icons.more_horiz,
                        color: Colors.grey,
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
                    'What is the reason guys, yesterday I uploaded the same type of content?',
                  ),
                  const SizedBox(height: 8),
                  buildSelectableTile(1, 'What is the reason'),
                  buildSelectableTile(2, 'What is the reason'),
                  buildSelectableTile(3, 'What is the reason'),
                  buildSelectableTile(4, 'What is the reason'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  List tileSelection = [false, false, false, false];

  void selectTile(int index) {
    for (int i = 0; i < tileSelection.length; i++) {
      tileSelection[i] = i == index;
    }
  }

  ListTile buildSelectableTile(int index, String text) {
    return ListTile(
      title: AnimatedContainer(
        duration: const Duration(milliseconds: 800),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              tileSelection[index - 1]
                  ? Colors.blue.withOpacity(0.8)
                  : Colors.transparent,
              tileSelection[index - 1]
                  ? Colors.blue.withOpacity(0.2)
                  : Colors.transparent,
            ],
          ),
          // borderRadius: BorderRadius.circular(8.0),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: tileSelection[index - 1] ? Colors.white : Colors.black,
          ),
        ),
      ),
      onTap: () {
        setState(() {
          selectTile(index - 1);
        });
      },
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
}
