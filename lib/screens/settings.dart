import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:csms/screens/about_page.dart';
import 'package:csms/screens/help_center.dart';
import 'package:csms/screens/privacy_policy.dart';
import 'package:csms/screens/terms.dart';

import '../components/custom_icon.dart';
import '../components/setting_cards.dart';
import '../utils/constants.dart';
import 'home_page.dart';


class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: 44,
            ),
            const Text(
              'Settings',
              style: kHeadingTextStyle,
            ),
            const SizedBox(height: 16),
            SettingsCard(
              cardName: 'About',
              iconPath: 'assets/icons/info.svg',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AboutPage(),
                  ),
                );
              },
            ),
            const SizedBox(height: 8),
            SettingsCard(
              cardName: 'Help Center',
              iconPath: 'assets/icons/help.svg',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HelpCenterPage(),
                  ),
                );
              },
            ),
            const SizedBox(height: 8),
            SettingsCard(
              cardName: 'Terms and Conditions',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TermsAndConditionsPage(),
                  ),
                );
              },
              iconPath: 'assets/icons/page.svg',
            ),
            const SizedBox(height: 8),
            SettingsCard(
              cardName: 'Privacy Policy',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PrivacyPolicyPage(),
                  ),
                );
              },
              iconPath: 'assets/icons/privacy.svg',
            ),
            const SizedBox(height: 8),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                // ignore: use_build_context_synchronously
                Navigator.pushReplacementNamed(context, '/login');
              },
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Log Out',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Theme(
            data: Theme.of(context).copyWith(
              // sets the background color of the `BottomNavigationBar`
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
                BottomNavigationBarItem(
                    icon: MyIcon(
                      assetPath: 'assets/icons/home.svg',
                      color: Theme.of(context).brightness == Brightness.light
                          ? Colors.black
                          : kUnselectedIcon,
                    ),
                    label: 'Home',
                    tooltip: 'Home'),
                
                const BottomNavigationBarItem(
                  icon: MyIcon(
                    assetPath: 'assets/icons/settings.svg',
                    color: kSelectedIcon,
                  ),
                  label: 'Settings',
                  tooltip: 'Settings',
                ),
              ],
              currentIndex: 1,
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
