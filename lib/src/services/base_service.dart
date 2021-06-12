import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:toppicks/src/exceptions/service_exceptions.dart';

class BaseService {
  String authority = '';
  var client = http.Client();
  late http.Response _response;
  final _timeOutDuration = 30;

  // header
  Map<String, String> headers() {
    Map<String, String> _header = {
      HttpHeaders.acceptHeader: 'application/json',
      HttpHeaders.authorizationHeader: 'authprization tkn'
    };
    return _header;
  }

  // response
  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
      case 201:
        throw response;

      case 400:
        throw BadRequestException(jsonDecode(jsonEncode(response.body)));

      case 401:
      case 403:
        throw UnauthorizedException(jsonDecode(jsonEncode(response.body)));

      case 500:
      default:
        throw FetchDataException(
            'Error occured while Communicating with Server with StatusCode: ${response.statusCode}');
    }
  }

// requests
  Future<dynamic> request({
    required METHODS method,
    required String path,
    Map<String, dynamic>? body,
    Map<String, String>? queryParamaters,
  }) async {
    switch (method) {
      case METHODS.get:
        _response = await client
            .get(
          Uri.https(authority, path, queryParamaters),
          headers: headers(),
        )
            .timeout(Duration(seconds: _timeOutDuration), onTimeout: () {
          throw TimeoutException(
              'The connection has timed out, Please try again!');
        });
        break;

      case METHODS.post:
        _response = await client
            .post(
          Uri.https(authority, path, queryParamaters),
          headers: headers(),
          body: body,
        )
            .timeout(Duration(seconds: _timeOutDuration), onTimeout: () {
          throw TimeoutException(
              'The connection has timed out, Please try again!');
        });
        break;

      case METHODS.put:
        _response = await client
            .put(
          Uri.https(authority, path, queryParamaters),
          headers: headers(),
          body: body,
        )
            .timeout(Duration(seconds: _timeOutDuration), onTimeout: () {
          throw TimeoutException(
              'The connection has timed out, Please try again!');
        });
        break;

      case METHODS.delete:
        _response = await client
            .delete(
          Uri.https(authority, path, queryParamaters),
          headers: headers(),
          body: body,
        )
            .timeout(Duration(seconds: _timeOutDuration), onTimeout: () {
          throw TimeoutException(
              'The connection has timed out, Please try again!');
        });
        break;

      default:
        break;
    }

    if (_response.statusCode == 401 || _response.statusCode == 403) {
      // logout(); eg: logging out user
      // Get.offAll(page);
      return returnResponse(_response);
    }
    return returnResponse(_response);
  }

// decode response
  decodeResponse(http.Response response) =>
      jsonDecode(utf8.decode(response.bodyBytes));
}

enum METHODS { get, post, put, delete, head, patch }
