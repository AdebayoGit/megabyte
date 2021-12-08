import 'package:flutter/material.dart';
import 'package:megabyte/components/colors.dart';
import 'package:megabyte/views/main_app_bar.dart';
import 'package:megabyte/views/navigation_drawer.dart';

class VIPPackagesPage extends StatelessWidget {
  const VIPPackagesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        drawer: NavigationDrawerWidget(),
        appBar: MainAppBar(
          context: context,
        ),
        body: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'VIP Packages',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  Container(
                    height: 310,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 6.0),
                    decoration: BoxDecoration(
                        color: lightGreen,
                        border: Border.all(color: Colors.white, width: 2.5),
                        borderRadius: BorderRadius.circular(15.0)),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.all(16.0),
                              height: 90,
                              width: 90,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image:
                                      AssetImage('assets/images/vip_gold.png'),
                                ),
                              ),
                            ),
                            const Expanded(
                                flex: 2,
                                child: Text(
                                  'VIP Gold',
                                  style: TextStyle(
                                      color: Colors.orange,
                                      fontSize: 28.0,
                                      fontWeight: FontWeight.bold),
                                ))
                          ],
                        ),
                        const FittedBox(
                          fit: BoxFit.contain,
                          child: Text(
                            "₦334,375,567,321",
                            style: TextStyle(
                                fontSize: 28.0, fontWeight: FontWeight.bold),
                          ),
                        ),
                        const FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Text(
                            "33 ticket(s)",
                            style: TextStyle(
                                fontSize: 22.0, fontWeight: FontWeight.bold),
                          ),
                        ),
                        const Text(
                          "11-combo lotteries",
                          style: TextStyle(
                              fontSize: 22.0, fontWeight: FontWeight.bold),
                        ),
                        const Text(
                          "11 Draws",
                          style: TextStyle(
                              fontSize: 22.0, fontWeight: FontWeight.bold),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Column(
                                children: const [
                                  FittedBox(
                                    child: Text(
                                      '₦334,375',
                                      style: TextStyle(
                                        decoration: TextDecoration.lineThrough,
                                        fontSize: 18.0,
                                      ),
                                    ),
                                  ),
                                  FittedBox(
                                    child: Text(
                                      '₦300,375',
                                      style: TextStyle(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Expanded(
                                flex: 2,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
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
                                )),
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 310,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 6.0),
                    decoration: BoxDecoration(
                        color: lightGreen,
                        border: Border.all(color: Colors.white, width: 2.5),
                        borderRadius: BorderRadius.circular(15.0)),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.all(16.0),
                              height: 90,
                              width: 90,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/vip_silver.png'),
                                ),
                              ),
                            ),
                            const Expanded(
                                flex: 2,
                                child: Text(
                                  'VIP Silver',
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 28.0,
                                      fontWeight: FontWeight.bold),
                                ))
                          ],
                        ),
                        const Text(
                          "₦234,675,567,780",
                          style: TextStyle(
                              fontSize: 28.0, fontWeight: FontWeight.bold),
                        ),
                        const Text(
                          "29 ticket(s)",
                          style: TextStyle(
                              fontSize: 22.0, fontWeight: FontWeight.bold),
                        ),
                        const Text(
                          "8-combo lotteries",
                          style: TextStyle(
                              fontSize: 22.0, fontWeight: FontWeight.bold),
                        ),
                        const Text(
                          "8 Draws",
                          style: TextStyle(
                              fontSize: 22.0, fontWeight: FontWeight.bold),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Column(
                                children: const [
                                  Text(
                                    '₦154,375',
                                    style: TextStyle(
                                      decoration: TextDecoration.lineThrough,
                                      fontSize: 18.0,
                                    ),
                                  ),
                                  Text(
                                    '₦99,375',
                                    style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                            Expanded(
                                flex: 2,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
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
                                )),
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 310,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 6.0),
                    decoration: BoxDecoration(
                        color: lightGreen,
                        border: Border.all(color: Colors.white, width: 2.5),
                        borderRadius: BorderRadius.circular(15.0)),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.all(16.0),
                              height: 90,
                              width: 90,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/vip_bronze.png'),
                                ),
                              ),
                            ),
                            const Expanded(
                                flex: 2,
                                child: Text(
                                  'VIP Bronze',
                                  style: TextStyle(
                                      color: Colors.brown,
                                      fontSize: 28.0,
                                      fontWeight: FontWeight.bold),
                                ))
                          ],
                        ),
                        const FittedBox(
                          child: Text(
                            "₦80,735,600,540",
                            style: TextStyle(
                                fontSize: 28.0, fontWeight: FontWeight.bold),
                          ),
                        ),
                        const FittedBox(
                          child: Text(
                            "20 ticket(s)",
                            style: TextStyle(
                                fontSize: 22.0, fontWeight: FontWeight.bold),
                          ),
                        ),
                        const FittedBox(
                          child: Text(
                            "4-combo lotteries",
                            style: TextStyle(
                                fontSize: 22.0, fontWeight: FontWeight.bold),
                          ),
                        ),
                        const Text(
                          "4 Draws",
                          style: TextStyle(
                              fontSize: 22.0, fontWeight: FontWeight.bold),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Column(
                                children: const [
                                  Text(
                                    '₦90,375',
                                    style: TextStyle(
                                      decoration: TextDecoration.lineThrough,
                                      fontSize: 18.0,
                                    ),
                                  ),
                                  Text(
                                    '₦65,375',
                                    style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                            Expanded(
                                flex: 2,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
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
                                )),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
