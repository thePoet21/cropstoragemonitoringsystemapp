import 'package:flutter/material.dart';
import 'package:csms/utils/constants.dart';

// import '../utils/constants.dart';

class HumidityIndicator extends StatefulWidget {
  final double humidityLevel;// humidity concentration level
  final double minLevel; // minimum safe level
  final double maxLevel; // maximum safe level
  const HumidityIndicator({
    Key? key,
    required this.humidityLevel,
    required this.minLevel,
    required this.maxLevel,
  }) : super(key: key);

  @override
  State<HumidityIndicator> createState() => _HumidityIndicatorState();
}

class _HumidityIndicatorState extends State<HumidityIndicator> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Color color;
    String text;

    // Determine the color and text based on the humidity level
    if (widget.humidityLevel < widget.minLevel) {
      color = Colors.green;
      text = 'Safe';
    } else if (widget.humidityLevel > widget.maxLevel) {
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
                  text: '${widget.humidityLevel} ',
                  style: TextStyle(
                    fontSize: 80,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).brightness == Brightness.light
                        ? kBackgroundColor
                        : kUnselectedIcon,
                  ),
                  children: const [
                    TextSpan(
                      text: 'Percent',
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
