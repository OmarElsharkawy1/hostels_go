import 'package:flutter/material.dart';
import 'package:hostels_go/models/reservation.dart';

class HotelSearchProvider extends ChangeNotifier {
  Reservation reservation;
  HotelSearchProvider({
    required this.reservation,
  });

  List<Room> get rooms => reservation.rooms;
  int get roomsCount => reservation.roomsCount;
  bool get petFriendly => reservation.petFriendly;

  set rooms(List<Room> value) {
    reservation.rooms = value;
    notifyListeners();
  }

  set roomsCount(int value) {
    if (value < 0) {
      return;
    }
    reservation.roomsCount = value;
    notifyListeners();
  }

  set petFriendly(bool value) {
    reservation.petFriendly = value;
    notifyListeners();
  }

  void setAdults(int index, int value) {
    if (value < 0) {
      return;
    }
    rooms[index].adults = value;
    notifyListeners();
  }

  void setChildren(int index, int value) {
    if (value < 0) {
      return;
    }
    rooms[index].children = value;
    notifyListeners();
  }

  Map<String, int> getNumbers(Reservation reservation) {
    Map<String, int> numbers = {};
    int rooms = 0;
    int adults = 0;
    int children = 0;
    for (Room room in reservation.rooms) {
      rooms++;
      adults += room.adults;
      children += room.children;
    }
    numbers = {'Rooms': rooms - 1, 'Adults': adults, 'Children': children};
    return numbers;
  }
}
