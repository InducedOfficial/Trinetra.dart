// Copyright (c) 2022 InducedOfficial
class Response {
  late int statusCode;
  late String statusMessage;
  late dynamic data;
  late dynamic error;
  Response(this.statusCode, this.statusMessage, this.data, this.error);
}
