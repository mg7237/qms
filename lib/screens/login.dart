import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qms/screens/home.dart';
import 'package:qms/util/constants.dart';
import 'package:qms/util/globals.dart' as globals;
import 'package:provider/provider.dart';
import 'package:qms/providers/theme_manager.dart';
import 'package:qms/util/utility.dart';
import 'package:qms/widgets/ensure_visible.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _showConfiguration = false;
  FocusNode _focusNodeUserId = FocusNode();
  FocusNode _focusNodePassword = FocusNode();
  FocusNode _focusNodeConfigureURL = FocusNode();
  FocusNode _focusNodeLoginBtn = FocusNode();
  FocusNode _focusNodeConfigureBtn = FocusNode();

  static final TextEditingController _userIdController =
      TextEditingController();
  static final TextEditingController _passwordController =
      TextEditingController();
  static final TextEditingController _configureURLController =
      TextEditingController();

  _cancel() {}

  _login() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => HomePage()));
  }

  _saveURL() {}

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
      builder: (context, theme, _) => MaterialApp(
          theme: theme.getTheme(),
          home: SafeArea(
              child: Material(
            child: Container(
                child: Column(
              children: [
                Container(
                    height: (MediaQuery.of(context).size.height / 5),
                    width: double.infinity,
                    color: Colors.white,
                    child: Center(
                        child: Image(
                            image: AssetImage('assets/icon/login_logo.png')))),
                Container(
                  height: (MediaQuery.of(context).size.height * 2 / 5) + 10,
                  width: double.infinity,
                  decoration: BoxDecoration(color: Colors.blue[900]),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Text('Control your Quality Management through an',
                          style: TextStyle(color: Colors.white, fontSize: 16)),
                      Text('effective Business Process Management System',
                          style: TextStyle(color: Colors.white, fontSize: 16)),
                      SizedBox(height: 50),
                      Container(
                        width: MediaQuery.of(context).size.width - 50,
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        child: EnsureVisibleWhenFocused(
                          focusNode: _focusNodeUserId,
                          child: new TextFormField(
                            //enabled: !showLoader,
                            style: TextStyle(fontSize: 18, color: Colors.black),
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(style: BorderStyle.none),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(15.0))),
                                hintText: 'User Id',
                                hintStyle: TextStyle(color: Colors.grey),
                                fillColor: Colors.white),
                            // onSaved: (value) =>
                            //     _loginRequestModel.email = value,
                            //validator: _loginRequestModel.emailValidate,
                            validator: (value) {
                              if ((value ?? '') != '') {
                                return null;
                              } else
                                return 'Enter User Id';
                            },
                            controller: _userIdController,
                            focusNode: _focusNodeUserId,
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            onFieldSubmitted: (value) {
                              fieldFocusChange(context, _focusNodeUserId,
                                  _focusNodePassword);
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                          width: MediaQuery.of(context).size.width - 50,
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          child: EnsureVisibleWhenFocused(
                            focusNode: _focusNodePassword,
                            child: new TextFormField(
                              style: TextStyle(fontSize: 18),
                              //enabled: !showLoader,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(15.0))),
                                hintText: 'Password',
                                hintStyle: TextStyle(color: Colors.grey),
                              ),

                              // onSaved: (value) =>
                              //     _loginRequestModel.email = value,
                              //validator: _loginRequestModel.emailValidate,
                              validator: (value) {
                                if ((value ?? '') != '') {
                                  return null;
                                } else
                                  return 'Enter Password';
                              },
                              controller: _passwordController,
                              focusNode: _focusNodeUserId,
                              keyboardType: TextInputType.visiblePassword,
                              obscureText: true,
                              textInputAction: TextInputAction.next,
                              onFieldSubmitted: (value) {
                                fieldFocusChange(context, _focusNodePassword,
                                    _focusNodeLoginBtn);
                              },
                            ),
                          )),
                      SizedBox(height: 20),
                      Container(
                        width: MediaQuery.of(context).size.width - 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                height: 50,
                                width: 160,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15))),
                                child: InkWell(
                                  child: Center(
                                    child: Text(
                                      'Cancel',
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.black),
                                    ),
                                  ),
                                  onTap: () => _cancel(),
                                )),
                            SizedBox(width: 20),
                            Container(
                                height: 50,
                                width: 160,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15))),
                                child: InkWell(
                                  focusNode: _focusNodeLoginBtn,
                                  child: Center(
                                    child: Text(
                                      'Login',
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.black),
                                    ),
                                  ),
                                  onTap: () => _login(),
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(color: Colors.blue[900]),
                    width: double.infinity,
                    height: double.infinity,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        InkWell(
                          onTap: (() => {
                                setState(() {
                                  _showConfiguration = !_showConfiguration;
                                })
                              }),
                          child: Text('Configure your application site',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16)),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        _showConfiguration
                            ? Column(
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width - 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15))),
                                    child: EnsureVisibleWhenFocused(
                                      focusNode: _focusNodeUserId,
                                      child: new TextFormField(
                                        //enabled: !showLoader,
                                        style: TextStyle(
                                            fontSize: 18, color: Colors.black),
                                        decoration: const InputDecoration(
                                            border: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    style: BorderStyle.none),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(15.0))),
                                            hintText:
                                                'Configure Application Site',
                                            hintStyle:
                                                TextStyle(color: Colors.grey),
                                            fillColor: Colors.white),
                                        // onSaved: (value) =>
                                        //     _loginRequestModel.email = value,
                                        //validator: _loginRequestModel.emailValidate,
                                        validator: (value) {
                                          if ((value ?? '') != '') {
                                            return null;
                                          } else
                                            return 'Enter Application Site';
                                        },
                                        controller: _configureURLController,
                                        focusNode: _focusNodeConfigureURL,
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        textInputAction: TextInputAction.next,
                                        onFieldSubmitted: (value) {
                                          fieldFocusChange(
                                              context,
                                              _focusNodeConfigureURL,
                                              _focusNodeConfigureBtn);
                                        },
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width - 50,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                            height: 50,
                                            width: 160,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(15))),
                                            child: InkWell(
                                              child: Center(
                                                child: Text(
                                                  'Cancel',
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.black),
                                                ),
                                              ),
                                              onTap: () => _cancel(),
                                            )),
                                        SizedBox(width: 20),
                                        Container(
                                            height: 50,
                                            width: 160,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(15))),
                                            child: InkWell(
                                              focusNode: _focusNodeConfigureBtn,
                                              child: Center(
                                                child: Text(
                                                  'Save',
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.black),
                                                ),
                                              ),
                                              onTap: () => _saveURL(),
                                            )),
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            : Text(''),
                      ],
                    ),
                  ),
                ),
              ],
            )),
          ))),
    );
  }
}
