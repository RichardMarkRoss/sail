import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:sail/pages/home/home_page.dart';
import 'package:sail/pages/404/not_find_page.dart';
import 'package:sail/pages/login/login_page.dart';
import 'package:sail/pages/plan/plan_page.dart';
import 'package:sail/pages/server_list.dart';
import 'package:sail/pages/webview_widget.dart';
import 'dart:convert';

/// Entrance
Handler homeHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> parameters) {
      return const HomePage();
    });

/// 404 page
Handler notFindHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> parameters) {
      return const NotFindPage();
    });

///  login page
Handler loginHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> parameters) {
      return const LoginPage();
    });

/// Package page
Handler planHandle = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> parameters) {
      return const PlanPage();
    });

/// server node page
Handler serverListHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> parameters) {
      return const ServerListPage();
    });

/// WebView Page
Handler webViewHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> parameters) {
      var title = jsonDecode(parameters["titleName"]!.first);
      var url = jsonDecode(parameters["url"]!.first);
      return WebViewWidget(name: title, url: url);
    });
