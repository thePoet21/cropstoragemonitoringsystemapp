import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:csms/components/humidity_indicator.dart';
import 'package:csms/components/temperature_indicator.dart';
import 'package:csms/components/gas_indicator.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/constants.dart';
import 'settings.dart';


class HomePage extends StatefulWidget {
  late final Map<String, dynamic> selectedCrop;

  HomePage({Key? key, required this.selectedCrop, required List<Map<String, dynamic>> selectedCrops}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {
  final User? _user = FirebaseAuth.instance.currentUser;
  String gasData = '0.0';
  String temperatureData = '0.0';
  String humidityData = '0.0';

  @override
  void initState() {
    super.initState();
    // Add logic to fetch sensor data or initialize Firebase listeners
    listenToGasDataChanges();
    listenToTemperatureDataChanges();
    listenToHumidityDataChanges();
  }

  void listenToGasDataChanges() {
    final databaseReference = FirebaseDatabase.instance.reference();
    databaseReference.child("sensor/gas").onValue.listen((event) {
      setState(() {
        Object? values = event.snapshot.value;
        gasData = values.toString();
      });
    });
  }

  void listenToTemperatureDataChanges() {
  final databaseReference = FirebaseDatabase.instance.reference();
  databaseReference.child("sensor/temperature").onValue.listen((event) {
    setState(() {
      Object? values = event.snapshot.value;
      temperatureData = values.toString();
    });
  });
}

void listenToHumidityDataChanges() {
  final databaseReference = FirebaseDatabase.instance.reference();
  databaseReference.child("sensor/humidity").onValue.listen((event) {
    setState(() {
      Object? values = event.snapshot.value;
      humidityData = values.toString();
    });
  });
}
void loadSelectedCrop() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? storedCropString = prefs.getString('selectedCrop');
    if (storedCropString != null) {
      setState(() {
        widget.selectedCrop = Map<String, dynamic>.from(
          Map<String, dynamic>.fromIterable(
            storedCropString.split(', '),
            key: (item) => item.split(': ')[0],
            value: (item) => item.split(': ')[1],
          ),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 32),
            Text(
              'Welcome, ${_user!.displayName}',
              style: kHeadingTextStyle,
            ),
            const SizedBox(height: 24),
            const Text(
              'Selected Crop Details:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 12),
            // Display selected crop details
            Text(
              'Crop: ${widget.selectedCrop["crop"]}',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Temperature Range: ${widget.selectedCrop["temperature"]}',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Humidity Range: ${widget.selectedCrop["humidity"]}',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Gas Type: ${widget.selectedCrop["gas"]}',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),
            const Text(
              'Sensor Readings:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 12),
            // Display sensor readings using indicators
            GasIndicator(
              gasLevel: double.parse(gasData),
              minLevel: 4,
              maxLevel: 19,
            ),
            const SizedBox(height: 12),
            TemperatureIndicator(
              temperatureLevel: double.parse(temperatureData),
              minLevel: 4,
              maxLevel: 19,
            ),
            const SizedBox(height: 12),
            HumidityIndicator(
              humidityLevel: double.parse(humidityData),
              minLevel: 45,
              maxLevel: 65,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: kSelectedIcon,
        unselectedItemColor: kUnselectedIcon,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: 0,
        onTap: (index) {
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SettingsPage()),
            );
          }
        },
      ),
    );
  }
}
