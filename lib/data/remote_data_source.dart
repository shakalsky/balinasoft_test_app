import 'dart:convert';
import 'dart:io';

import 'package:balinasoft_test_app/data/interfaces/i_remote_data_source.dart';
import 'package:balinasoft_test_app/models/comment.dart';
import 'package:balinasoft_test_app/models/image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

const _baseUrl = 'https://junior.balinasoft.com/';

const _apiPath = "api/";
const _commentPath = "/comment/";
const _imagePath = "image/";
const _accountPath = "account/";

const _sighInPath = "signin/";
const _sighUpPath = "signup/";

class RemoteDataSource implements IRemoteDataSource {
  Map<String, String> _headers(String? token) {
    return {
      HttpHeaders.authorizationHeader: '',
      if (token != null) "Access-Token": token,
      HttpHeaders.contentTypeHeader: 'application/json;charset=UTF-8',
      HttpHeaders.acceptHeader: 'application/json;charset=UTF-8',
    };
  }

  @override
  Future<bool> createComment(
    String token,
    int imageId,
    CreateComment comment,
  ) async {
    final response = await _request(
      _Http.post,
      _apiPath + _imagePath + imageId.toString() + _commentPath,
      rawJson: comment.toJson(),
      token: token,
    );
    return (response.statusCode == 200);
  }

  @override
  Future<List<dynamic>> getComments(String token, int imageId, int page) async {
    final response = await _request(
      _Http.get,
      '$_apiPath$_imagePath${imageId.toString()}$_commentPath?page=$page',
      token: token,
    );
    return jsonDecode(response.body)['data'];
  }

  @override
  Future<bool> deleteComment(String token, int imageId, int commentId) async {
    final response = await _request(
      _Http.delete,
      _apiPath + _imagePath + imageId.toString() + _commentPath + commentId.toString(),
      token: token,
    );
    return response.statusCode == 200;
  }

  @override
  Future<bool> createImage(String token, CreateImage image, List<int> bytes) async {
    final response = await _request(
      _Http.post,
      _apiPath + _imagePath,
      rawJson: image.toJson(bytes),
      token: token,
    );
    return (response.statusCode == 200);
  }

  @override
  Future<List<dynamic>> getImages(String token, int page) async {
    final response = await _request(
      _Http.get,
      '$_apiPath$_imagePath?page=$page',
      token: token,
    );
    return jsonDecode(response.body)['data'];
  }

  @override
  Future<bool> deleteImage(String token, int id) async {
    final response = await _request(
      _Http.delete,
      _apiPath + _imagePath + id.toString(),
      token: token,
    );
    return response.statusCode == 200;
  }

  @override
  Future<Map<String, dynamic>> signIn(String login, String password) async {
    final response = await _request(
      _Http.post,
      _apiPath + _accountPath + _sighInPath,
      rawJson: {"login": login, "password": password},
    );
    return jsonDecode(response.body);
  }

  @override
  Future<Map<String, dynamic>> signUp(String login, String password) async {
    final response = await _request(
      _Http.post,
      _apiPath + _accountPath + _sighUpPath,
      rawJson: {"login": login, "password": password},
    );
    return jsonDecode(response.body);
  }

  Future<Response> _request(
    _Http method,
    String url, {
    Map<String, String>? extraHeaders,
    Map<String, dynamic>? rawJson,
    bool unmodifiableUrl = false,
    String? token,
  }) async {
    final urlStr = unmodifiableUrl ? url : '$_baseUrl$url';
    final headers = _headers(token);
    if (extraHeaders != null) {
      headers.addAll(extraHeaders);
    }
    final uri = Uri.parse(urlStr);
    final encodedBody = rawJson == null ? null : jsonEncode(rawJson);
    Response response;
    switch (method) {
      case _Http.get:
        response = await get(uri, headers: headers);
        break;
      case _Http.post:
        response = await post(uri, headers: headers, body: encodedBody);
        break;
      case _Http.delete:
        response = await delete(uri, headers: headers);
        break;
      default:
        throw ArgumentError('Method is unknown');
    }

    if (response.statusCode >= 400 && response.statusCode < 600) {
      debugPrint('url: $url, response: ${jsonEncode(response.body)}');
    }

    return response;
  }
}

enum _Http {
  get,
  post,
  delete,
}
