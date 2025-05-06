import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:skore/data/responses/responses.dart';
import 'package:skore/presentation/resources/assets_manager.dart';

abstract class LocalDataSource {
  Future<HomeResponse> getHome();
}

class LocalDataSourceImpl implements LocalDataSource {
  @override
  Future<HomeResponse> getHome() async {
    final String response = await rootBundle.loadString(JsonAssets.data);
    final data = await json.decode(response);
    return HomeResponse.fromJson(data);
  }
}
