import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class TermsAndConditionsPage extends StatelessWidget {
  const TermsAndConditionsPage({Key? key}) : super(key: key);

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
                'Terms and Conditions',
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
                    'Terms and Conditions',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  const Text(
                    'Welcome to our Crop Storage Management System App. Before using the app, please read these terms and conditions carefully. By accessing or using the app, you agree to be bound by these terms and conditions and our Privacy Policy. If you disagree with any part of these terms, you may not access or use the app.',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  const SizedBox(height: 16.0),
                  const Text(
                    '1. App Usage',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  const Text(
                    'Our Crop Storage Management System App is designed to provide alerts to you in case of subpar conditions in your crop storage facility. The app is intended for informational purposes only, and we are not responsible for any damage or loss that may result from using the app. You should always follow proper safety guidelines and take appropriate precautions to prevent gas leaks.',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  const SizedBox(height: 16.0),
                  const Text(
                    '2. Disclaimer',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  const Text(
                    'The app is provided "as is" and we make no representations or warranties of any kind, express or implied, about the completeness, accuracy, reliability, suitability or availability with respect to the app or the information, products, services, or related graphics contained on the app for any purpose. Any reliance you place on such information is therefore strictly at your own risk.',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  const SizedBox(height: 16.0),
                  const Text(
                    '3. Contact Us',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  RichText(
                    text: TextSpan(
                      text:
                          'If you have any questions or concerns about our Crop Storage Management System App or these terms and conditions, please contact us at ',
                      style: const TextStyle(fontSize: 16.0),
                      children: [
                        TextSpan(
                          text: 'support@csms.com',
                          style: const TextStyle(
                            color: Colors.blue,
                            fontSize: 16,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () async {
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
                      ],
                    ),
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
