import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:retrofit/error_logger.dart';
import 'package:zupa/features/site/data/models/site_model.dart';

class SiteAPI {
  SiteAPI(Dio dio, {String? baseUrl, ParseErrorLogger? errorLogger});

  Future<List<SiteModel>> getSites() async {
    final response = await rootBundle.loadString('assets/sites.json');
    final json = jsonDecode(response);
    return List<SiteModel>.from(json.map((e) => SiteModel.fromJson(e)));
  }
}
