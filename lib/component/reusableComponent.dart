import 'package:flutter/material.dart';
import 'constance.dart';
Widget defaultFormField({
  @required TextEditingController controller,
  @required TextInputType type,
  @required String label,
  @required IconData prefix,
  @required Function validate,
  bool isPassword = false,
  Function onSubmitted,
  Function onTap,
  IconData suffix,
  Function onSuffixPress
}) =>
    TextFormField(
        controller: controller,
        keyboardType: type,
        obscureText: isPassword,
        onFieldSubmitted: onSubmitted,
        validator: validate,
        onTap: onTap,
        decoration: InputDecoration(
          prefixIcon: Icon(prefix),
          labelText: label,
          border: OutlineInputBorder(),
          suffixIcon: IconButton(
            icon: Icon(suffix),
            onPressed:onSuffixPress ,
          ),
        ),
    );

Widget buildTasksItems(Map model) => Padding(
  padding: const EdgeInsets.all(15.0),
  child: Row(
    children: [
      CircleAvatar(
        backgroundColor: Colors.tealAccent,
        radius: 40.0,
        child: Text(
          "${model["time"]}",
          style: TextStyle(
            fontSize: 15.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      SizedBox(
        width: 15.0,
      ),
      Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "${model["title"]}",
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          Text(
            "${model["date"]}",
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    ],
  ),
);