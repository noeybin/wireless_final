import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/bg.png"), // Set the background image
            fit: BoxFit.cover, // Cover the entire widget with the image
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image(
                  image: AssetImage('assets/profile.png'),
                  height: 100,
                ),
                Text('Sign in',
                    style: TextStyle(fontSize: 20, color: Colors.blue)),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: FormBuilder(
                    key: _formKey,
                    initialValue: {'username': '', 'password': ''},
                    child: Column(
                      children: [
                        FormBuilderTextField(
                          name: 'username',
                          decoration: InputDecoration(
                            labelText: 'Email',
                            fillColor: Colors
                                .white, // Set fill color to white for contrast
                            filled: true,
                            errorStyle: TextStyle(
                                color: Color.fromARGB(255, 252, 65, 65)),
                          ),
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(
                                errorText: 'Please insert email'),
                            FormBuilderValidators.email(),
                          ]),
                          keyboardType: TextInputType.emailAddress,
                        ),
                        SizedBox(height: 15),
                        FormBuilderTextField(
                          name: 'password',
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            fillColor: Colors
                                .white, // Set fill color to white for contrast
                            filled: true,
                            errorStyle: TextStyle(
                                color: Color.fromARGB(255, 252, 65, 65)),
                          ),
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(
                                errorText: 'Please insert password'),
                            FormBuilderValidators.minLength(8,
                                errorText: 'Minimum length 8 characters'),
                          ]),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(
                                      255, 252, 65, 65), // Colored button
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: MaterialButton(
                                  onPressed: () {
                                    _formKey.currentState!.save();
                                    if (_formKey.currentState!.validate()) {
                                      // Navigate to the Homepage if validation passes
                                      Navigator.pushNamed(context, '/home',
                                          arguments: <String, String>{
                                            'username': _formKey.currentState!
                                                .value['username'],
                                            'password': _formKey.currentState!
                                                .value['password'],
                                          });
                                    } else {
                                      print("Validation failed");
                                    }
                                  },
                                  child: Text("Log In",
                                      style: TextStyle(color: Colors.white)),
                                ),
                              ),
                            ),
                            SizedBox(width: 10), // Spacing between buttons
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 255, 255,
                                      255), 
                                  border: Border.all(
                                    color: Color.fromARGB(
                                        255, 252, 65, 65), // Border color
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: MaterialButton(
                                  onPressed: () {
                                    // Navigate to the Register Page
                                    Navigator.pushNamed(context, '/register');
                                  },
                                  child: Text('Sign Up',
                                      style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 252, 65, 65))),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        MaterialButton(
                          onPressed: () {
                            // Navigate to the About Us Page
                            Navigator.pushNamed(context, '/aboutus');
                          },
                          child: Text('About us',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 252, 65, 65))),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
