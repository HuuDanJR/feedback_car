import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:dio/dio.dart';
import 'package:tournament_client/lib/models/driver.dart';
import 'package:tournament_client/lib/models/feedback.dart';

const BASEURL = 'http://localhost:8080/';

class ServiceAPIs {
  Dio dio = Dio();

  Future fetchInit() async {}

  Future<FeedBack> fetchFeedBack() async {
    final response = await dio.get(
      '${BASEURL}list_feedback',
      options: Options(
        contentType: Headers.jsonContentType,
        receiveTimeout: Duration(seconds: 10000),
        sendTimeout: Duration(seconds: 10000),
        followRedirects: false,
        validateStatus: (status) {
          return true;
        },
        headers: {
          'Content-type': 'application/json; charset=UTF-8',
        },
      ),
    );
    return FeedBack.fromJson(response.data);
  }

  Future createFeedBack(
      {driver, star, content, experience, status}) async {
    Map<String, dynamic> body = {
      "driver": "$driver",
      "star": star,
      "content": "$content",
      "experience": experience,
      "status": "$status",
      "createdAt":DateTime.now().toString()
    };
    final response = await dio.post(
      '${BASEURL}create_feedback',
      data: body,
      options: Options(
        contentType: Headers.jsonContentType,
        // receiveTimeout: Duration(seconds: 10000),
        // sendTimeout: Duration(seconds: 10000),
        // followRedirects: false,
        // validateStatus: (status) {
        //   return false;
        // },
        // headers: {
        //   'Content-type': 'application/json; charset=UTF-8',
        // },
      ),
    );
    return response.data;
  }

  Future<Driver> fetchDriver() async {
    final response = await dio.get(
      '${BASEURL}list_driver',
      options: Options(
        contentType: Headers.jsonContentType,
        receiveTimeout: Duration(seconds: 10000),
        sendTimeout: Duration(seconds: 10000),
        followRedirects: false,
        validateStatus: (status) {
          return true;
        },
        headers: {
          'Content-type': 'application/json; charset=UTF-8',
        },
      ),
    );
    return Driver.fromJson(response.data);
  }
}
