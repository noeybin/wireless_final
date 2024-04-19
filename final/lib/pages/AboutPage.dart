import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  AboutPage({Key? key}) : super(key: key);

  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Colors.blue[100], // Adjusted to fit background color of the image
      appBar: AppBar(
        title: Text('About us'),
        backgroundColor: const Color.fromARGB(
            255, 255, 255, 255), // Adjust the AppBar color to match the cards
      ),
      body: ListView(
        // ListView to allow for scrolling when not enough vertical space
        padding: EdgeInsets.all(20), // Add padding around the list
        children: [
          aboutCard(
            title: 'About Us',
            description:
                'With a diverse team of developers, we combine our expertise to craft a user-friendly platform that simplifies recipe discovery and meal planning. Our collaboration drives us to innovate our app, ensuring it meets the evolving needs of our users.',
            icon: Icons.group,
          ),
          aboutCard(
            title: 'Contact Us',
            description: 'PIMMADA TULARAK 6388072' +
                "\n" +
                'PATTANUT SUMRANCHIT 6488140' +
                "\n" +
                'KASIDIT TANGBUCHAKIAT 6488141' +
                "\n" +
                'POOHTANMAI SIRIWACHIRAPAP 6488191',
            icon: Icons.contact_mail,
          ),
        ],
      ),
    );
  }

  Widget aboutCard(
      {required String title,
      required String description,
      required IconData icon}) {
    return Card(
      elevation: 4, // Adjust the shadow
      margin: EdgeInsets.symmetric(vertical: 10), // Space between cards
      child: Padding(
        padding: EdgeInsets.all(16), // Padding inside the card
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(icon,
                    size: 48, color: Colors.blue), // Icon with the blue color
                SizedBox(width: 16), // Space between icon and text
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color:
                              Color.fromARGB(255, 252, 65, 65), // Title color
                        ),
                      ),
                      SizedBox(
                          height: 8), // Space between title and description
                      Text(
                        description,
                        style: TextStyle(
                            fontSize: 11,
                            color: Colors.black), // Description text style
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

void main() => runApp(MaterialApp(home: AboutPage()));
