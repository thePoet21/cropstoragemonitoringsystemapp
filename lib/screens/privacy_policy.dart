import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({Key? key}) : super(key: key);

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
                'Privacy Policy',
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
                    'Privacy Policy',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  const Text(
                    'We take your privacy seriously and are committed to protecting your personal information. This Privacy Policy explains how we collect, use, and disclose information about you when you use our Crop Storage Management System App. By using the app, you agree to the terms of this Privacy Policy. If you do not agree to the terms of this Privacy Policy, please do not use the app.',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  const SizedBox(height: 16.0),
                  const Text(
                    '1. Information We Collect',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  const Text(
                    'We may collect information about you when you use our app, such as your name, email address, phone number, location data, and device information. We may also collect information about your use of the app, such as the frequency and duration of your usage.',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  const SizedBox(height: 16.0),
                  const Text(
                    '2. How We Use Your Information',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  const Text(
                    'We may use your information to provide and improve our app, to communicate with you, to respond to your inquiries and requests, and to comply with legal and regulatory requirements.',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  const SizedBox(height: 16.0),
                  const Text(
                    '3. Information Sharing and Disclosure',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  const Text(
                    'We may share your information with third-party service providers who assist us in providing and improving our app. We may also share your information with law enforcement agencies, government bodies, or other third parties if we believe disclosure is necessary or appropriate to protect our rights, property, or safety, or the rights, property, or safety of others.',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  const SizedBox(height: 16.0),
                  const Text(
                    '4. Security',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  const Text(
                    'We take reasonable measures to protect your information from unauthorized access, use, or disclosure. However, no method of transmission over the internet or electronic storage is completely secure, so we cannot guarantee the absolute security of your information.',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  const SizedBox(height: 16.0),
                  const Text(
                    '5. Changes to this Privacy Policy',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  const Text(
                    'We may update this Privacy Policy from time to time. If we make material changes to this Privacy Policy, we will notify you by posting the updated policy on our app or by other means as required by law. Your continued use of the app after any such updates constitutes your acceptance of the updated Privacy Policy.',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  const SizedBox(height: 16.0),
                  const Text(
                    '6. Contact Us',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  RichText(
                    text: TextSpan(
                      text:
                          'If you have any questions or concerns about this Privacy Policy, please contact us at ',
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
