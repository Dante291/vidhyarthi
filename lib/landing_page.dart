import 'package:flutter/material.dart';

import 'login_screen.dart';

class landingPage extends StatelessWidget {
  const landingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.asset(
              'assets/Gray and Beige Elegant Typographic Restaurant Logo (1080 x 1920 px) (4).png'),
          const SizedBox(
            height: 0,
          ),
          Container(
            margin: const EdgeInsets.only(left: 0),
            child: const Text(
              'Hi, Welcome to ',
              style: TextStyle(
                fontFamily: 'LeagueSpartan',
                fontSize: 39,
                color: Colors.black,
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              margin: const EdgeInsets.only(left: 0),
              child: const Text(
                'विद्याARथी !',
                style: TextStyle(
                  fontFamily: 'LeagueSpartan',
                  fontSize: 40,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Align(
            alignment: Alignment.center,
            child: FilledButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.resolveWith((states) => Colors.red),
                  shape: MaterialStateProperty.resolveWith<OutlinedBorder?>(
                    (Set<MaterialState> states) {
                      return RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5));
                    },
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const loginScreen(),
                  ));
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 60, vertical: 10),
                  child: Text(
                    'LogIn',
                    style: TextStyle(fontSize: 30),
                  ),
                )),
          ),
          const SizedBox(
            height: 15,
          ),
          Align(
            alignment: Alignment.center,
            child: OutlinedButton(
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.resolveWith((states) => Colors.red),
                  shape: MaterialStateProperty.resolveWith<OutlinedBorder?>(
                    (Set<MaterialState> states) {
                      return RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5));
                    },
                  ),
                ),
                onPressed: () {},
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 42, vertical: 12),
                  child: Text(
                    'Register',
                    style: TextStyle(fontSize: 30),
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
