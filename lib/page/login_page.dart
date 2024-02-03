import 'package:flutter/material.dart';
import 'package:online_shoping_app/page/signup_page.dart';
import 'package:online_shoping_app/page/widget/elevated_button.dart';
import 'package:online_shoping_app/page/widget/footer.dart';
import 'package:online_shoping_app/page/widget/form_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'bottom_navbar.dart';
import 'material/color.dart';

class LoginScreen extends StatelessWidget {
  var size, height, width;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> _login(BuildContext context) async {
    try {
      UserCredential userCredential =
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      if (userCredential.user != null) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => BottomNavBar()),
        );
      }
    } on FirebaseAuthException catch (e) {
      // Handle login errors here
      print('FirebaseAuthException: $e');
      // You can display a snackbar or set an error message to show on the UI
    } catch (e) {
      // Handle other exceptions here
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;

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
                    MaterialPageRoute(builder: (context) => SignUpScreen()),
                  );
                },
                icon: Icon(Icons.arrow_back_ios),
              ),
              Container(
                padding: EdgeInsets.only(left: 10),
                height: 60,
                width: width * 0.4,
                child: Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Center(
                child: Container(
                  padding: EdgeInsets.only(left: 10, right: 10, top: 50),
                  child: Column(
                    children: [
                      CustomFormField(
                        text: 'Email',
                        onChanged: (value) {
                          emailController.text = value;
                        },
                      ),
                      CustomFormField(
                        text: 'Password',
                        onChanged: (value) {
                          passwordController.text = value;
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('Forgot your password?'),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.arrow_right_alt_outlined,
                        color: colorOrange,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 15, bottom: 15),
                padding: EdgeInsets.only(left: 10, right: 10),
                width: double.infinity,
                child: CustomElevatedButton(
                  buttonText: 'Login',
                  onPressed: () {
                    _login(context);
                  },
                ),
              ),
              SizedBox(
                height: 160,
              ),
              Footer(
                text: 'Or login with social accounts',
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
