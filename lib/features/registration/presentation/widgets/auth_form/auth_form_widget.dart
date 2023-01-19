import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'auth_form_widget_model.dart';

class AuthFormWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model = context.watch<AuthFormWidgetModel>();
    return Column(
      children: [
        Container(height: 56),
        Align(
          alignment: Alignment.bottomLeft,
          child: Text('Email',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: Colors.black)),
        ),
        Container(height: 8),
        Container(
          height: 44,
          child: TextFormField(
            controller: model.emailTextController,
            textAlignVertical: TextAlignVertical.bottom,
            style: TextStyle(fontSize: 16),
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 25.0, horizontal: 5.0),
              border: OutlineInputBorder(
                // borderSide: BorderSide(color: Colors.red, width: 5.0),
                borderRadius: BorderRadius.circular(8.0),
              ),
              hintText: 'Write your email',
            ),
            onSaved: (String? value) {
              // This optional block of code can be used to run
              // code when the user saves the form.
            },
            validator: (String? value) {
              return (value != null && value.contains('@'))
                  ? 'Do not use the @ char.'
                  : null;
            },
          ),
        ),
        Container(height: 20),
        Align(
          alignment: Alignment.bottomLeft,
          child: Text('Password',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: Colors.black)),
        ),
        Container(height: 8),
        Container(
          height: 44,
          child: TextFormField(
            obscureText: true,
            obscuringCharacter: '*',
            textAlignVertical: TextAlignVertical.bottom,
            style: TextStyle(fontSize: 16),
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 25.0, horizontal: 5.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              hintText: 'Write your password',
            ),
            onSaved: (String? value) {},
            validator: (String? value) {
              return (value != null && value.contains('@'))
                  ? 'Do not use the @ char.'
                  : null;
            },
          ),
        ),
        SizedBox(height: 72),
        Container(
          height: 44,
          width: 600,
          decoration: BoxDecoration(
            color: Colors.deepPurpleAccent,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Sign in',
                  style: TextStyle(color: Colors.white, fontSize: 20)),
            ],
          ),
        ),
        Container(height: 16),
      ],
    );
  }
}
