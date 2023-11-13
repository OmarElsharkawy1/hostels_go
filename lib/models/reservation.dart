class Reservation {
  List<Room> rooms;
  int roomsCount;
  bool petFriendly;
  Reservation(
      {required this.rooms,
      required this.petFriendly,
      required this.roomsCount});
}

class Room {
  int adults;
  int children;
  Room({required this.adults, required this.children});
}
