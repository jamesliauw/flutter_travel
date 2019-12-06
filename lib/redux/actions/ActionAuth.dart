import 'package:flutter/material.dart';
import 'package:flutter_travel/redux/states/StateApp.dart';
import 'package:flutter_travel/redux/states/StateUser.dart';
import 'package:redux/redux.dart';

/// 用户登录请求
class UserLoginRequest {}

/// 用户登录成功
class UserLoginSuccess {
    final User user;

    UserLoginSuccess(this.user);
}

/// 用登录失败
class UserLoginFailure {
    final String error;

    UserLoginFailure(this.error);
}

/// 用户退出
class UserLogout {}

/// 封装登录
final Function login = (BuildContext context, String username, String password) {
    return (Store<AppState> store) {
        store.dispatch(UserLoginRequest());

		// 模拟登录
        if (username == 'james' && password == 'liauw') {
            store.dispatch(UserLoginSuccess(User('placeholder_token', 'placeholder_id')));
            Navigator.of(context).pushNamedAndRemoveUntil('/main', (_) => false);
        } else {
            store.dispatch(UserLoginFailure('Username or password were incorrect.'));
        }
    };
};

/// 封装退出
final Function logout = (BuildContext context) {
    return (Store<AppState> store) {
        store.dispatch(UserLogout());
        Navigator.of(context).pushNamedAndRemoveUntil('/login', (_) => false);
    };
};