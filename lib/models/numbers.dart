import 'package:flutter/foundation.dart';


class TicketNumbers extends ChangeNotifier{

  List<Map<String, Set<int>>> ticket = [];


  createTicket(){
    ticket.add({'Numbers': {}, 'Keys': {}});
  }

  remove(int index){
    ticket.removeAt(index);
    notifyListeners();
  }
}