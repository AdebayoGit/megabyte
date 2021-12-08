import 'package:flutter/material.dart';
import 'package:megabyte/models/numbers.dart';
import 'package:megabyte/services/helpers.dart';
import 'package:provider/provider.dart';

import 'auth_components.dart';

class Ticket extends StatefulWidget {
  const Ticket({Key? key}) : super(key: key);

  @override
  State<Ticket> createState() => _TicketState();
}

class _TicketState extends State<Ticket> {
  final List<int> nums = [];
  int num = 1;
  final TicketNumbers numbers = TicketNumbers();

  @override
  Widget build(BuildContext context) {
    final tick = Provider.of<TicketNumbers>(context);
    print(tick.ticket);
    Size _size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          floatingActionButton: FloatingActionButton(
            backgroundColor: const Color(0xFF1A271F),
            onPressed: () {
              print(tick.ticket);
              showDialog(
                  context: context,
                  builder: (context) {
                    return const ProgressDialog(
                      status: 'Please wait',
                    );
                  });
              setState(() {
                num += 1;
              });
              //Navigator.pop(context);
            },
            child: const Icon(
              Icons.add,
              color: Colors.yellow,
            ),
          ),
          body: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 4,
              mainAxisExtent: 430,
            ),
            itemCount: num,
            itemBuilder: (BuildContext context, int index) {
              return Stack(
                  key: UniqueKey(),
                  children: [
                Container(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      color: Colors.green[900]!,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.autorenew_outlined,
                              color: Colors.white,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.delete_outlined,
                              color: Colors.white,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {});
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
                            ticketNumbers: TicketNumbers(),
                            index: index,
                          ),
                          Keys(
                            keyNums: TicketNumbers(),
                            index: index,
                          ),
                          Flexible(
                            fit: FlexFit.loose,
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: _size.width * 0.0025),
                              padding: EdgeInsets.symmetric(
                                  horizontal: _size.width * 0.025,
                                  vertical: _size.height * 0.01),
                              width: double.infinity,
                              color: Colors.yellow,
                              child: Text(
                                'Price: ${Helpers.getCurrency}0.00',
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ]);
            },
          )),
    );
  }
}

class MainNumbers extends StatefulWidget {
  const MainNumbers({Key? key, required this.ticketNumbers, required this.index}) : super(key: key);

  final TicketNumbers ticketNumbers;
  final int index;

  @override
  State<MainNumbers> createState() => _MainNumbersState();
}

class _MainNumbersState extends State<MainNumbers> {
  late final TicketNumbers ticketNumbers;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ticketNumbers = widget.ticketNumbers;
  }

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
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
            color: ticketNumbers.numbers.contains(index + 1)
                ? Colors.yellow[600]
                : Colors.white,
            textColor: ticketNumbers.numbers.contains(index + 1)
                ? Colors.white
                : Colors.green,
            press: () {
              if (ticketNumbers.numbers.length == 5 &&
                  ticketNumbers.numbers.contains(index + 1)) {
                ticketNumbers.removeFromTicket(index + 1);
                setState(() {});
              } else if (ticketNumbers.numbers.length == 5 &&
                  !ticketNumbers.numbers.contains(index + 1)) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('Ticket is complete'),
                  duration: Duration(milliseconds: 200),
                ));
              } else {
                if (ticketNumbers.numbers.contains(index + 1)) {
                  ticketNumbers.removeFromTicket(index + 1);
                  setState(() {});
                } else {
                  ticketNumbers.addToTicket(index + 1);
                  setState(() {});
                }
              }
              print(ticketNumbers.numbers);
            },
          );
        },
      ),
    );
  }
}

class Keys extends StatefulWidget {
  const Keys({Key? key, required this.keyNums, required this.index}) : super(key: key);
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
