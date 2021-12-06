import 'package:flutter/material.dart';

import 'colors.dart';

class ResultsCard extends StatelessWidget {
  const ResultsCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      decoration: BoxDecoration(
          // color: lightGreen,
          border: Border.all(color: yellow, width: 2.0),
          borderRadius: BorderRadius.circular(15.0)),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              // height: 180,
              decoration: const BoxDecoration(
                color: yellow,
                image: DecorationImage(
                  image: AssetImage('assets/images/game_image_01.png'),
                ),
                borderRadius:
                    BorderRadius.horizontal(left: Radius.circular(12)),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 1.0),
                  child: const Text(
                    'Last Draw',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 1.0),
                  child: const Text(
                    '21.11.2021',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 16.0, top: 10.0),
                  child: const Text(
                    'Draw Numbers: ',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 16.0, bottom: 10.0),
                  child: Row(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                            color: Colors.green, shape: BoxShape.circle),
                        child: const Padding(
                          padding: EdgeInsets.all(14.0),
                          child: Text('1'),
                        ),
                      ),
                      const SizedBox(
                        width: 6.0,
                      ),
                      Container(
                        decoration: const BoxDecoration(
                            color: Colors.green, shape: BoxShape.circle),
                        child: const Padding(
                          padding: EdgeInsets.all(14.0),
                          child: Text('2'),
                        ),
                      ),
                      const SizedBox(
                        width: 6.0,
                      ),
                      Container(
                        decoration: const BoxDecoration(
                            color: Colors.green, shape: BoxShape.circle),
                        child: const Padding(
                          padding: EdgeInsets.all(14.0),
                          child: Text('8'),
                        ),
                      ),
                      const SizedBox(
                        width: 6.0,
                      ),
                      Container(
                        decoration: const BoxDecoration(
                            color: Colors.green, shape: BoxShape.circle),
                        child: const Padding(
                          padding: EdgeInsets.all(14.0),
                          child: Text('9'),
                        ),
                      ),
                      const SizedBox(
                        width: 6.0,
                      ),
                      Container(
                        decoration: const BoxDecoration(
                            color: Colors.red, shape: BoxShape.circle),
                        child: const Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Text('7'),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 1.0),
                  child: TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(yellow),
                    ),
                    onPressed: () {},
                    child: const Text(
                      'Past Results',
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
