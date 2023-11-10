
import 'package:csms/services/geolocator.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:csms/components/custom_icon.dart';
import 'package:csms/components/gas_indicator.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:fl_chart/fl_chart.dart';


import '../services/notifications.dart';
import '../utils/constants.dart';
import 'settings.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final User? _user = FirebaseAuth.instance.currentUser;
  String data = '0.0';
  List<FlSpot> gasLevelData = [];
  double _gasConcentration = 0;
  final NotificationService _notificationService = NotificationService();

  @override
  void initState() {
    super.initState();
    _notificationService.init();

    listenToDataChanges();

    //retrieveGasLevelData();
    determinePosition();
    onGasConcentrationChanged(double.parse(data));
  }

  void listenToDataChanges() {
    final databaseReference = FirebaseDatabase.instance.ref();
    databaseReference.child("sensor/gas").onValue.listen((event) {
      setState(() {
        // Process the retrieved data
        Object? values = event.snapshot.value;
        data = values.toString();
      });
    });
  }

  // Retrieve gas level data from Firebase
  void retrieveGasLevelData() {
    final databaseReference = FirebaseDatabase.instance.ref();
    databaseReference.child('sensor/gas').onValue.listen((event) {
      // Process the retrieved data
      Map<dynamic, dynamic> values = event.snapshot.value as Map;
      data = values.toString();
      setState(() {});
    });
  }

  void onGasConcentrationChanged(double concentration) {
    setState(() {
      _gasConcentration = concentration;
    });
    if (_gasConcentration >= 100) {
      // adjust the threshold as needed
      _notificationService.showNotification(
        id: 0,
        title: 'Gas Exceeded Limit',
        body:
            'The gas concentration has reached ${_gasConcentration.toStringAsFixed(2)} ppm!',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 56),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.start,
            //   children: const [
            //     Icon(
            //       Icons.person,
            //       size: 32,
            //     )
            //   ],
            // ),
            // const SizedBox(height: 16),
            Text(
              'Welcome, ${_user!.displayName}',
              style: kHeadingTextStyle,
            ),
            const SizedBox(height: 24),
            const Text(
              'Current Gas Reading',
              style: kLargeTextStyle,
            ),
            const SizedBox(height: 16),
            GasIndicator(
              gasLevel: double.parse(data),
              minLevel: 85,
              maxLevel: 200,
            ),
            const SizedBox(height: 24),
            // Text(data),
          ],
        ),
      ),
      
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Theme(
            data: Theme.of(context).copyWith(
              //background color of the BottomNavigationBar
              canvasColor: Theme.of(context).brightness == Brightness.light
                  ? const Color(0xffd3d3d4)
                  : const Color(0xff393b3e),
            ),
            child: BottomNavigationBar(
              selectedItemColor: kSelectedIcon,
              unselectedItemColor:
                  Theme.of(context).brightness == Brightness.light
                      ? Colors.black
                      : kUnselectedIcon,
              showSelectedLabels: true,
              showUnselectedLabels: true,
              selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w400),
              unselectedLabelStyle:
                  const TextStyle(fontWeight: FontWeight.w400),
              iconSize: 28,
              items: [
                const BottomNavigationBarItem(
                    icon: MyIcon(
                      assetPath: 'assets/icons/home.svg',
                      color: kSelectedIcon,
                    ),
                    label: 'Home',
                    tooltip: 'Home'),
                BottomNavigationBarItem(
                  icon: MyIcon(
                    assetPath: 'assets/icons/settings.svg',
                    color: Theme.of(context).brightness == Brightness.light
                        ? Colors.black
                        : kUnselectedIcon,
                  ),
                  label: 'Settings',
                  tooltip: 'Settings',
                ),
              ],
              currentIndex: 0,
              onTap: (index) {
                if (index == 0) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomePage(),
                    ),
                  );
                } else if (index == 1) {      
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SettingsPage(),
                    ),
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
