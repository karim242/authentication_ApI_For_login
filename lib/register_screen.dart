
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
 static String routeName="RegisterScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          " Register ",
          style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image:AssetImage("images/ab.jpg",),fit:BoxFit.fill
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: SingleChildScrollView(
            child: Column(children: [
              TextField(
                text: "Full Name",
                icon: Icons.person,
                obscureText: false,
              ),
              SizedBox(
                height: 30.0,
              ),
              TextField(
                text: "Email Address",
                icon: Icons.email,
                obscureText: false,
                keyType: TextInputType.emailAddress,
              ),
              SizedBox(
                height: 30.0,
              ),
              TextField(
                text: "password",
                obscureText: true,
                icon: Icons.lock,
                keyType: TextInputType.visiblePassword,
              ),
              SizedBox(
                height: 30.0,
              ),
              TextField(
                text: "Confirm password",
                obscureText: true,
                icon: Icons.lock,
                keyType: TextInputType.visiblePassword,
              ),
              SizedBox(
                height: 30.0,
              ),
              TextField(
                text: "phone Number",
                icon: Icons.phone_android,
                obscureText: false,
                keyType: TextInputType.phone,
              ),
              SizedBox(height: 30.0,),
               Container(
                margin: EdgeInsets.only(left: 40),
                width: 120,
                color: Colors.tealAccent,
                child: MaterialButton(
                  child: Text(
                    "Register",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Already have account?'),
                  TextButton(onPressed: (){Navigator.pop(context);}, child: Text('Login'))
                ],
              )
            ],
            ),
          ),
        ),
      ),
    );
  }
}

class TextField extends StatelessWidget {
  final bool obscureText;
  final String text;
  final IconData icon;
  final TextInputType keyType;

  TextField({this.obscureText, this.text, this.icon, this.keyType});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      keyboardType: keyType,
      onFieldSubmitted: (value) {
        print(value);
      },
      decoration: InputDecoration(
          labelText: text, icon: Icon(icon), border: OutlineInputBorder()),
    );
  }
}
