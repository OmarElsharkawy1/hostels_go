import 'package:flutter/material.dart';
import 'package:hostels_go/models/reservation.dart';
import 'package:hostels_go/providers/hotel_search_provider.dart';
import 'package:hostels_go/rooms_criteria_screen/widgets/child_tile.dart';
import 'package:hostels_go/rooms_criteria_screen/widgets/increment_button.dart';
import 'package:provider/provider.dart';

class RoomTile extends StatelessWidget {
  final int index;
  final Room room;
  const RoomTile({required this.index, required this.room, super.key});
  @override
  Widget build(BuildContext context) {
    return Card(
      surfaceTintColor: Colors.transparent,
      elevation: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              'ROOM $index',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Adults',
                  style: TextStyle(fontSize: 18),
                ),
                Consumer<HotelSearchProvider>(
                  builder: (context, hotelSearchProvider, child) {
                    return IncrementButton(
                      counter: hotelSearchProvider.rooms[index].adults,
                      increaseCounter: () => hotelSearchProvider.setAdults(
                          index, hotelSearchProvider.rooms[index].adults + 1),
                      decreaseCounter: () => hotelSearchProvider.setAdults(
                          index, hotelSearchProvider.rooms[index].adults - 1),
                    );
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Children',
                  style: TextStyle(fontSize: 18),
                ),
                Consumer<HotelSearchProvider>(
                    builder: (context, hotelSearchProvider, child) {
                  return IncrementButton(
                    counter: hotelSearchProvider.rooms[index].children,
                    increaseCounter: () => hotelSearchProvider.setChildren(
                        index, hotelSearchProvider.rooms[index].children + 1),
                    decreaseCounter: () => hotelSearchProvider.setChildren(
                        index, hotelSearchProvider.rooms[index].children - 1),
                  );
                }),
              ],
            ),
          ),
          Column(
            children: [
              Consumer<HotelSearchProvider>(
                builder: (context, roomsCriteriaProvider, child) {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return ChildTile(
                        index: index + 1,
                      );
                    },
                    itemCount: roomsCriteriaProvider.rooms[index].children,
                  );
                },
              )
            ],
          )
        ],
      ),
    );
  }
}
