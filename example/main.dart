// Copyright (c) 2022 InducedOfficial
import 'package:trinetra/request/request.dart';

void main() {
  Request.initicalize(url: "google.com", ssl: true);
  Request().send("GET", "/",
      body: {},
      headers: {},
      queryParams: {}).then((response) => print(response.statusCode));
}
