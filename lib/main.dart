import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:hostels_go/models/reservation.dart';
import 'package:hostels_go/providers/hotel_search_provider.dart';
import 'hotel_search_screen/hotel_search_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => HotelSearchProvider(
        reservation: Reservation(
          rooms: [Room(adults: 0, children: 0)],
          petFriendly: false,
          roomsCount: 0,
        ),
      ),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/background.webp'),
              fit: BoxFit.cover,
            ),
          ),
          child: const HotelSearch()),
    );
  }
}
