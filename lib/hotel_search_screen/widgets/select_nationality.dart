import 'package:flutter/material.dart';

class SelectNationality extends StatefulWidget {
  const SelectNationality({super.key});

  @override
  State<SelectNationality> createState() => _SelectNationalityState();
}

class _SelectNationalityState extends State<SelectNationality> {
  List<String> countries = [
    'Select Nationality',
    'United States',
    'Canada',
    'United Kingdom',
    'Germany',
    'France',
    'Italy',
    'Japan',
    'China',
    'India',
    'Brazil',
    'Australia',
    'South Africa',
    'Mexico',
    'Spain',
    'Russia',
    'South Korea',
    'Argentina',
    'Nigeria',
    'Egypt',
    'New Zealand',
  ];
  String dropdownValue = 'Select Nationality';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0),
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
            child: DropdownButtonFormField(
              icon: const Icon(
                Icons.keyboard_arrow_down,
                color: Colors.black54,
              ),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(left: 30, right: 12),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(25.0),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
              dropdownColor: Colors.white,
              value: dropdownValue,
              onChanged: (String? newValue) {
                setState(() {
                  dropdownValue = newValue!;
                });
              },
              items: countries.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: const TextStyle(
                      color: Colors.blueAccent,
                      fontSize: 18,
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );

    ;
  }
}
