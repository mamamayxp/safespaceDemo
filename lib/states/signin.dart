// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_local_variable, unused_import, unnecessary_new, avoid_unnecessary_containers, sized_box_for_whitespace

import 'dart:convert';

import 'package:demosafespace/widget/show_title.dart';
import 'package:flutter/material.dart';
import 'package:demosafespace/utility/constant.dart';
import 'package:demosafespace/widget/show_image.dart';
import 'package:http/http.dart' as http;

class Signin extends StatefulWidget {
  const Signin({Key? key}) : super(key: key);

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  bool visible = false ;
 
  // Getting value from TextField widget.
 
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
 
Future userRegistration() async{
 
  // Showing CircularProgressIndicator.
  setState(() {
  visible = true ; 
  });
 
  // Getting value from Controller
 
  String username = usernameController.text;
  String password = passwordController.text;
 
  // SERVER API URL
  var url = Uri.parse('https://flutter-examples.000webhostapp.com/register.php');
 
  // Store all data with Param Name.
  var data = {'username': username, 'password' : password};
 
  // Starting Web API Call.
  var response = await http.post(url, body: json.encode(data));
 
  // Getting Server response into variable.
  var message = jsonDecode(response.body);
 
  // If Web call Success than Hide the CircularProgressIndicator.
  if(response.statusCode == 200){
  setState(() {
    visible = false; 
  });
}
 
  // Showing Alert Dialog with Response JSON Message.
  showDialog(
  context: context,
  builder: (BuildContext context) {
    return AlertDialog(
      title: new Text(message),
      actions: <Widget>[
        // ignore: deprecated_member_use
        FlatButton(
          child: new Text("OK"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  },
  );
 
}
 
  

 
  bool statusRedEye = true;
  get childen => null;
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Constant.yello,
      body: SafeArea(
        child: Form(
          key: formkey,
          child: ListView(
            children: [
              makeTitle(),
              makeTitleSign(),
              imageParking(size),
              makeEmail(size),
              makePassword(size),
              makeForgot(),
              makeButtonSign(size),
            ],
          ),
        ),
      ),
    );
  }

  Container makeForgot() {
    return Container(
      padding: EdgeInsets.only(left: 120),
      child: TextButton(
        onPressed: () {},
        child: Text('Forget Password?'),
      ),
    );
  }


  Row makeButtonSign(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 16),
          width: size * 0.6,
          child: ElevatedButton(
              style: Constant().ourButton(),
              onPressed: () =>Navigator.pushNamed(context, Constant.routeHome),
              child: Text(
                'Sign In',
                style: Constant().h4Style(),
              )),
        ),
      ],
    );
  }

  Row makePassword(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.only(top: 15, bottom: 10),
          width: size * 0.6,
          child: TextFormField(
           controller: passwordController,
            obscureText: statusRedEye,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    statusRedEye = !statusRedEye;
                  });
                },
                icon: statusRedEye
                    ? Icon(Icons.remove_red_eye, color: Constant.ligthBlack)
                    : Icon(
                        Icons.remove_red_eye_outlined,
                        color: Constant.colorF,
                      ),
              ),
              labelStyle: Constant().h3Style(),
              labelText: 'Password :',
              prefixIcon: Icon(
                Icons.lock_outline,
                color: Constant.ligthBlack,
              ),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Constant.ligthBlack),
                  borderRadius: BorderRadius.circular(30)),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Constant.ligthBlack,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Row makeEmail(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.only(top: 11, bottom: 10),
          width: size * 0.6,
          child: TextFormField(
            controller: usernameController,
            decoration: InputDecoration(
              labelStyle: Constant().h3Style(),
              labelText: 'E-mail :',
              prefixIcon: Icon(
                Icons.account_circle_outlined,
                color: Constant.ligthBlack,
              ),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Constant.ligthBlack),
                  borderRadius: BorderRadius.circular(30)),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Constant.ligthBlack),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Container frameView() {
    return Container(
      child: Row(
        children: [
          ShowImage(path: Constant.asset4),
        ],
      ),
    );
  }

  Container makeTitleSign() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 32, vertical: 5),
      child: Row(
        children: [
          Text(
            "Sign In to your account",
            style: Constant().hStyle(),
          ),
        ],
      ),
    );
  }

  Container makeTitle() {
    return Container(
      padding: EdgeInsets.only(bottom: 5, top: 50, left: 30),
      child: Row(
        children: [
          Text(
            "Welcome Back!",
            style: Constant().h1Style(),
          ),
        ],
      ),
    );
  }

  Row frameBuild(double size) {
    return Row(
      children: [
        Positioned(
          child: Container(
            width: size * 1.0,
            height: size * 1.6,
            child: Positioned(
              child: ShowImage(path: Constant.asset4),
            ),
          ),
        ),
      ],
    );
  }

  Row imageParking(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Positioned(
          child: Column(
            children: [
              Container(
                width: size * 0.6,
                child: ShowImage(path: Constant.asset6),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
