import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:provider/provider.dart';
import 'package:sail/models/login_model.dart';
import 'package:sail/models/user_model.dart';
import 'package:sail/service/user_service.dart';
import 'package:sail/utils/navigator_util.dart';
import 'package:sail/constant/app_strings.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  Duration get loginTime => const Duration(milliseconds: 2250);

  late UserModel _userModel;
  late LoginModel _loginModel;

  static String? _emailValidator(value) {
    if (value.isEmpty || !RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]+$').hasMatch(value)) {
      return 'Please enter the correct email address!';
    }
    return null;
  }

  static String? _passwordValidator(String? value) {
    if (value?.isEmpty == true) {
      return 'password can not be blank!';
    }
    if (value?.length == null || value!.length < 6) {
      return 'Password cannot be less than 6 characters';
    }
    return null;
  }

  Future<String?> _login(LoginData data) async {
    String? result;

    try {
      await _loginModel.login(data.name, data.password);
    } catch (error) {
      result = 'Login failed，Please try again';
    }

    return result;
  }

  Future<String?> _register(SignupData data) async {
    String? result;

    try {
      await UserService().register({'email': data.name, 'password': data.password});

      await _loginModel.login(data.name, data.password);
    } catch (error) {
      result = 'registration failed，Please try again';
    }

    return result;
  }

  Future<String?> _recoverPassword(String name) {
    return Future.delayed(loginTime).then((_) {
      return null;
    });
  }

  @override
  Widget build(BuildContext context) {
    _userModel = Provider.of<UserModel>(context);
    _loginModel = LoginModel(_userModel);

    return FlutterLogin(
      title: AppStrings.appName,
      onLogin: _login,
      onSignup: _register,
      messages: LoginMessages(
          userHint: 'Mail',
          passwordHint: 'password',
          confirmPasswordHint: 'Confirm Password',
          confirmPasswordError: 'two passwords do not match',
          forgotPasswordButton: 'forget the password？',
          loginButton: 'log in',
          signupButton: 'register',
          recoverPasswordIntro: 'reset Password',
          recoverPasswordButton: 'Sure',
          recoverPasswordDescription: 'The system will send a reset password email to your mailbox, please pay attention to check it',
          recoverPasswordSuccess: 'Sent successfully',
          goBackButton: 'return'),
      onSubmitAnimationCompleted: () {
        NavigatorUtil.goHomePage(context);
      },
      onRecoverPassword: _recoverPassword,
      userValidator: _emailValidator,
      passwordValidator: _passwordValidator,
    );
  }
}
