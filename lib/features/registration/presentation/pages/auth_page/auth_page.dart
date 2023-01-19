import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets/auth_form/auth_form_widget.dart';
import 'auth_page_model.dart';


class AuthPage extends StatelessWidget{
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _FormWidget();
  }
}

class _FormWidget extends StatelessWidget {
  const _FormWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Expanded(
              flex: 207,
              child: Container(
                  child: Container(
                    child: Column(children: [
                      SizedBox(height: 88),
                      SizedBox(
                          width: 75,
                          child: Image.asset('lib/features/core/assets/images/box.png')),
                      Text('MUHA Store',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.black)),
                    ]),
                  )),
            ),
            Expanded(
              flex: 508,
              child: Container(
                width: 327,
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text('MUHA Access',
                          style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.w700,
                              color: Colors.black)),
                    ),
                    Container(height: 8),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                          'Please fill your detail to access your account.',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: Colors.grey)),
                    ),
                    AuthFormWidget(),
                    Container(
                        height: 44,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(color: Colors.grey, width: 1.0),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                                width: 24,
                                child: Image.asset(
                                    'lib/features/core/assets/images/google_logo.png')),
                            Text(' Sign in with Google',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20)),
                          ],
                        )),
                    Container(height: 20),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Don’t have an account?',
                              style: TextStyle(fontSize: 14)),
                          TextButton(onPressed: () {}, child: Text('Sign up')),
                        ]),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 97,
              child: Container(),
            ),
          ],
        ),
      ),
    );
  }
}