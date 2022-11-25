// Copyright (c) 2022 InducedOfficial
library trinetra;

import 'package:trinetra/request/request.dart';

void main() {
  Request.initicalize(url: "google.com", ssl: true);
  Request().send("GET", "/").then((response) => print(response.statusCode));
}
