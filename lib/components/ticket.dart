import 'dart:math';

import 'package:flutter/material.dart';
import 'package:megabyte/models/numbers.dart';
import 'package:megabyte/services/helpers.dart';
import 'package:megabyte/views/check_out.dart';
import 'package:provider/provider.dart';
import 'auth_components.dart';

class Ticket extends StatefulWidget {
  Ticket({Key? key, required this.tick}) : super(key: key);

  final TicketNumbers tick;

  @override
  State<Ticket> createState() => _TicketState();
}

class _TicketState extends State<Ticket> {
  int num = 1;
  late bool value;

  late final TicketNumbers tick;

  @override
  void initState() {
    // TODO: implement initState
    tick = widget.tick;
    tick.createTicket();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    print(tick.ticket);
    return WillPopScope(
      onWillPop: () async {
        await showDialog(
            context: context,
            builder: (context) => AlertDialog(
                    title: Text('Notice!'),
                    content: Text(
                        'If you go back your selection will be discarded...'),
                    actions: <Widget>[
                      TextButton(
                          child: Text(
                            'Go Back',
                            style: TextStyle(
                              color: Colors.green,
                            ),
                          ),
                          onPressed: () {
                            setState(() {
                              value = true;
                            });
                            tick.ticket.clear();
                            return Navigator.of(context).pop();
                          }),
                      TextButton(
                          child: Text(
                            'Stay',
                            style: TextStyle(
                              color: Colors.red,
                            ),
                          ),
                          onPressed: () {
                            setState(() {
                              value = false;
                            });
                            print(value);
                            return Navigator.of(context).pop();
                          }),
                    ]));
        if (value) {
          return true;
        } else {
          return false;
        }
      },
      child: Scaffold(
        appBar: AppBar(
          actions: [
            TextButton(
              onPressed: () {
                List<Map<String, Set<int>>> toRemove = [];
                tick.ticket.forEach((element) {
                  int keys = element['Keys']!.length;
                  int num = element['Numbers']!.length;
                  if (num < 5 || keys < 5) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Please fill all ticket')));
                  } else{
                    Navigator.of(context).push(
                      createRoute(
                        TicketCard(),
                      ),
                    );
                  }
                });
              },
              child: Text(
                'CheckOut',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color(0xFF1A271F),
          onPressed: () {
            //Todo Remove print
            print(tick.ticket);
            setState(() {
              tick.createTicket();
            });
          },
          child: const Icon(
            Icons.add,
            color: Colors.yellow,
          ),
        ),
        body: SafeArea(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 4,
              mainAxisExtent: 430,
            ),
            itemCount: tick.ticket.length,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    color: Colors.green[900]!,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          //Todo select randomly
                          onPressed: () {
                            setState(() {
                              generateTicket(index);
                            });
                          },
                          icon: const Icon(
                            Icons.autorenew_outlined,
                            color: Colors.white,
                          ),
                        ),
                        IconButton(
                          //Todo clear ticket
                          onPressed: () {
                            setState(() {
                              tick.ticket[index]['Numbers']!.clear();
                              tick.ticket[index]['Keys']!.clear();
                            });
                          },
                          icon: const Icon(
                            Icons.delete_outlined,
                            color: Colors.white,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            //Todo delete ticket
                            if(tick.ticket.length == 1){
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Cannot delete final ticket')));
                            } else{
                              setState(() {
                                tick.ticket.removeAt(index);
                              });
                            }
                          },
                          icon: const Icon(
                            Icons.clear_outlined,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    //padding: const EdgeInsets.all(0),
                    decoration: BoxDecoration(
                      color: const Color(0xFF1A271F),
                      border: Border.all(
                        color: Colors.green[900]!,
                        width: 2,
                      ),
                    ),
                    child: Column(
                      //crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        MainNumbers(
                          index: index,
                        ),
                        Keys(
                          index: index,
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: _size.width * 0.0025),
                          padding: EdgeInsets.symmetric(
                              horizontal: _size.width * 0.025, vertical: _size.height * 0.008),
                          color: Colors.yellow,
                          width: double.infinity,
                          child: FittedBox(
                            child: Text(
                              'Price: ${Helpers.getCurrency}0.000000000',
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.red,
                                fontSize: 20,
                                backgroundColor: Colors.yellow,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  void generateTicket(int index){
    //final int num = 1 + Random.secure().nextInt(70 - 1 + 1);
    Set<int> keyNums = {};
    Set<int> mainNums = {};

    while(keyNums.length < 5 || mainNums.length < 5){
      keyNums.add(1 + Random.secure().nextInt(27 - 1 + 1));
      mainNums.add(1 + Random.secure().nextInt(70 - 1 + 1));
    }
      tick.ticket[index]['Keys'] = keyNums;
      tick.ticket[index]['Numbers'] = mainNums;
  }
}

class MainNumbers extends StatefulWidget {
  const MainNumbers({Key? key, required this.index}) : super(key: key);

  final int index;

  @override
  State<MainNumbers> createState() => _MainNumbersState();
}

class _MainNumbersState extends State<MainNumbers> {
  late final int ind;
  @override
  void initState() {
    super.initState();
    ind = widget.index;
  }

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    final tick = Provider.of<TicketNumbers>(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: _size.width * 0.0025),
      padding: EdgeInsets.symmetric(
          horizontal: _size.width * 0.025, vertical: _size.height * 0.01),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10)),
          boxShadow: const [
            BoxShadow(
                offset: Offset(2, 2),
                blurRadius: 6,
                spreadRadius: 1,
                color: Colors.black26)
          ]),
      child: GridView.builder(
          padding: const EdgeInsets.all(2),
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 7,
            crossAxisSpacing: 4.0,
            mainAxisSpacing: 4.0,
          ),
          itemCount: 69,
          itemBuilder: (context, index) {
            Set<int> nums = tick.ticket[ind]['Numbers']!;
            return Number(
              number: index + 1,
              shape: BoxShape.rectangle,
              color: nums.contains(index + 1)
                  ? Colors.yellowAccent[400]
                  : Colors.white,
              textColor: nums.contains(index + 1) ? Colors.white : Colors.green,
              press: () {
                if (nums.length == 5 && nums.contains(index + 1)) {
                  nums.remove(index + 1);
                  setState(() {});
                } else if (nums.length == 5 && !nums.contains(index + 1)) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Ticket is complete'),
                    duration: Duration(milliseconds: 200),
                  ));
                } else {
                  if (nums.contains(index + 1)) {
                    nums.remove(index + 1);
                    setState(() {});
                  } else {
                    nums.add(index + 1);
                    setState(() {});
                  }
                }

                print(tick.ticket);
              },
            );
          }),
    );
  }
}

class Keys extends StatefulWidget {
  const Keys({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  _KeysState createState() => _KeysState();
}

class _KeysState extends State<Keys> {
  late final int ind;

  @override
  void initState() {
    super.initState();
    ind = widget.index;
  }

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    final tick = Provider.of<TicketNumbers>(context);
    print(tick.ticket);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: _size.width * 0.0025),
      padding: EdgeInsets.symmetric(
          horizontal: _size.width * 0.025, vertical: _size.height * 0.01),
      decoration: BoxDecoration(color: Colors.green[900],
          //borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
                offset: Offset(2, 2),
                blurRadius: 6,
                spreadRadius: 1,
                color: Colors.black26)
          ]),
      child: GridView.builder(
        padding: const EdgeInsets.all(2),
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 7,
          crossAxisSpacing: 4.0,
          mainAxisSpacing: 4.0,
        ),
        itemCount: 26,
        itemBuilder: (context, index) {
          Set<int> nums = tick.ticket[ind]['Keys']!;
          return Number(
            number: index + 1,
            shape: BoxShape.circle,
            borderWidth: 0,
            color:
                nums.contains(index + 1) ? Colors.redAccent[400] : Colors.white,
            textColor: nums.contains(index + 1) ? Colors.white : Colors.green,
            press: () {
              if (nums.length == 5 && nums.contains(index + 1)) {
                nums.remove(index + 1);
                setState(() {});
              } else if (nums.length == 5 && !nums.contains(index + 1)) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('Ticket is complete'),
                  duration: Duration(milliseconds: 200),
                ));
              } else {
                if (nums.contains(index + 1)) {
                  nums.remove(index + 1);
                  setState(() {});
                } else {
                  nums.add(index + 1);
                  setState(() {});
                }
              }

              print(tick.ticket);
            },
          );
        },
      ),
    );
  }
}

class Number extends StatelessWidget {
  const Number(
      {Key? key,
      required this.number,
      this.color,
      required this.press,
      required this.shape,
      this.borderWidth = 1,
      this.textColor = Colors.green})
      : super(key: key);

  final int number;
  final VoidCallback press;
  final Color? color;
  final Color? textColor;
  final BoxShape shape;
  final double borderWidth;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          border: Border.all(color: Colors.green, width: borderWidth),
          borderRadius:
              shape == BoxShape.rectangle ? BorderRadius.circular(1) : null,
          shape: shape,
        ),
        child: Center(
            child: Text(
          '$number',
          style: TextStyle(
              fontSize: 8, color: textColor, fontWeight: FontWeight.bold),
        )),
      ),
    );
  }
}
