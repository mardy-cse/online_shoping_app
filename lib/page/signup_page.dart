import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:online_shoping_app/page/login_page.dart';
import 'package:online_shoping_app/page/material/color.dart';
import 'package:online_shoping_app/page/widget/elevated_button.dart';
import 'package:online_shoping_app/page/widget/footer.dart';
import 'package:online_shoping_app/page/widget/form_field.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  var size, height, width;
  final formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width; // Fix: Change from size.height to size.width

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 50, bottom: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                },
                icon: Icon(Icons.arrow_back_ios),
              ),
              Container(
                padding: EdgeInsets.only(left: 10),
                height: 60,
                width: width * 0.5,
                child: Text(
                  'Sign up',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 10),
              SingleChildScrollView(
                child: Center(
                  child: Container(
                    padding: EdgeInsets.only(left: 10, right: 10, top: 50),
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          CustomFormField(
                            text: 'Name',
                            onChanged: (value) {
                              // Assign the value to nameController
                              nameController.text = value;
                            },
                          ),
                          CustomFormField(
                            text: 'Email',
                            onChanged: (value) {
                              emailController.text = value;
                            },
                            validator: (value) {
                              if (value!.isEmpty ||
                                  !RegExp('[a-z0-9+_.-]+@[a-z0-9.-]+.[a-z]')
                                      .hasMatch(value)) {
                                return "Enter a correct E-mail";
                              } else {
                                return null;
                              }
                            },
                          ),
                          CustomFormField(
                            text: 'Password',
                            onChanged: (value) {
                              // Assign the value to nameController
                              passwordController.text = value;
                            },
                            validator: (value) {
                              if (value!.isEmpty ||
                                  !RegExp('[0-9a-zA-Z]{6,}').hasMatch(value!)) {
                                return "Password is week";
                              } else {
                                return null;
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('Already have an account?'),
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()),
                        );
                      },
                      icon: Icon(Icons.arrow_right_alt_outlined,
                          color: colorOrange),
                    ),
                  ],
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 15, bottom: 15),
                  padding: EdgeInsets.only(left: 10, right: 10),
                  width: double.infinity,
                  child: CustomElevatedButton(
                    buttonText: 'SIGN UP',
                    onPressed: () async {
                      if (formKey.currentState != null && formKey.currentState!.validate()) {
                        print('Form is valid');
                        try {
                          UserCredential userCredential = await FirebaseAuth.instance
                              .createUserWithEmailAndPassword(
                            email: emailController.text,
                            password: passwordController.text,
                          );

                          if (userCredential.user != null) {
                            await FirebaseFirestore.instance
                                .collection('Users')
                                .doc(userCredential.user!.email)
                                .set({
                              'username': nameController.text,
                              'lastname': 'Empty..',
                              // Add other user data if needed
                            });
                            print('User registration successful');
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => LoginScreen()),
                            );
                          }
                        } on FirebaseAuthException catch (e) {
                          print('FirebaseAuthException: $e');
                          // Handle FirebaseAuthException
                        } catch (e) {
                          print('Error: $e');
                          // Handle other exceptions
                        }
                      } else {
                        print('Form validation failed');
                      }
                    },


                  )),
              SizedBox(height: 80),
              Footer(
                text: 'Or sign up with social accounts',
                path1: 'assets/img/googleicon.png',
                path2: 'assets/img/facebookicon.png',
              )
            ],
          ),
        ),
      ),
    );
  }
}
