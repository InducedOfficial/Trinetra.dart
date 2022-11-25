// Copyright (c) 2022 InducedOfficial
import 'package:flutter_test/flutter_test.dart';
import 'package:trinetra/request/request.dart';

void main() {
  Request.initicalize(url: "google.com", ssl: true);
  test('trying to request google.com', () {
    Request()
        .send("GET", "/")
        .then((response) => expect(response.statusCode, 200));
  });
}
