import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        home: Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Stack(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(85.0, 110.0, 0.0, 0.0),
                  child: Text(
                    'ARAB  U',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 60.0),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(240.0, 110.0, 0.0, 0.0),
                  child: Text(
                    '4',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 60.0,
                        color: Colors.green),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(79, 180.0, 0.0, 0.0),
                  child: Text(
                    'Learn with Native Speakers',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                        color: Colors.green),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 40.0,
          ),
          Container(
            padding: EdgeInsets.only(top: 35.0, left: 50.0, right: 50.0),
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle: TextStyle(
                          fontFamily: 'Monsterrat',
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                          fontSize: 16.0),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.green))),
                ),
                SizedBox(
                  height: 10.0,
                ),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: TextStyle(
                          fontFamily: 'Monsterrat',
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                          fontSize: 16.0),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.green))),
                ),
                SizedBox(
                  height: 7.0,
                ),
                Container(
                  alignment: Alignment(1.0, 0.0),
                  child: InkWell(
                    child: Text(
                      'Forgot Password',
                      style: TextStyle(
                          color: Colors.green,
                          fontFamily: 'Monsterrat',
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Container(
                  height: 40.0,
                  child: Material(
                    borderRadius: BorderRadius.circular(20.0),
                    shadowColor: Colors.greenAccent,
                    color: Colors.green,
                    elevation: 7.0,
                    child: GestureDetector(
                      onTap: () {},
                      child: Center(
                        child: Text(
                          'LOGIN',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Monsterrat',
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                    height: 40.0,
                    color: Colors.transparent,
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.black,
                              style: BorderStyle.solid,
                              width: 1.0),
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(20.0)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: ImageIcon(AssetImage('assets/google.png')),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Center(
                            child: Text(
                              'Log in with Google',
                              style: TextStyle(
                                  fontFamily: 'Monsterrat',
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    )),
              ],
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Don\'t have an account?',
                style: TextStyle(
                    fontFamily: 'Monsterrat', color: Colors.grey[800]),
              ),
              SizedBox(
                width: 5.0,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed('/signup');
                },
                child: Text(
                  'Register',
                  style: TextStyle(
                      fontFamily: 'Monsterrat',
                      fontWeight: FontWeight.bold,
                      color: Colors.green),
                ),
              )
            ],
          )
        ],
      ),
    ));
  }
}
