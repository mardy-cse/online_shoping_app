import 'package:flutter/material.dart';
import 'package:online_shoping_app/page/home_page.dart';
import 'package:online_shoping_app/page/widget/elevated_button.dart';
import 'package:online_shoping_app/page/widget/footer.dart';
import 'package:online_shoping_app/page/widget/form_field.dart';

import 'bottom_navbar.dart';
import 'material/color.dart';
class LoginScreen extends StatelessWidget {
  var size, height, width;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.height;
    return Scaffold(
      body: Container(
          padding: EdgeInsets.only(top: 50, bottom: 50),
          height: height*1,
          width: width*1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(onPressed: (){},
                  icon: Icon(Icons.arrow_back_ios)),
              Container(
                padding: EdgeInsets.only(left: 10),
                height: 50,
                width: width*0.3,
                child: Text('Login', style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),),
              ),
              SingleChildScrollView(
                child: Center(
                  child: Container(
                    padding: EdgeInsets.only(left: 10, right: 10, top: 50),
                    child: Column(
                      children: [
                        CustomFormField(text: 'Email'),
                        CustomFormField(text: 'Password'),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('Forgot your password?'),
                    IconButton(onPressed: (){}, icon: Icon(Icons.arrow_right_alt_outlined,color: colorOrange,))
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 15, bottom: 15),
                padding: EdgeInsets.only(left: 10, right: 10),
                width: width*1,
                height: height*0.06,
                child: CustomElevatedButton(
                  buttonText: 'Login',
                  onPressed: (){
                    Navigator.push(context, 
                    MaterialPageRoute(builder: (context)=>BottomNavBar())
                    );
                  },
                ),
              ),
              SizedBox(height: 160,),
              Footer(
                text: 'Or login with social accounts',
                path1: 'assets/img/googleicon.png',
                path2: 'assets/img/facebookicon.png',
              )
            ],
          )
      ),
    );
  }
}
