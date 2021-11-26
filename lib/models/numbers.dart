import 'package:flutter/foundation.dart';


class TicketNumbers extends ChangeNotifier{

  Set<int> numbers = {};

  Set<int> keys = {};

  List<Map<String, Set<int>>> ticket = [];

  void addToTicket(int number){
    numbers.add(number);
    notifyListeners();
  }

  void addToKeys(int number){
    keys.add(number);
    notifyListeners();
  }


  void removeFromTicket(int number){
    numbers.remove(number);
    notifyListeners();
  }

  void removeFromKeys(int number){
    keys.remove(number);
    notifyListeners();
  }

  void createTicket(){
    ticket.add({'Numbers': numbers, 'Keys': keys});
    notifyListeners();
  }
}