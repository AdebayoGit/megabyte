import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:megabyte/models/numbers.dart';
import 'package:megabyte/services/helpers.dart';
import 'package:provider/provider.dart';

class AdvancedSliverAppBar extends StatelessWidget {
  const AdvancedSliverAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tick = Provider.of<TicketNumbers>(context);
    print(tick.ticket.isEmpty);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverPersistentHeader(
            delegate: CustomSliverAppBarDelegate(expandedHeight: 200),
            pinned: true,
          ),
          buildImages(),
        ],
      ),
    );
  }

  Widget buildImages() => StreamBuilder(
      stream: null,
      builder: (context, snapshot) {
        return SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) => ImageWidget(index: index),
            childCount: 20,
          ),
        );
      });
}

class CustomSliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final double expandedHeight;

  const CustomSliverAppBarDelegate({
    required this.expandedHeight,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    Size _size = MediaQuery.of(context).size;
    const size = 60;
    final top = expandedHeight - shrinkOffset - size / 2;

    return Stack(
      clipBehavior: Clip.none,
      fit: StackFit.expand,
      children: [
        buildBackground(shrinkOffset, _size),
        buildAppBar(shrinkOffset, context),
        Positioned(
          top: top,
          left: 20,
          right: 20,
          child: buildFloating(shrinkOffset, context),
        ),
      ],
    );
  }

  double appear(double shrinkOffset) => shrinkOffset / expandedHeight;

  double disappear(double shrinkOffset) => 1 - shrinkOffset / expandedHeight;

  Widget buildAppBar(double shrinkOffset, BuildContext context) => Opacity(
        opacity: appear(shrinkOffset),
        child: AppBar(
          backgroundColor: const Color(0xFF1A271F),
          title: FittedBox(
            fit: BoxFit.contain,
            child: Row(
              children: [
                const Icon(Icons.account_balance_wallet_outlined),
                const SizedBox(
                  width: 10,
                ),
                RichText(
                  text: TextSpan(
                    text: Helpers.getCurrency,
                    style: const TextStyle(
                      color: Colors.yellow,
                      letterSpacing: 0,
                      fontWeight: FontWeight.w900,
                      fontSize: 20,
                    ),
                    children: [
                      TextSpan(
                        text: ' 4M',
                        style: GoogleFonts.bubblegumSans(
                          textStyle: const TextStyle(
                            color: Colors.yellow,
                            letterSpacing: 0,
                            fontWeight: FontWeight.w900,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.payments_outlined,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.redeem_outlined,
              ),
            ),
            IconButton(
              icon: const Icon(Icons.search_outlined),
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: CustomSearchDelegate(),
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.filter_list_outlined),
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: CustomSearchDelegate(),
                );
              },
            ),

          ],
        ),
      );

  Widget buildBackground(double shrinkOffset, Size _size) => Opacity(
        opacity: disappear(shrinkOffset),
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.yellow,
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Transform.rotate(
                      angle: 270,
                      child: Icon(
                        Icons.account_balance_wallet,
                        size: _size.width * 0.1,
                        color: Colors.green[900],
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    RichText(
                      text: TextSpan(
                        text: Helpers.getCurrency,
                        style: const TextStyle(
                          color: Color(0xFF1A271F),
                          letterSpacing: 0,
                          fontWeight: FontWeight.w900,
                          fontSize: 30,
                        ),
                        children: [
                          TextSpan(
                            text: ' 4, 000, 000',
                            style: GoogleFonts.bubblegumSans(
                              textStyle: const TextStyle(
                                color: Color(0xFF1A271F),
                                letterSpacing: 0,
                                fontWeight: FontWeight.w900,
                                fontSize: 30,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const FittedBox(
                  fit: BoxFit.contain,
                  child: Text(
                    'Available Balance',
                    style: TextStyle(
                      color: Color(0xFF1A271F),
                      letterSpacing: 5,
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );

  Widget buildFloating(double shrinkOffset, BuildContext context) => Opacity(
        opacity: disappear(shrinkOffset),
        child: Card(
          color: const Color(0xFF1A271F),
          child: Row(
            children: [
              Expanded(
                child: buildButton(
                  text: 'Deposit',
                  icon: Icons.payments_outlined,
                  press: () {},
                ),
              ),
              Expanded(
                child: buildButton(
                  text: 'Withdraw',
                  icon: Icons.redeem_outlined,
                  press: () {},
                ),
              ),
              Expanded(
                child: buildButton(
                  text: 'Search',
                  icon: Icons.search_outlined,
                  press: () {
                    showSearch(
                      context: context,
                      delegate: CustomSearchDelegate(),
                    );
                  },
                ),
              ),
              Expanded(
                child: buildButton(
                  text: 'Filter',
                  icon: Icons.filter_list_outlined,
                  press: () {},
                ),
              ),
            ],
          ),
        ),
      );

  Widget buildButton(
          {required String text,
          required IconData icon,
          required VoidCallback press}) =>
      TextButton(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              icon,
              color: Colors.yellow,
            ),
            Text(
              text,
              style: const TextStyle(color: Colors.yellow),
            ),
          ],
        ),
        onPressed: press,
      );

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => kToolbarHeight + 30;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}

class ImageWidget extends StatelessWidget {
  final int index;

  const ImageWidget({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SizedBox(
        height: 150,
        width: double.infinity,
        child: Card(
          child: Image.network(
            'https://source.unsplash.com/random?sig=$index',
            fit: BoxFit.cover,
          ),
        ),
      );
}

class CustomSearchDelegate extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
        icon: const Icon(Icons.clear, color: Colors.red,),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    return Container();
  }
}
