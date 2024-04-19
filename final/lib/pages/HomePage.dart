import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _iconButton(
                    context, Icons.info_outline, "About Us", '/aboutus'),
                _iconButton(context, Icons.fastfood, "Food List", '/foodlist'),
                _iconButton(
                    context, Icons.bookmark_border, "Saved List", '/Savedlist'),
                _iconButton(
                    context, Icons.person_outline, "Profile", '/profile'),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Container(
              height: 250,
              child: Image.asset(
                'assets/food.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white, // Background color of the container
              borderRadius: BorderRadius.circular(6), // Rounded corners
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5), // Shadow color
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            margin: const EdgeInsets.all(8.0), // Margin around the container
            padding: const EdgeInsets.all(8.0), // Padding inside the container
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, top: 8.0),
                  child: Text(
                    'Popular Now',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 252, 65, 65),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: SizedBox(
                    height: 200,
                    // Adjusted height for text and image
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          _imageCard('Burrito', 'assets/burrito.jpg'),
                          _imageCard('Pizza', 'assets/pizza.jpg'),
                          _imageCard('Ice Cream', 'assets/ice.jpg'),
                          _imageCard('Honey Toast', 'assets/honeyt.jpg'),
                          _imageCard('Pancake', 'assets/pancake.jpg'),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

//icons at the top
  Widget _iconButton(
      BuildContext context, IconData icon, String label, String route) {
    return MaterialButton(
      onPressed: () {
        Navigator.pushNamed(context, route);
      },
      color: Colors.white,
      textColor: Color.fromARGB(255, 252, 65, 65),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(icon, size: 25.0),
          Text(label),
        ],
      ),
      padding: EdgeInsets.all(12),
    );
  }

  Widget _imageCard(String title, String imagePath) {
    return Card(
      margin: EdgeInsets.only(left: 6.0),
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Image.asset(imagePath, width: 180, fit: BoxFit.cover),
        ],
      ),
    );
  }
}

void main() => runApp(MaterialApp(home: HomePage()));
