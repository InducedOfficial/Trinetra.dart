// Copyright (c) 2022 InducedOfficial
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'respond.dart';

class Requester {
  final String baseUrl;
  final bool ssl;
  late String method;
  late String route;
  late Map<String, String> headers;
  late Map<String, String> queryParams;
  late Map<String, String> body;
  late bool showLoading;
  late BuildContext? context;
  Requester(
    this.baseUrl,
    this.ssl, {
    required this.method,
    required this.route,
    this.headers = const {
      "Content-Type": "application/json",
      "Accept": "application/json"
    },
    this.queryParams = const {},
    this.body = const {},
    this.showLoading = true,
    this.context,
  });

  Object? get data => null;
//   @override
  Future<Response> call() async {
    Uri url;
    if (ssl) {
      url = Uri.https(baseUrl, route, queryParams);
    } else {
      url = Uri.http(baseUrl, route, queryParams);
    }
    try {
      if (method == "GET") {
        return await get(url);
      } else if (method == "POST") {
        return await post(url);
      } else if (method == "PUT") {
        return await put(url);
      } else if (method == "DELETE") {
        return await delete(url);
      } else {
        throw Exception("Invalid Method");
        // return await get(url);
      }
    } on SocketException {
      return Response(502, "502 Bad Gateway", '{"status": "502 Bad Gateway"}',
          "502 Bad Gateway");
    } catch (e) {
      return Response(
          500,
          "500 Internal Server Error ${e.toString()}",
          '{"status": "500 Internal Server Error ${e.toString()}"}',
          '{"status": "500 Internal Server Error ${e.toString()}"}');
    }
  }

  Future<Response> get(Uri url) async {
    http.Response response = (await http.get(
      url,
      headers: headers,
    ));
    Response res = Response(
        response.statusCode,
        response.reasonPhrase.toString(),
        json.decode(response.body),
        json.decode(response.body));
    return res;
  }

  Future<Response> post(Uri url) async {
    http.Response response = (await http.post(
      url,
      headers: headers,
      body: jsonEncode(body),
    ));
    Response res = Response(
        response.statusCode,
        response.reasonPhrase.toString(),
        json.decode(response.body),
        json.decode(response.body));
    return res;
  }

  Future<Response> put(Uri url) async {
    http.Response response = (await http.put(
      url,
      headers: headers,
      body: jsonEncode(body),
    ));
    Response res = Response(
        response.statusCode,
        response.reasonPhrase.toString(),
        json.decode(response.body),
        json.decode(response.body));
    return res;
  }

  Future<Response> delete(Uri url) async {
    http.Response response = (await http.delete(
      url,
      headers: headers,
    ));
    Response res = Response(
        response.statusCode,
        response.reasonPhrase.toString(),
        json.decode(response.body),
        json.decode(response.body));
    return res;
  }
}
