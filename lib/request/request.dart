// Copyright (c) 2022 InducedOfficial
import 'package:flutter/widgets.dart';
import 'respond.dart';
import 'requester.dart';

bool _ssl = true;
String _url = "";
Widget? _widgetLoading;

class Request {
  late String url = _url;
  late bool ssl = _ssl;
  late Widget? widgetLoading = _widgetLoading;

  static void initicalize(
      {required String url, required bool ssl, Widget? widgetLoading}) {
    _url = url;
    _ssl = ssl;
    _widgetLoading = widgetLoading;
  }

  Future<Response> send(
    String method,
    String route, {
    Map<String, String> body = const {},
    Map<String, String> headers = const {},
    Map<String, String> queryParams = const {},
    BuildContext? context,
  }) async {
    return await Requester(
      url,
      ssl,
      method: method,
      route: route,
      body: body,
      headers: headers,
      queryParams: queryParams,
      context: context,
    ).call();
  }
}
