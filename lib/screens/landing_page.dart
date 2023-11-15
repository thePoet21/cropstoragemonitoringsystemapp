import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home_page.dart'; // Import your home page file

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  List<Map<String, dynamic>> _allCrops = [
    // Your crop data here
    {
      "id": 1,
      "crop": "Maize",
      "temperature": "15-20°C",
      "humidity": "60-70%",
      "gas": "Low oxygen"
    },
    {
      "id": 2,
      "crop": "Rice",
      "temperature": "20-25°C",
      "humidity": "70-80%",
      "gas": "Low oxygen"
    },
    // Add more crop data as needed
  ];

  List<Map<String, dynamic>> _selectedCrops = [];

  @override
  void initState() {
    super.initState();
  }

  void _toggleCropSelection(int cropId) {
    setState(() {
      final index = _selectedCrops.indexWhere((crop) => crop['id'] == cropId);
      if (index == -1) {
        final selectedCrop =
            _allCrops.firstWhere((crop) => crop['id'] == cropId);
        _selectedCrops.add(selectedCrop);
      } else {
        _selectedCrops.removeAt(index);
      }
    });
  }

  Future<void> _navigateToHomePage(void Function(List<Map<String, dynamic>>) navigateCallback) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(
      'selectedCrops',
      _selectedCrops.map((crop) => crop.toString()).toList(),
    );

    navigateCallback(_selectedCrops);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crop Selection'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            const SizedBox(height: 32),
            // Other UI elements like welcome text, search bar, and crop list
            // ...

            if (_allCrops.isNotEmpty)
              ListView.builder(
                shrinkWrap: true,
                itemCount: _allCrops.length,
                itemBuilder: (context, index) {
                  final crop = _allCrops[index];
                  final isSelected =
                      _selectedCrops.any((selected) => selected['id'] == crop['id']);

                  return ListTile(
                    title: Text(crop['crop']),
                    subtitle: Text('Temperature: ${crop['temperature']}, Humidity: ${crop['humidity']}'),
                    trailing: Checkbox(
                      value: isSelected,
                      onChanged: (bool? value) {
                        _toggleCropSelection(crop['id']);
                      },
                    ),
                  );
                },
              ),
            ElevatedButton(
              onPressed: () {
                _navigateToHomePage((selectedCrops) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(selectedCrops: selectedCrops, selectedCrop: {},),
                    ),
                  );
                });
              },
              child: Text('Proceed'),
            ),
          ],
        ),
      ),
    );
  }
}
