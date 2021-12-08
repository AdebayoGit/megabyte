import 'package:flutter/material.dart';
import 'package:megabyte/components/ticket.dart';
import 'package:megabyte/models/numbers.dart';
import 'package:provider/provider.dart';

import 'colors.dart';

class GamesCard extends StatelessWidget {
  const GamesCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ButtonStyle _style = TextButton.styleFrom(
      primary: Theme.of(context).colorScheme.onPrimary,
      backgroundColor: yellow,
    );
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 1.0, vertical: 1.5),
      // elevation: 20.0,
      decoration: BoxDecoration(
          //color: lightGreen,
          border: Border.all(
            color: Colors.yellow,
          ),
          borderRadius: BorderRadius.circular(15.0)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Padding(
                padding: EdgeInsets.all(12.0),
                child: Icon(Icons.local_activity),
              ),
              TextButton(
                child: const Text(
                  'Play',
                  style: TextStyle(color: seaGreen),
                ),
                onPressed: () {
                  showModalBottomSheet<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        height: 150,
                        color: yellow,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            InkWell(
                              child: buildBottomSheetItem(
                                pageTitle: 'Single Play',
                                icon: Icons.person,
                                onClicked: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => const Ticket(),
                                  ));
                                },
                              ),
                            ),
                            buildBottomSheetItem(
                                pageTitle: 'Group Play',
                                icon: Icons.people,
                                onClicked: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => const Ticket(),
                                  ));
                                }),
                          ],
                        ),
                      );
                    },
                  );
                },
                style: _style,
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              Padding(
                padding: EdgeInsets.all(12.0),
                child: Text(
                  'US Powerball',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              Padding(
                padding: EdgeInsets.all(12.0),
                child: FittedBox(
                  child: Text(
                    '₦398,453,220,124',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.all(12.0),
            width: double.infinity,
            decoration: const BoxDecoration(
              color: yellow,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(14),
                  bottomRight: Radius.circular(14)),
            ),
            child: FittedBox(
              child: const Text(
                '00 Days 00:00:00 left',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildBottomSheetItem({
    required String pageTitle,
    required IconData icon,
    required VoidCallback onClicked,
  }) {
    const color = seaGreen;
    final hoverColor = Colors.yellow.shade500;

    return ListTile(
      leading: Icon(
        icon,
        color: color,
      ),
      title: Text(pageTitle,
          style: const TextStyle(
              color: color, fontSize: 20, fontWeight: FontWeight.bold)),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }
}
