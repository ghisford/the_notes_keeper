import 'package:flutter/material.dart';
import 'package:notes_keeper/controller/google_auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                            'assets/images/photo-1513128034602-7814ccaddd4e'))),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 11.0,
                vertical: 12.0,
              ),
              child: Text(
                'hi, how was your day?',
                style: TextStyle(
                  fontSize: 30.0,
                  fontFamily: 'lato',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: ElevatedButton(
                onPressed: () {
                  signInWithGoogle(context);
                },
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.grey[700]),
                    padding:
                        MaterialStateProperty.all(const EdgeInsets.symmetric(
                      vertical: 12.0,
                    ))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'continue with google',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontFamily: 'lato',
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.02,
                    ),
                    Image.asset(
                      'assets/images/data',
                      height: MediaQuery.of(context).size.height * 0.045,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10.0,
            )
          ],
        ),
      ),
    );
  }
}
