import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hostels_go/models/reservation.dart';
import 'package:hostels_go/providers/hotel_search_provider.dart';
import 'package:hostels_go/rooms_criteria_screen/widgets/increment_button.dart';
import 'package:hostels_go/rooms_criteria_screen/widgets/room_tile.dart';
import 'package:provider/provider.dart';

class RoomsCriteria extends StatelessWidget {
  const RoomsCriteria({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        margin: const EdgeInsets.symmetric(horizontal: 30),
        child: SizedBox(
          height: 50,
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
            ),
            child: const Text(
              "Apply",
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
      backgroundColor: Colors.white10,
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        surfaceTintColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.white,
        title: const Text('Rooms and Guests'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.close_outlined),
          ),
        ],
      ),
      body: Container(
        height: double.infinity,
        color: Colors.black12,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 12,
                  ),
                  child: SizedBox(
                    height: 60,
                    child: Card(
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12))),
                      color: Colors.white,
                      surfaceTintColor: Colors.transparent,
                      elevation: 2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(12.0),
                            child: Text(
                              'Rooms',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16),
                            ),
                          ),
                          Consumer<HotelSearchProvider>(
                            builder: (context, hotelSearchProvider, child) {
                              return IncrementButton(
                                  counter: hotelSearchProvider.roomsCount,
                                  increaseCounter: () {
                                    hotelSearchProvider.roomsCount++;
                                    hotelSearchProvider.rooms
                                        .add(Room(adults: 0, children: 0));
                                  },
                                  decreaseCounter: () {
                                    if (hotelSearchProvider.rooms.isNotEmpty) {
                                      hotelSearchProvider.roomsCount--;
                                      hotelSearchProvider.rooms.remove(
                                          hotelSearchProvider.rooms[
                                              hotelSearchProvider.rooms.length -
                                                  1]);
                                    }
                                  });
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Column(
                  children: [
                    Consumer<HotelSearchProvider>(
                      builder: (context, hotelSearchProvider, child) {
                        return ListView.builder(
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            return RoomTile(
                              index: index + 1,
                              room: hotelSearchProvider.rooms[index],
                            );
                          },
                          itemCount: hotelSearchProvider.roomsCount,
                        );
                      },
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Card(
                    surfaceTintColor: Colors.transparent,
                    elevation: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Text(
                                    'Pet-friendly',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black54),
                                  ),
                                  Transform.flip(
                                    flipY: true,
                                    child: const Icon(
                                      Icons.error_outline,
                                    ),
                                  ),
                                ],
                              ),
                              const Text(
                                'Only show stays that allow pets',
                                style: TextStyle(
                                    fontSize: 12, color: Colors.black54),
                              ),
                            ],
                          ),
                          Consumer<HotelSearchProvider>(
                            builder: (context, hotelSearchProvider, child) {
                              return CupertinoSwitch(
                                activeColor: Colors.blueAccent,
                                value: hotelSearchProvider.petFriendly,
                                onChanged: (value) {
                                  hotelSearchProvider.petFriendly = value;
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
