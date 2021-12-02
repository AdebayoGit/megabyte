import 'package:flutter/material.dart';
import 'package:megabyte/components/ticket.dart';

class GamesCard extends StatelessWidget {
  const GamesCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding: EdgeInsets.all(12.0),
                child: Icon(Icons.local_activity),
              ),
              InkWell(
                child: const Icon(Icons.more_vert),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const Ticket(),
                  ));
                },
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
                child: Text(
                  '₦398,453,220,124',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.all(12.0),
            width: double.infinity,
            decoration: const BoxDecoration(
                color: Colors.yellow,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(14),
                    bottomRight: Radius.circular(14))),
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
        ],
      ),
    );
  }
}
