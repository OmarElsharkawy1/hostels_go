import 'package:flutter/material.dart';
import 'package:hostels_go/hotel_search_screen/widgets/date_range.dart';
import 'package:hostels_go/hotel_search_screen/widgets/rooms_button.dart';
import 'package:hostels_go/hotel_search_screen/widgets/select_city.dart';
import 'package:hostels_go/hotel_search_screen/widgets/select_nationality.dart';
import 'package:hostels_go/global_widgets/trapezoid_container.dart';

class HotelSearch extends StatelessWidget {
  const HotelSearch({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).size.height * .3,
          ),
          //Text Hotel Search
          const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [TrapozoidText(text: 'Hotel Search')],
          ),
          const SizedBox(
            height: 5,
          ),
          Stack(
            children: [
              Container(
                alignment: Alignment.bottomCenter,
                width: double.infinity,
                height: MediaQuery.of(context).size.height * .55,
                decoration: const BoxDecoration(
                  color: Colors.orangeAccent,
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.only(bottom: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Find Hotels',
                        style: TextStyle(color: Colors.white, fontSize: 24),
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Icon(
                        Icons.search,
                        color: Colors.white,
                        size: 50,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * .45,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.indigo, Colors.blueAccent]),
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      SelectCity(),
                      DateRange(),
                      Expanded(child: SelectNationality()),
                      RoomsButton(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
