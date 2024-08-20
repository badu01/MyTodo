// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_todo/Functions/login_functions.dart';
import 'package:my_todo/Widgets/register_widgets.dart';

import '../Constants/constants.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool isObscure1 = true;
  bool isObscure2 = true;

  int status = 1;

  bool isPassMissMatch = false;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _password1Controller = TextEditingController();
  final TextEditingController _password2Controller = TextEditingController();

  final TextEditingController _userName = TextEditingController();
  final TextEditingController _phoneNumber = TextEditingController();
  final TextEditingController _displayName = TextEditingController();
  var _user=null;
  @override
  Widget build(BuildContext context) {
    bool isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
              onPressed: () {}, icon: Icon(Icons.arrow_back_ios_new))),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: !isKeyboardOpen ? 30 : 10,
                ),
                Visibility(
                  visible: !isKeyboardOpen,
                  child: Text(
                    'Register',
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: black_main),
                  ),
                ),
                SizedBox(
                  height: !isKeyboardOpen ? 40 : 0,
                ),
                progressIndicator(status: status),
                SizedBox(
                  height: !isKeyboardOpen ? 50 : 0,
                ),
                status == 1
                    ? registerEmailPassForm(
                        emailController: _emailController,
                        password1Controller: _password1Controller,
                        password2Controller: _password2Controller,
                        isObscure1: isObscure1,
                        isObscure2: isObscure2,
                        // pass1Obscure: setObscure1(),
                        // pass2Obscure: setObscure2(),
                      )
                    : status == 2
                        ? UserInfo(
                            nameController: _displayName,
                            unameController: _userName,
                            phoneController: _phoneNumber,
                            user: _user)
                        : SizedBox(),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    status != 1
                        ? Expanded(
                            flex: 3,
                            child: MaterialButton(
                              onPressed: () {
                                setState(() {
                                  status = status - 1;
                                });
                              },
                              color: Colors.grey,
                              child: Text('Previous'),
                            ),
                          )
                        : SizedBox(),
                    status != 1
                        ? Spacer(
                            flex: 1,
                          )
                        : SizedBox(),
                    Expanded(
                      flex: 5,
                      child: MaterialButton(
                        onPressed: () async {
                          var res;
                          if (status == 1) {
                            if (_password1Controller.text ==
                                _password2Controller.text) {
                                res = await userRegEmail(_emailController.text,
                                    _password1Controller.text);
                                setState(() {
                                  _user=res;
                                });
                                print('------------------>user$res');    
                              if (res != null) {
                                setState(() {
                                  status = status + 1;
                                });
                              }
                            } else {
                              setState(() {
                                isPassMissMatch = !isPassMissMatch;
                              });
                            }
                          } else if (status == 2) {
                            setUserInfo(
                                disName: _displayName,
                                name: _userName,
                                phone: _phoneNumber,
                                c_user: _user,
                                context: context);
                          }
                        },
                        color: black_main,
                        child: Text(
                          status == 1
                              ? 'SignUp'
                              : status == 2
                                  ? 'Next'
                                  : "Finish",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
