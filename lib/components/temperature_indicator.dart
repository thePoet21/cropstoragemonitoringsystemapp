import 'package:flutter/material.dart';
import 'package:csms/utils/constants.dart';

// import '../utils/constants.dart';

class TemperatureIndicator extends StatefulWidget {
  final double temperatureLevel; // temperature concentration level
  final double minLevel; // minimum safe level
  final double maxLevel; // maximum safe level
  const TemperatureIndicator({
    Key? key,
    required this.temperatureLevel,
    required this.minLevel,
    required this.maxLevel,
  }) : super(key: key);

  @override
  State<TemperatureIndicator> createState() => _TemperatureIndicatorState();
}

class _TemperatureIndicatorState extends State<TemperatureIndicator> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Color color;
    String text;

    // Determine the color and text based on the gas level
    if (widget.temperatureLevel < widget.minLevel) {
      color = Colors.green;
      text = 'Safe';
    } else if (widget.temperatureLevel > widget.maxLevel) {
      color = Colors.red;
      text = 'Danger';
    } else {
      color = Colors.orange;
      text = 'Warning';
    }

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0),
            color: Theme.of(context).brightness == Brightness.light
                ? const Color(0xffd3d3d4)
                : const Color(0xff393b3e),
          ),
          alignment: const Alignment(1.0, 1.0),
          height: 170,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              RichText(
                text: TextSpan(
                  text: '${widget.temperatureLevel} ',
                  style: TextStyle(
                    fontSize: 80,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).brightness == Brightness.light
                        ? kBackgroundColor
                        : kUnselectedIcon,
                  ),
                  children: const [
                    TextSpan(
                      text: 'Degrees',
                      style: TextStyle(
                        fontSize: 32,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          width: 16,
          height: 16,
        ),
        Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                  color: color,
                ),
                height: 30,
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Text(
              text,
              style: TextStyle(
                color: Theme.of(context).brightness == Brightness.light
                    ? kBackgroundColor
                    : kUnselectedIcon,
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
