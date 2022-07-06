import 'package:flutter/material.dart';
import 'package:login_page/register_screen.dart';

import 'component/reusableComponent.dart';
class LoginScreen extends StatefulWidget {

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isPassword=false;
  var formKey=GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/ab.jpg"), fit: BoxFit.fill),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                    defaultFormField(
                        controller:emailController ,
                        type:TextInputType.emailAddress ,
                        label: "Email Address",
                        prefix: Icons.email,
                        onSubmitted: (value)
                        {
                          print(value);

                        },
                      validate:(String value)
                      {
                        if(value.isEmpty)
                        {
                          return "Email  must not be Empty";
                        }
                        return null;
                      }
                    ),
                    SizedBox(
                      height: 25.0,
                    ),
                    defaultFormField(
                      label: "Password",
                      controller: passwordController,
                      type: TextInputType.visiblePassword,
                      isPassword: isPassword,
                      suffix:isPassword?Icons.visibility:Icons.visibility_off ,
                      onSuffixPress: ()
                        {
                          setState(() {
                            isPassword = !isPassword;
                          });
                        },
                      onSubmitted: (value)
                      {
                        print(value);
                      },
                      prefix: Icons.lock,

                      validate: (String value)
                      {
                        if(value.isEmpty)
                          {
                            return "Password must not be Empty";
                          }
                        return null;
                      }

                    ),

                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 100),
                      width: 120,
                      color: Colors.tealAccent,
                      child: MaterialButton(
                        onPressed: () {
                          if(formKey.currentState.validate())
                            {
                              print(emailController.text);
                              print(passwordController.text);
                            }

                        },
                        child: Text(
                          "LOGIN",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don\'t have an account?,"),
                        TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context,RegisterScreen.routeName);
                            },
                            child: Text("Register Now "))
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
