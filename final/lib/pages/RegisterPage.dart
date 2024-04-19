import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key? key}) : super(key: key);
  @override
  _RegisterPageState createState() =>
      _RegisterPageState(); // Corrected the State class name
}

class _RegisterPageState extends State<RegisterPage> {
  // Corrected the State class name
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                "assets/bg.png"),
            fit: BoxFit.cover, // Cover the entire screen with the image.
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
                Text('Create Your Account',
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
                            fillColor: Colors.white, // Set fill color to white
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
                            fillColor: Colors.white, // Set fill color to white
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
                        SizedBox(height: 20),
                        Container(
                          decoration: BoxDecoration(
                            color: Color.fromARGB(
                                255, 252, 65, 65), // Button color
                            borderRadius:
                                BorderRadius.circular(8.0), // Rounded corners
                          ),
                          width: double
                              .infinity, // Button width as wide as the parent
                          child: MaterialButton(
                            onPressed: () {
                              _formKey.currentState!.save();
                              if (_formKey.currentState!.validate()) {
                                // If form is valid, navigate to the Homepage
                                Navigator.pushNamed(context, '/home');
                              } else {
                                print("Validation failed");
                              }
                            },
                            child: Text("Sign Up",
                                style: TextStyle(color: Colors.white)),
                          ),
                        ),
                        SizedBox(height: 15),
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
