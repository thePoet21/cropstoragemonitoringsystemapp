import 'package:flutter/material.dart';
import 'package:csms/screens/webview.dart';

import 'package:url_launcher/url_launcher.dart';

class HelpCenterPage extends StatelessWidget {
  const HelpCenterPage({super.key});

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
                'Help Center',
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
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Frequently Asked Questions:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const FaqTile(
                    question: 'How often should I replace the sensors?',
                    answer:
                        'We recommend replacing the sensors every six months to ensure accurate and reliable detection. However, if the device shows any signs of malfunction or produces false alarms, please contact customer support for assistance.',
                  ),
                  const SizedBox(height: 32),
                  const Text(
                    'Contact Information:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  GestureDetector(
                    child: const Row(
                      children: [
                        Icon(
                          Icons.mail_outline,
                          color: Colors.blue,
                          size: 20,
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Text(
                          'support@csms.com',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                    onTap: () async {
                      final Uri params = Uri(
                        scheme: 'mailto',
                        path: 'tadalankana@gmail.com',
                        query: 'subject=Crop Storage Management System Support',
                      );
                      final emailLaunch = await launchUrl(params);
                      if (!emailLaunch) {
                        // ignore: use_build_context_synchronously
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text(
                                  'Error occured. Please try again later')),
                        );
                        // Handle error opening email app
                      }
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  GestureDetector(
                    child: const Row(
                      children: [
                        Icon(
                          Icons.phone_outlined,
                          color: Colors.blue,
                          size: 20,
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Text(
                          '+265 884-122-940',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                    onTap: () async {
                      final Uri params = Uri(
                        scheme: 'tel',
                        path: '+265884122940',
                      );
                      final phoneLaunch = await launchUrl(params);
                      if (!phoneLaunch) {
                        // Handle error opening phone dialer
                      }
                    },
                  ),
                  const SizedBox(height: 32),
                  const Text(
                    'Tutorials and Guides:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const TutorialTile(
                    title: 'How to install the Gas Sensor',
                  ),
                  const SizedBox(height: 32),
                  const Text(
                    'Troubleshooting:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const TroubleshootingTile(
                    title: 'False Alarms',
                    solution:
                        'Make sure the device is installed in a well-ventilated area and away from any sources of heat or steam, as this could cause false alarms. Check the sensitivity level and adjust it accordingly. If the issue persists, please contact customer support for assistance.',
                  ),
                  const TroubleshootingTile(
                    title: 'Device Not Responding',
                    solution:
                        'Check the batteries and replace them if necessary. Make sure the device is connected to the app and the internet. If the issue persists, please contact customer support for assistance.',
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class FaqTile extends StatelessWidget {
  final String question;
  final String answer;

  const FaqTile({Key? key, required this.question, required this.answer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        question,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      children: [
        Text(answer),
        const SizedBox(height: 10),
      ],
    );
  }
}

class TutorialTile extends StatelessWidget {
  final String title;

  const TutorialTile({
    Key? key,
    required this.title,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      trailing: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const WebViewExample(),
              ),
            );
          },
          child: const Icon(Icons.play_arrow)),
    );
  }
}

class TroubleshootingTile extends StatelessWidget {
  final String title;
  final String solution;

  const TroubleshootingTile(
      {Key? key, required this.title, required this.solution})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      children: [
        Text(solution),
        const SizedBox(height: 10),
      ],
    );
  }
}
