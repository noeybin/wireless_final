import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project1/pages/Savedlist.dart'; // Ensure this path is correct
import 'firebase_options.dart'; // Ensure this file exists and is correctly configured

class Foodlist extends StatefulWidget {
  Foodlist({Key? key}) : super(key: key);
  @override
  _FoodlistState createState() => _FoodlistState();
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Foodlist(),
      routes: {
        '/Savedlist': (context) =>
            Savedlist(), // Define the route for SavedList
      },
    );
  }
}

class _FoodlistState extends State<Foodlist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text("Food List"),
      ),
      backgroundColor: Colors.blue[100],
      body: StreamBuilder<QuerySnapshot>(
        stream:
            FirebaseFirestore.instance.collection("Data_Recipe").snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
            itemCount: snapshot.data?.docs.length ?? 0,
            itemBuilder: (context, index) {
              var doc = snapshot.data?.docs[index];
              return ProductBox(
                name: doc?["Menu"] ?? '',
                description: doc?["Description"] ?? '',
                ingredients: doc?["Ingredients"] ?? '',
                image: doc?["imageurl"] ?? '',
                index: index,
              );
            },
          );
        },
      ),
    );
  }
}

class ProductBox extends StatelessWidget {
  final String name;
  final String description;
  final String ingredients;
  final String image;
  final int index;

  ProductBox({
    Key? key,
    required this.name,
    required this.description,
    required this.ingredients,
    required this.image,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(0.5),
      height: 150,
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/food$index');
              },
              icon: Image.network(image), // Display image
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color.fromARGB(255, 252, 210, 154),
                    style: BorderStyle.solid,
                    width: 1.0,
                  ),
                  color: Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                              color: Color.fromARGB(255, 255, 206, 101)),
                        ),
                      ),
                      child: Text(name,
                          style: TextStyle(
                              color: Color.fromARGB(255, 252, 65, 65),
                              fontWeight: FontWeight.bold)),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Text(description,
                            style:
                                TextStyle(color: Color.fromARGB(255, 0, 0, 0))),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}




/*class _foodlistState extends State<Foodlist> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Product layout demo home page'),
    );
  }
}*/

/*class _foodlistState extends State<Foodlist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: BackButton(
              onPressed: () => Navigator.of(context).pop(),
            ),
            title: Text("Online Recipe List")),
        body: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.fromLTRB(2.0, 10.0, 2.0, 10.0),
          children: <Widget>[
            SizedBox(
              child: MaterialButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/Savedlist');
                },
                child: Text("Saved list", style: TextStyle(color: Colors.blue)),
              ),
            ),
            ProductBox(
                name: "Pizza",
                description:
                    "Pizza is a dish of Italian origin consisting of a usually round, flat base of leavened wheat-based dough topped with tomatoes, cheese, and often various other ingredients.",
                image: "pizza.png"),
            ProductBox(
                name: "Burger",
                description:
                    "Hamburgers are often sold at fast-food restaurants and diners, but are also sold at various other restaurants.",
                image: "burger.jpg"),
            ProductBox(
                name: "French Fries",
                description:
                    "French fries are served hot, either soft or crispy, and are generally eaten as part of lunch or dinner or by themselves as a snack, and they commonly appear on the menus of diners, fast food restaurants, pubs, and bars.",
                image: "fries.png"),
          ],
        ));
  }
}

class ProductBox extends StatelessWidget {
  ProductBox(
      {Key? key,
      required this.name,
      required this.description,
      required this.image})
      : super(key: key);
  final String name;
  final String description;
  final String image;
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(2),
        height: 120,
        child: Card(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
              //Image.asset("assets/" + image),

              IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/food');
                  },
                  icon: Image.asset("assets/" + image)),
              Expanded(
                  child: Container(
                      padding: EdgeInsets.all(5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(this.name,
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Text(this.description),
                        ],
                      )))
            ])));
  }
}*/

