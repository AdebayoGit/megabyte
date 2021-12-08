import 'package:flutter/material.dart';
import 'package:megabyte/models/numbers.dart';
import 'package:megabyte/services/helpers.dart';
import 'package:megabyte/views/check_out.dart';
import 'package:provider/provider.dart';

import 'auth_components.dart';

class Ticket extends StatefulWidget {
  const Ticket({Key? key}) : super(key: key);

  @override
  State<Ticket> createState() => _TicketState();
}

class _TicketState extends State<Ticket> {
  int num = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    final tick = Provider.of<TicketNumbers>(context);
    print(tick.ticket);
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).push(
                createRoute(
                  OrdersList(),
                ),
              );
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
          print(tick.ticket);
          setState(() {
            num += 1;
            //tick.createTicket();
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
          itemCount: num,
          itemBuilder: (BuildContext context, int index) {
            //tick.createTicket();
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
                        onPressed: () {},
                        icon: const Icon(
                          Icons.autorenew_outlined,
                          color: Colors.white,
                        ),
                      ),
                      IconButton(
                        //Todo delete ticket
                        onPressed: () {},
                        icon: const Icon(
                          Icons.delete_outlined,
                          color: Colors.white,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          //Todo clear ticket
                          setState(() {
                            num -= 1;
                          });
                          print(index);
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
                  padding: const EdgeInsets.all(0),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1A271F),
                    border: Border.all(
                      color: Colors.green[900]!,
                      width: 2,
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      MainNumbers(
                        mainNums: TicketNumbers(),
                        index: index,
                      ),
                      Keys(
                        keyNums: TicketNumbers(),
                        index: index,
                      ),
                      FittedBox(
                        child: Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: _size.width * 0.0025),
                          padding: EdgeInsets.symmetric(
                              horizontal: _size.width * 0.06),
                          color: Colors.yellow,
                          child: Text(
                            'Price: ${Helpers.getCurrency}0.00',
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
    );
  }
}

class Numbers extends StatefulWidget {
  const Numbers({Key? key, required this.index}) : super(key: key);

  final int index;

  @override
  _NumbersState createState() => _NumbersState();
}

class _NumbersState extends State<Numbers> {
  late final int index;

  @override
  void initState() {
    // TODO: implement initState
    index = widget.index;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
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
                onPressed: () {},
                icon: const Icon(
                  Icons.autorenew_outlined,
                  color: Colors.white,
                ),
              ),
              IconButton(
                //Todo delete ticket
                onPressed: () {},
                icon: const Icon(
                  Icons.delete_outlined,
                  color: Colors.white,
                ),
              ),
              IconButton(
                onPressed: () {
                  //Todo clear ticket
                  /*setState(() {
                          num -= 1;
                        });*/
                  print(index);
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
          padding: const EdgeInsets.all(0),
          decoration: BoxDecoration(
            color: const Color(0xFF1A271F),
            border: Border.all(
              color: Colors.green[900]!,
              width: 2,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              MainNumbers(
                mainNums: TicketNumbers(),
                index: index,
              ),
              Keys(
                keyNums: TicketNumbers(),
                index: index,
              ),
              FittedBox(
                child: Container(
                  margin:
                      EdgeInsets.symmetric(horizontal: _size.width * 0.0025),
                  padding: EdgeInsets.symmetric(horizontal: _size.width * 0.06),
                  color: Colors.yellow,
                  child: Text(
                    'Price: ${Helpers.getCurrency}0.00',
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
  }
}

class MainNumbers extends StatefulWidget {
  const MainNumbers({Key? key, required this.mainNums, required this.index})
      : super(key: key);

  final TicketNumbers mainNums;
  final int index;

  @override
  State<MainNumbers> createState() => _MainNumbersState();
}

class _MainNumbersState extends State<MainNumbers> {
  Color color = Colors.white;
  Color textColor = Colors.green;

  late final TicketNumbers mainNums;
  late final int ind;
  @override
  void initState() {
    super.initState();
    mainNums = widget.mainNums;
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
        /*boxShadow: const [
            BoxShadow(
                offset: Offset(2, 2),
                blurRadius: 6,
                spreadRadius: 1,
                color: Colors.black26)
          ]*/
      ),
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
            return Number(
              number: index + 1,
              shape: BoxShape.rectangle,
              color: mainNums.numbers.contains(index + 1)
                  ? Colors.yellowAccent[400]
                  : Colors.white,
              textColor: mainNums.numbers.contains(index + 1)
                  ? Colors.white
                  : Colors.green,
              press: () {
                //getColor(tick.ticket[index]['Numbers']!, index + 1);
                tick.ticket[ind] = {'Keys': mainNums.keys};
                if (mainNums.numbers.length == 5 &&
                    mainNums.numbers.contains(index + 1)) {
                  mainNums.removeFromTicket(index + 1);
                  setState(() {});
                } else if (mainNums.numbers.length == 5 &&
                    !mainNums.numbers.contains(index + 1)) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Ticket is complete'),
                    duration: Duration(milliseconds: 200),
                  ));
                } else {
                  if (mainNums.numbers.contains(index + 1)) {
                    mainNums.removeFromKeys(index + 1);
                    setState(() {});
                  } else {
                    mainNums.addToTicket(index + 1);
                    setState(() {});
                  }
                }
                print(mainNums.numbers);
              },
            );
          }),
    );
  }

  getColor(Set<int> numbers, int index) {
    if (numbers.isNotEmpty && numbers.contains(index)) {
      setState(() {
        color = Colors.yellow[600]!;
        textColor = Colors.white;
      });
    }
  }
}

class Keys extends StatefulWidget {
  const Keys({Key? key, required this.keyNums, required this.index})
      : super(key: key);
  final TicketNumbers keyNums;
  final int index;

  @override
  _KeysState createState() => _KeysState();
}

class _KeysState extends State<Keys> {
  late final TicketNumbers keyNums;
  late final int ind;
  @override
  void initState() {
    super.initState();
    keyNums = widget.keyNums;
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
      decoration: BoxDecoration(
        color: Colors.green[900],
        //borderRadius: BorderRadius.circular(10),
        /*boxShadow: const [
            BoxShadow(
                offset: Offset(2, 2),
                blurRadius: 6,
                spreadRadius: 1,
                color: Colors.black26)
          ]*/
      ),
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
          return Number(
            number: index + 1,
            shape: BoxShape.circle,
            borderWidth: 0,
            color: keyNums.keys.contains(index + 1)
                ? Colors.redAccent[400]
                : Colors.white,
            textColor:
                keyNums.keys.contains(index + 1) ? Colors.white : Colors.green,
            press: () {
              tick.ticket[ind] = {'Keys': keyNums.keys};
              if (keyNums.keys.length == 5 &&
                  keyNums.keys.contains(index + 1)) {
                keyNums.removeFromKeys(index + 1);
                setState(() {});
              } else if (keyNums.keys.length == 5 &&
                  !keyNums.keys.contains(index + 1)) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('Ticket is complete'),
                  duration: Duration(milliseconds: 200),
                ));
              } else {
                if (keyNums.keys.contains(index + 1)) {
                  keyNums.removeFromKeys(index + 1);
                  setState(() {});
                } else {
                  keyNums.addToKeys(index + 1);
                  setState(() {});
                }
              }
              print(keyNums.keys);
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
