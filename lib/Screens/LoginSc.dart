import 'package:apple_shop/bloc/Authentication/AuthBloc.dart';
import 'package:apple_shop/bloc/Authentication/AuthEvent.dart';
import 'package:apple_shop/bloc/Authentication/AuthState.dart';
import 'package:apple_shop/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final usernamecontroller = TextEditingController(text: 'first');
  final passwordcontroller = TextEditingController(text: '11111111');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'images/icon_application.png',
                  width: 150,
                  height: 150,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Apple Shop',
                  style: TextStyle(
                      fontSize: 20, color: Colors.white, fontFamily: 'GEB'),
                )
              ],
            ),
          ),
          Expanded(
              child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: usernamecontroller,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.blue, width: 3)),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.black, width: 2),
                      ),
                      labelText: 'UserName',
                      labelStyle: TextStyle(
                          fontFamily: 'GM', fontSize: 16, color: Colors.black)),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: passwordcontroller,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.blue, width: 3)),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.black, width: 2),
                      ),
                      labelText: 'Password',
                      labelStyle: TextStyle(
                          fontFamily: 'GM', fontSize: 16, color: Colors.black)),
                ),
                SizedBox(
                  height: 10,
                ),
                BlocBuilder<Authbloc, Authstate>(
                  builder: (context, state) {
                    if (state is AuthInitState) {
                      return ElevatedButton(
                        onPressed: () {
                          BlocProvider.of<Authbloc>(context).add(
                              AuthLoginRequest(usernamecontroller.text,
                                  passwordcontroller.text));
                        },
                        child: Text(
                          'Login into Your Account',
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(200, 40),
                          backgroundColor: CustomColors.blueindicator,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      );
                    }
                    if (state is AuthloadingState) {
                      return CircularProgressIndicator();
                    }
                    if (state is AuthResponseState) {
                      return state.response.fold((l) {
                        return Text(l);
                      }, (r) {
                        return Text(r);
                      });
                    }
                    return Text('');
                  },
                ),
              ],
            ),
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: Colors.white),
          ))
        ],
      ),
    );
  }
}
