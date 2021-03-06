import 'package:flutter/material.dart';
import 'package:qms/util/constants.dart';
import 'package:qms/util/globals.dart' as globals;
import 'package:provider/provider.dart';
import 'package:qms/util/theme_manager.dart';
import 'package:qms/util/utility.dart';
import 'package:qms/widgets/ensure_visible.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  FocusNode _focusNodeUserId = FocusNode();
  FocusNode _focusNodePassword = FocusNode();
  FocusNode _focusNodeConfigureURL = new FocusNode();

  static final TextEditingController _userIdController =
      TextEditingController();
  static final TextEditingController _passwordController =
      TextEditingController();
  static final TextEditingController _configureURLController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
        builder: (context, theme, _) => MaterialApp(
            theme: theme.getTheme(),
            home: SafeArea(
                child: Container(
                    color: Colors.blue[900],
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 20,
                        ),
                        Text('Control your Quality Management through an',
                            style:
                                TextStyle(color: Colors.white, fontSize: 18)),
                        Text('effective Business Process Management System',
                            style:
                                TextStyle(color: Colors.white, fontSize: 18)),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 10,
                        ),
                        EnsureVisibleWhenFocused(
                          focusNode: _focusNodeUserId,
                          child: new TextFormField(
                            //enabled: !showLoader,
                            decoration: const InputDecoration(
                              border: const UnderlineInputBorder(),
                              hintText: 'User Id',
                            ),
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
                        SizedBox(height: 20),
                        EnsureVisibleWhenFocused(
                          focusNode: _focusNodePassword,
                          child: new TextFormField(
                            //enabled: !showLoader,
                            decoration: const InputDecoration(
                              border: const UnderlineInputBorder(),
                              hintText: 'Password',
                            ),
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
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: true,
                            textInputAction: TextInputAction.next,
                            onFieldSubmitted: (value) {
                              fieldFocusChange(context, _focusNodePassword,
                                  _focusNodePassword);
                            },
                          ),
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            Center(
                                child: InkWell(
                                    child: Text(
                              'Cancel',
                              style: TextStyle(fontSize: 18),
                            ))),
                          ],
                        )
                      ],
                    )))));
  }
}
