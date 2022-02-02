import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[800],
      appBar: AppBar(
        title: const Text('About'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  "Made with 💙 by",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
              ),
              Card(
                elevation: 3,
                color: Colors.deepPurple[900],
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 50, right: 50, top: 30, bottom: 20),
                      child: ClipOval(
                        child: Image.asset(
                          "assets/rafmonkey.png",
                          height: 200,
                          width: 200,
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 20),
                      child: Text(
                        'Raf',
                        style: TextStyle(
                          fontSize: 28,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    ProfileLink(
                      icon: 'assets/twitter.png',
                      title: 'themobilecoder',
                      onClick: () {
                        _launchURL("https://twitter.com/themobilecoder");
                      },
                    ),
                    ProfileLink(
                      icon: 'assets/github.png',
                      title: 'themobilecoder',
                      onClick: () {
                        _launchURL("https://github.com/themobilecoder");
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: ProfileLink(
                        icon: 'assets/weblogo.png',
                        title: 'themobilecoder.com',
                        onClick: () {
                          _launchURL("https://themobilecoder.com");
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(40.0),
                child: Text(
                  "All rights reserved 2022",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _launchURL(String url) {
    launch(url);
  }
}

class ProfileLink extends StatelessWidget {
  const ProfileLink(
      {Key? key,
      required this.icon,
      required this.title,
      required this.onClick})
      : super(key: key);

  final String icon;
  final String title;
  final Function onClick;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onClick();
      },
      child: Container(
        width: 200,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                icon,
                width: 32,
                height: 32,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
