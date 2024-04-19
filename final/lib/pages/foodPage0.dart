import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'firebase_options.dart';

class FoodPage0 extends StatefulWidget {
  FoodPage0({Key? key}) : super(key: key);

  @override
  _FoodPage0State createState() => _FoodPage0State();
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
      title: 'Food Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FoodPage0(),
    );
  }
}

class _FoodPage0State extends State<FoodPage0> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text("Food Page"),
      ),
      backgroundColor:
          Color.fromARGB(255, 180, 208, 255),
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
          if (snapshot.data?.docs.isEmpty ?? true) {
            return Text("No data available");
          }
          var doc = snapshot.data?.docs[0];
          return Column(
            children: [
              Container(
                margin: EdgeInsets.all(12.0),
                padding: EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.circular(12.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 4,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      doc?["Menu"] ?? "Menu",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 252, 65, 65)),
                    ),
                    SizedBox(height: 10),
                    Text(
                      doc?["Description"] ?? "Description",
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Ingredients: ${doc?["Ingredients"] ?? "Ingredients"}",
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  ],
                ),
              ),
              doc?["imageurl"] != null
                  ? Container(
                      margin: EdgeInsets.symmetric(horizontal: 12.0),
                      padding: EdgeInsets.all(12.0),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                            12.0), 
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(
                            12.0),
                        child:
                            Image.network(doc?["imageurl"], fit: BoxFit.cover),
                      ),
                    )
                  : SizedBox(),
            ],
          );
        },
      ),
    );
  }
}
/*import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'firebase_options.dart'; // Make sure this exists and is correctly configured for your Firebase project

class FoodPage0 extends StatefulWidget {
  FoodPage0({Key? key}) : super(key: key);

  @override
  _FoodPage0State createState() => _FoodPage0State();
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
      title: 'Food Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FoodPage0(),
    );
  }
}

class _FoodPage0State extends State<FoodPage0> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text("Food Page"),
      ),
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
              return Container(
                margin: EdgeInsets.all(8.0),
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Color.fromARGB(
                      255, 255, 203, 124), // Background color of the container
                  borderRadius: BorderRadius.circular(12.0), // Rounded corners
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5), // Shadow color
                      spreadRadius: 2,
                      blurRadius: 4,
                      offset: Offset(0, 3), // Position of shadow
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      doc?["Menu"] ?? "",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Text(
                      doc?["Description"] ?? "",
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Ingredients: ${doc?["Ingredients"] ?? ""}",
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 10),
                    doc?["imageurl"] != null
                        ? Image.network(doc?["imageurl"], fit: BoxFit.cover)
                        : SizedBox(),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
*/