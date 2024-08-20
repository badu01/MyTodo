import 'package:flutter/material.dart';
import 'package:my_todo/Constants/constants.dart';

Widget progressIndicator({required status}) {
  return Container(
    width: double.infinity,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: (Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 20,
            width: 20,
            color: status >= 1 ? black_main : Colors.grey,
            child: const Center(
              child: Text(
                '1',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Divider(
              thickness: 2,
              color: status > 1 ? black_main : Colors.grey,
            ),
          ),
          Container(
            height: 20,
            width: 20,
            color: status > 1 ? black_main : Colors.grey,
            child: const Center(
              child: Text(
                '2',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Divider(
              thickness: 2,
              color: status > 2 ? black_main : Colors.grey,
            ),
          ),
          Container(
            height: 20,
            width: 20,
            color: status == 3 ? black_main : Colors.grey,
            child: const Center(
              child: Text(
                '3',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      )),
    ),
  );
}

Widget registerEmailPassForm({
  required emailController,
  required password1Controller,
  required password2Controller,
  required isObscure1,
  required isObscure2,
  VoidCallback? pass1Obscure,
  VoidCallback? pass2Obscure,
}) {
  return (Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'SignUp',
          style: TextStyle(
              color: black_main,
              fontWeight: FontWeight.bold,
              fontSize: 25,
              height: 2.5),
        ),
        TextFormField(
          controller: emailController,
          cursorColor: black_main,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
              labelText: 'Email',
              labelStyle: TextStyle(
                  //fontWeight: FontWeight.bold,
                  color: black_main),
              contentPadding: const EdgeInsets.symmetric(
                vertical: 0,
                horizontal: 10,
              ),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                color: black_main,
                width: 1.5,
              )),
              border: const OutlineInputBorder(
                  borderSide: BorderSide(
                width: 2,
                color: Colors.yellow,
              ))),
        ),
        const SizedBox(
          height: 25,
        ),
        TextFormField(
          controller: password1Controller,
          obscureText: isObscure1,
          obscuringCharacter: '*',
          cursorColor: black_main,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
              suffixIcon: IconButton(
                  onPressed: () {
                    pass1Obscure;
                  },
                  icon: const Icon(Icons.remove_red_eye_outlined)),
              labelText: 'Password',
              labelStyle: TextStyle(
                  //fontWeight: FontWeight.bold,
                  color: black_main),
              contentPadding: const EdgeInsets.symmetric(
                vertical: 0,
                horizontal: 10,
              ),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                color: black_main,
                width: 1.5,
              )),
              border: OutlineInputBorder(
                  borderSide: BorderSide(
                width: 2,
                color: black_main,
              ))),
        ),
        const SizedBox(
          height: 25,
        ),
        TextFormField(
          controller: password2Controller,
          obscureText: isObscure2,
          obscuringCharacter: '*',
          cursorColor: black_main,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
              suffixIcon: IconButton(
                  onPressed: () {
                    pass2Obscure;
                  },
                  icon: const Icon(Icons.remove_red_eye_outlined)),
              labelText: 'Confirm Password',
              labelStyle: TextStyle(
                  //fontWeight: FontWeight.bold,
                  color: black_main),
              contentPadding: const EdgeInsets.symmetric(
                vertical: 0,
                horizontal: 10,
              ),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                color: black_main,
                width: 1.5,
              )),
              border: OutlineInputBorder(
                  borderSide: BorderSide(
                width: 2,
                color: black_main,
              ))),
        ),
      ],
    ),
  )
  );
}

Widget UserInfo({
  required nameController,
  required unameController,
  required phoneController,
  required user
}) {
  return (
    Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'SignUp',
          style: TextStyle(
              color: black_main,
              fontWeight: FontWeight.bold,
              fontSize: 25,
              height: 2.5),
        ),
        TextFormField(
          autofocus: true,
          controller: nameController,
          cursorColor: black_main,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
              labelText: 'Name',
              labelStyle: TextStyle(
                  //fontWeight: FontWeight.bold,
                  color: black_main),
              contentPadding: const EdgeInsets.symmetric(
                vertical: 0,
                horizontal: 10,
              ),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                color: black_main,
                width: 1.5,
              )),
              border: const OutlineInputBorder(
                  borderSide: BorderSide(
                width: 2,
                color: Colors.yellow,
              ))),
        ),
        const SizedBox(
          height: 25,
        ),
        TextFormField(
          controller: unameController,
          obscuringCharacter: '*',
          cursorColor: black_main,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
              labelText: 'User Name',
              labelStyle: TextStyle(
                  //fontWeight: FontWeight.bold,
                  color: black_main),
              contentPadding: const EdgeInsets.symmetric(
                vertical: 0,
                horizontal: 10,
              ),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                color: black_main,
                width: 1.5,
              )),
              border: OutlineInputBorder(
                  borderSide: BorderSide(
                width: 2,
                color: black_main,
              ))),
        ),
        const SizedBox(
          height: 25,
        ),
        TextFormField(
          controller: phoneController,
          obscuringCharacter: '*',
          cursorColor: black_main,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
              labelText: 'Phone Number',
              labelStyle: TextStyle(
                  //fontWeight: FontWeight.bold,
                  color: black_main),
              contentPadding: const EdgeInsets.symmetric(
                vertical: 0,
                horizontal: 10,
              ),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                color: black_main,
                width: 1.5,
              )),
              border: OutlineInputBorder(
                  borderSide: BorderSide(
                width: 2,
                color: black_main,
              ))),
        ),
      ],
    ),
  )
  );
}
