// ignore_for_file: prefer_const_constructors
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:demosafespace/utility/constant.dart';

class CreareAcc extends StatefulWidget {
  const CreareAcc({Key? key}) : super(key: key);

  @override
  State<CreareAcc> createState() => _CreareAccState();
}

class _CreareAccState extends State<CreareAcc> {
  bool statusRedEye = true;
  get childen => null;
  final formkey = GlobalKey<FormState>();
  TextEditingController fnameController = TextEditingController();
  TextEditingController lnameController = TextEditingController();
  TextEditingController mailuserController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Constant.yello,
      body: SafeArea(
        child: Form(
          key: formkey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                makeTitalStart(),
                makeTitleC(),
                firstname(size),
                lastname(size),
                email(size),
                password(size),
                makePhonnuber(size),
                makeButton(size),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row makeButton(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 16),
          width: size * 0.6,
          child: ElevatedButton(
              style: Constant().ourButton(),
              onPressed: () {
                if (formkey.currentState!.validate()) {
                  if (email == null) {
                    print('Please enter your email.');
                  } else {
                    print('Insert to database.');
                   ubloadData();
                    
                  }
                }
              },
              child: Text(
                'Register Now',
                style: Constant().h4Style(),
              )),
        ),
      ],
    );
  }

  Future<Null> ubloadData() async {
    String fname = fnameController.text;
    String lname = lnameController.text;
    String mailuser = mailuserController.text;
    String password = passwordController.text;
    String phone = phoneController.text;
    print(
        '##fname=$fname,lname=$lname,mailuser=$mailuser,password=$password,phone=$phone');
  String path = '$Constant.domain}http://localhost/safespace/getUserWhereUser.php?isAdd=true&mailuser=$mailuser';
  await Dio().get(path).then((value) => print('## value ==> $value'));
  }

  Row makePhonnuber(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.only(top: 11, bottom: 10),
          width: size * 0.6,
          child: TextFormField(
            controller: phoneController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your phone number';
              } else {}
            },
            decoration: InputDecoration(
              labelStyle: Constant().h3Style(),
              labelText: 'Phone Number',
              prefixIcon: Icon(
                Icons.phone_android_outlined,
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

  Row password(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.only(top: 15, bottom: 10),
          width: size * 0.6,
          child: TextFormField(
            controller: passwordController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your password';
              } else {}
            },
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

  Row email(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.only(top: 11, bottom: 10),
          width: size * 0.6,
          child: TextFormField(
            controller: mailuserController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your E-mail';
              } else {}
            },
            decoration: InputDecoration(
              labelStyle: Constant().h3Style(),
              labelText: 'E-mail',
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

  Row lastname(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.only(top: 10, bottom: 10),
          width: size * 0.6,
          child: TextFormField(
            controller: lnameController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your lastname';
              } else {}
            },
            decoration: InputDecoration(
              labelStyle: Constant().h3Style(),
              labelText: 'Lastname',
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

  Row firstname(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.only(top: 30, bottom: 10),
          width: size * 0.6,
          child: TextFormField(
            controller: fnameController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your firstname';
              } else {}
            },
            decoration: InputDecoration(
              labelStyle: Constant().h3Style(),
              labelText: 'Firstname',
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

  Container makeTitleC() {
    return Container(
      padding: EdgeInsets.only(left: 20, top: 10),
      child: Row(
        children: [
          Text(
            "Create tour accound for join application",
            style: Constant().hStyle(),
          ),
        ],
      ),
    );
  }

  Container makeTitalStart() {
    return Container(
      padding: EdgeInsets.only(left: 20, top: 50),
      child: Row(
        children: [
          Text(
            "Get Started !",
            style: Constant().h1Style(),
          ),
        ],
      ),
    );
  }
}
