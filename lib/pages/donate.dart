import 'package:flutter/material.dart';

class Donate extends StatefulWidget {
  @override
  _DonateState createState() => _DonateState();
}

class _DonateState extends State<Donate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Donate'),
        centerTitle: true,
        backgroundColor: Colors.blue[300],
        elevation: 0.0,
      ),
      body: Center(
        child: ListView(
          children: [
            Container(
                child: Image.asset(
              'assets/donate.png',
              width: MediaQuery.of(context).size.width * 1,
              height: 300,
            )),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Text(
                'Benefits of donating to this app?',
                style: TextStyle(
                    color: Colors.blue[300],
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              margin: EdgeInsets.only(right: 10, left: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'There are a lot of students who could not study what they desire and the reason of that, they cannot pay the courses. From this point, you have the ability to donate, you will help many studnets to get their courses and achieve their goals.',
                    style: TextStyle(fontSize: 15),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    ' Allah Subhanahu Sa Ta\'ala said:',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.green[300]),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    '\'The parable of those who spend their substance in the way of Allah is that of a grain of corn: it groweth seven ears, and each ear Hath a hundred grains. Allah giveth manifold increase to whom He pleaseth: And Allah careth for all and He knoweth all things.\'',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 7,
            ),
            Container(
              height: 1,
              decoration: BoxDecoration(
                color: Colors.grey[400],
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Column(
              children: [
                Text(
                  'Donate via this account:',
                  style: TextStyle(
                      color: Colors.blue[300],
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Account Number:',
                            style: TextStyle(
                                fontSize: 15.0, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            '10359810584100',
                            style: TextStyle(
                              fontSize: 15.0,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Row(
                        children: [
                          Text(
                            'Phone Number:',
                            style: TextStyle(
                                fontSize: 15.0, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 35,
                          ),
                          Text(
                            '01121288754',
                            style: TextStyle(
                              fontSize: 15.0,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Row(
                        children: [
                          Text(
                            'Email:',
                            style: TextStyle(
                                fontSize: 15.0, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 97,
                          ),
                          Text(
                            'amer23zx@gmail.com',
                            style: TextStyle(
                              fontSize: 15.0,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
