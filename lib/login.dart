import 'package:flutter/material.dart';
import 'package:in_app_update/in_app_update.dart';
import 'package:learn1_flutter/myHomePage.dart';
import 'package:learn1_flutter/read_data.dart';
import 'auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'components/components.dart';
import 'dart:developer' as developer;

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key, required this.gKey}) : super(key: key);

  final GlobalKey gKey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: gKey,
      appBar: AppBar(
        title: const Text('Aplication test'),
        backgroundColor: Colors.green,
      ),
      body: const Body(),
    );
  }
}

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late User user;


  AppUpdateInfo? _updateInfo;

  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();

  bool _flexibleUpdateAvailable = false;

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> checkForUpdate() async {
   // print("ishladi !!!");
    InAppUpdate.checkForUpdate().then((info) {
      print("ishladi !!!");
      setState(() {
        _updateInfo = info;
      });
    }).catchError((e) {
      showSnack(e.toString());
    });
  }

  void showSnack(String text) {
    if (_scaffoldKey.currentContext != null) {
      ScaffoldMessenger.of(_scaffoldKey.currentContext!)
          .showSnackBar(SnackBar(content: Text(text)));
    }
  }


  void click() {
    signInWithGoogle().then((userCreditials) => {
          developer.log('user credistioals : $userCreditials'),
          this.user = userCreditials.user!,
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      MyHomePage(user.displayName.toString())))
        });
  }

  void toComponent() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const Components()));
  }

  Widget googleLoginButton() {
    return OutlineButton(
        onPressed: this.click,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(45)),
        splashColor: Colors.grey,
        borderSide: const BorderSide(color: Colors.grey),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              Image(
                image: AssetImage('assets/google_logo.png'),
                height: 35,
              ),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text('Sign in With Google',
                    style: TextStyle(color: Colors.grey, fontSize: 25)),
              )
            ],
          ),
        ));
  }

  Widget toComponents() {
    return ElevatedButton(
      style: TextButton.styleFrom(
        primary: Colors.white,
        onSurface: Colors.black,
      ),
      onPressed: this.toComponent,
      child: const Text('Components'),
    );
  }

  Widget toReadData() {
    return ElevatedButton(
      style: TextButton.styleFrom(
        primary: Colors.white,
        onSurface: Colors.black,
      ),
      onPressed: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const ReadDataFirebase()));
      },
      child: const Text('Read Data'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            googleLoginButton(),
            toComponents(),
            toReadData(),
            ElevatedButton(
              child: Text('Check for Update'),
              style: TextButton.styleFrom(
                primary: Colors.white,
                onSurface: Colors.black,
              ),
              onPressed: () => checkForUpdate(),
            ),
            ElevatedButton(
              child: Text('Perform immediate update'),
              onPressed: _updateInfo?.updateAvailability ==
                  UpdateAvailability.updateAvailable
                  ? () {
                InAppUpdate.performImmediateUpdate()
                    .catchError((e) => showSnack(e.toString()));
              }
                  : (){},
            ),
            ElevatedButton(
              child: Text('Start flexible update'),
              onPressed: _updateInfo?.updateAvailability ==
                  UpdateAvailability.updateAvailable
                  ? () {
                InAppUpdate.startFlexibleUpdate().then((_) {
                  setState(() {
                    _flexibleUpdateAvailable = true;
                  });
                }).catchError((e) {
                  showSnack(e.toString());
                });
              }
                  : (){},
            ),
            ElevatedButton(
              child: Text('Complete flexible update'),
              onPressed: !_flexibleUpdateAvailable
                  ? (){}
                  : () {
                InAppUpdate.completeFlexibleUpdate().then((_) {
                  showSnack("Success!");
                }).catchError((e) {
                  showSnack(e.toString());
                });
              },
            ),
            ElevatedButton(onPressed: (){}, child: Text("Hi"))

          ],
        ));
  }
}
