import 'package:flutter/material.dart';

class poplogout extends StatefulWidget {
  poplogout({Key? key}) : super(key: key);
  @override
  _poplogoutState createState() => _poplogoutState();
}

class _poplogoutState extends State<poplogout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(''),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Expanded(
                      child: MaterialButton(
                    onPressed: () {
// open Homepage
                      Navigator.pushNamed(context, '/');
                    },
                    child:
                        Text('Log Out', style: TextStyle(color: Colors.blue)),
                  )),
                ],
              )
            ],
          ),
        ));
  }
}
