import 'package:flutter/material.dart';
import 'package:megabyte/models/numbers.dart';
import 'package:provider/provider.dart';

class CheckOut extends StatefulWidget {
  const CheckOut({Key? key}) : super(key: key);

  @override
  _CheckOutState createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Check Out'),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return ExpansionPanelList();
          },
        ),
      ),
    );
  }
}

class TicketCard extends StatefulWidget {
  const TicketCard({Key? key}) : super(key: key);

  @override
  State<TicketCard> createState() => _TicketCardState();
}

class _TicketCardState extends State<TicketCard> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final tick = Provider.of<TicketNumbers>(context);
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: tick.ticket.length,
        itemBuilder: (BuildContext context, int ind) {
          return Card(
            //color: AppTheme.primaryColor,
            margin: EdgeInsets.symmetric(
                vertical: size.height * 0.01, horizontal: size.width * 0.04),
            shadowColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(
                      vertical: size.height * 0.03,
                      horizontal: size.width * 0.04),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Image.network(
                              'https://lottociti.com/uploads/country_flags/AT-32.png'),
                          const Text('Austria EuroMillions'),
                          Image.network(
                            'https://lottociti.com/uploads/lottery_management_logo/image_1598423634.png',
                            height: 50,
                          ),
                        ],
                      ),
                      Container(
                        height: 100,
                        child: ListView.separated(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              padding: EdgeInsets.all(8.0),
                              //margin: EdgeInsets.all(8.0),
                              child: CircleAvatar(
                                  backgroundColor: Colors.yellowAccent,
                                  child: Text(
                                    tick.ticket[ind]['Numbers']!
                                        .elementAt(index)
                                        .toString(),
                                    style: TextStyle(
                                        fontSize: 30,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  )),
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return SizedBox(
                              width: 5,
                            );
                          },
                        ),
                      ),
                      Container(
                        height: 100,
                        child: ListView.separated(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              padding: EdgeInsets.all(8.0),
                              child: CircleAvatar(
                                  backgroundColor: Colors.red,
                                  child: Text(
                                    tick.ticket[ind]['Keys']!
                                        .elementAt(index)
                                        .toString(),
                                    style: TextStyle(
                                        fontSize: 30,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  )),
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return SizedBox(
                              width: 5,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                /*Positioned(
                  top: 0,
                  right: 0,
                  child: IconButton(
                    color: Colors.redAccent,
                    onPressed: () {
                      setState(() {
                        tick.remove(ind);
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Ticket has been removed')));
                    },
                    icon: Icon(Icons.clear),
                  ),
                ),*/
              ],
            ),
          );
        },
      ),
    );
  }
}

/*class TicketList extends StatelessWidget {
  const TicketList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tick = Provider.of<TicketNumbers>(context);
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: tick.ticket.length,
        itemBuilder: (BuildContext context, int index) {
          return TicketCard(ind: index);
        },
      ),
    );
  }
}*/
