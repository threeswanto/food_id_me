import 'dart:convert';
import 'dart:io';

import 'package:food_id_me/base/api_endpoint.dart';
import 'package:food_id_me/model/response.dart';
import 'package:http/http.dart' as http;

class ResponseRepository {
  void doGetBanner(onSuccess, onError) async {
    try {
      var url = APIEndpoint.baseUrl + APIEndpoint.banner;
      var uri = Uri.parse(url);
      var response = await http.get(
        uri,
      );
      Response apiResponse = Response.fromJson(json.decode(response.body));
      onSuccess(apiResponse);
    } on SocketException {
      onError('No Internet');
    } on HttpException {
      onError('No Service Found');
    } on FormatException {
      onError('Invalid Response Format');
    } catch (e) {
      onError(e.toString());
    }
  }
}
