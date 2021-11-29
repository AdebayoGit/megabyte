import 'package:flutter/material.dart';
import 'package:megabyte/components/colors.dart';
import 'package:megabyte/components/games_card.dart';
import 'package:megabyte/components/main_app_bar.dart';
import 'package:megabyte/components/navigation_drawer.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  static const List<Widget> _pages = <Widget>[
    HomePageWidget(),
    // ResultsPage(),
    // TicketsPage(),
    // TransactionsPage()
  ];

  // static const List<Text> _appBarTitles = <Text>[
  //   Text('Home'),
  //   Text('Results'),
  //   Text('Tickets'),
  //   Text('Transactions')
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawerWidget(),
      appBar: MainAppBar(),
      body: _pages.elementAt(_selectedIndex),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: const Text('Chat With Us'),
        icon: const Icon(Icons.support),
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: seaGreen,
          primaryColor: lightGreen,
        ),
        child: BottomNavigationBar(
          unselectedItemColor: Colors.white,
          elevation: 16.0,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.receipt),
              label: 'Results',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.local_activity),
              label: 'Tickets',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_balance_wallet),
              label: 'Transactions',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: yellow,
          onTap: _onItemTapped,
        ),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  // onItemPressed() {}
}

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  final GlobalKey _parentKey = GlobalKey();
  final YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: 'P4CaXBaxvIQ',
    flags: const YoutubePlayerFlags(
      autoPlay: false,
      mute: false,
      loop: false,
      enableCaption: true,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              margin: EdgeInsets.all(10),
              color: lightGreen.withOpacity(0.7),
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 160,
                      decoration: BoxDecoration(
                        color: yellow,
                        image: const DecorationImage(
                          image: AssetImage('images/game_image_01.png'),
                        ),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 0.0),
                          child: Text(
                            '₦ 334,375,567,321',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 0.0),
                          child: Text(
                            '00 Days 00:00:00',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 0.0),
                          child: TextButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(yellow),
                            ),
                            onPressed: () {},
                            child: const Text(
                              'PLAY NOW',
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 370,
              child: GridView.builder(
                  padding: const EdgeInsets.only(left: 10.0),
                  scrollDirection: Axis.horizontal,
                  itemCount: 23,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 6,
                    crossAxisSpacing: 6,
                  ),
                  itemBuilder: (BuildContext context, int index) =>
                      const GamesCard()),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                children: const [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Divider(
                        color: yellow,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      'How To Play',
                      style: TextStyle(
                          color: yellow,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Divider(
                        color: yellow,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: const [
                      CircleAvatar(
                        radius: 50.0,
                        foregroundColor: yellow,
                        backgroundImage:
                            AssetImage('images/choose_numbers_01.png'),
                      ),
                      Text(
                        '1. Choose Number',
                        style: TextStyle(color: yellow, fontSize: 18.0),
                      )
                    ],
                  ),
                  Column(
                    children: const [
                      CircleAvatar(
                        radius: 50.0,
                        backgroundColor: yellow,
                        backgroundImage:
                            AssetImage('images/buy_tickets_02.png'),
                      ),
                      Text(
                        '2. Buy Ticket',
                        style: TextStyle(color: yellow, fontSize: 18.0),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: const [
                      CircleAvatar(
                        radius: 50.0,
                        backgroundImage: AssetImage('images/the_draw_03.png'),
                      ),
                      Text(
                        '3. Check the Draw',
                        style: TextStyle(color: yellow, fontSize: 18.0),
                      )
                    ],
                  ),
                  Column(
                    children: const [
                      CircleAvatar(
                        radius: 50.0,
                        foregroundColor: yellow,
                        backgroundImage: AssetImage('images/win_04.png'),
                      ),
                      Text(
                        '4. Win',
                        style: TextStyle(color: yellow, fontSize: 18.0),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 58.0),
              child: Container(
                height: 250,
                margin: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                ),
                child: YoutubePlayer(
                  controller: _controller,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
