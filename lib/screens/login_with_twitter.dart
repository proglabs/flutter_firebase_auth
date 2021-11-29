import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:twitter_login/twitter_login.dart';

class LoginWithTwitter extends StatefulWidget {
  const LoginWithTwitter({Key? key}) : super(key: key);

  @override
  _LoginWithTwitterState createState() => _LoginWithTwitterState();
}

class _LoginWithTwitterState extends State<LoginWithTwitter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login with Twitter"),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(onPressed: (){
          signInWithTwitter();
        }, child: Text("Login With Twitter")),
      ),
    );
  }

  void signInWithTwitter() async {

    // Create a TwitterLogin instance
    final twitterLogin = new TwitterLogin(
        apiKey: 'CP1ck9xhkSPRI3fpZbssh20Ay',
        apiSecretKey: 'ExovdLXEkaDktrjuUEnXl0tzBZNBe30oz4qJhpBVlMVwdpJ3KA',
        redirectURI: 'flutter-twitter-practice://'
    );

    // Trigger the sign-in flow
    await twitterLogin.login().then((value) async {

      final twitterAuthCredential = TwitterAuthProvider.credential(
        accessToken: value.authToken!,
        secret: value.authTokenSecret!,
      );

      await FirebaseAuth.instance.signInWithCredential(twitterAuthCredential);

    });

  }
}
