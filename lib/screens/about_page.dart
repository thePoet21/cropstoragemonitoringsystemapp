import 'package:flutter/material.dart';

import '../utils/constants.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      physics: const BouncingScrollPhysics(
        parent: AlwaysScrollableScrollPhysics(),
      ),
      slivers: [
        SliverAppBar(
          leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const Icon(Icons.arrow_back_ios),
          ),
          expandedHeight: 70,
          elevation: 0,
          floating: true,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            title: const Text(
              'About',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: true,
            background: Container(
              color: Theme.of(context).brightness == Brightness.light
                  ? const Color(0xffd3d3d4)
                  : const Color(0xff393b3e),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.0),
                        color: Theme.of(context).brightness == Brightness.light
                            ? const Color(0xffd3d3d4)
                            : const Color(0xff393b3e),
                      ),
                      child: Theme.of(context).brightness == Brightness.light
                          ? const Image(
                              image: AssetImage(
                                'assets/images/csms-dark.png',
                              ),
                              height: 60,
                            )
                          : const Image(
                              image: AssetImage(
                                'assets/images/csms-light.png',
                              ),
                              height: 60,
                            ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
                const Text(
                  'Version',
                  style: kLargeTextStyle,
                ),
                const Text(
                  '1.0.0',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Description:',
                  style: kLargeTextStyle,
                ),
                const SizedBox(height: 10),
                const Text(
                  'This app detects gas, temperature and humidity levels and sends notifications to the user. The app also provides real-time concentration levels and alerts the user when the concentration exceeds the optimum limit.',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Developed by:',
                  style: kLargeTextStyle,
                ),
                const SizedBox(height: 10),
                const Text(
                  'Nkana',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        )
      ],
    ));
  }
}
