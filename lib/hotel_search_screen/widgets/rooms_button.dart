import 'package:flutter/material.dart';
import 'package:hostels_go/providers/hotel_search_provider.dart';
import 'package:hostels_go/rooms_criteria_screen/rooms_criteria_screen.dart';
import 'package:provider/provider.dart';

class RoomsButton extends StatelessWidget {
  const RoomsButton({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              color: Colors.white,
              border: const Border.fromBorderSide(
                BorderSide(
                  color: Colors.blueAccent,
                ),
              ),
            ),
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    showModalBottomSheet(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                        ),
                        elevation: 0,
                        isScrollControlled: true,
                        context: context,
                        builder: (BuildContext context) {
                          return SizedBox(
                            height: MediaQuery.of(context).size.height * .95,
                            child: const RoomsCriteria(),
                          );
                        });
                  },
                  child: Consumer<HotelSearchProvider>(
                    builder: (context, roomsCriteriaProvider, child) {
                      return Text(
                        '${roomsCriteriaProvider.getNumbers(roomsCriteriaProvider.reservation)['Rooms']} Room, ${roomsCriteriaProvider.getNumbers(roomsCriteriaProvider.reservation)['Adults']} Adults, ${roomsCriteriaProvider.getNumbers(roomsCriteriaProvider.reservation)['Children']} Children',
                        style: const TextStyle(
                          color: Colors.blueAccent,
                          fontSize: 18,
                        ),
                      );
                    },
                  ),
                ),
                const Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.black54,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
