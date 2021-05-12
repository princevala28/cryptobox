import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

class NetworkRepository {

  var dio = Dio();

  final String BASE_URL = "api.coingecko.com";

  NetworkRepository(){
    dio.options.baseUrl = "https://api.coingecko.com/api/v3/coins/";
  }

  Future<Response> getMyCoinData(String ids, String currency, String filterList,) async {

    var queryMap = {
      "vs_currency" : currency,
      "ids" : ids,
      "order" : filterList,
      "per_page" : "100",
      "page" : "1",
      "sparkline" : "false"
    };

    final response = await dio.get("markets",queryParameters: queryMap);

    return response;

  }


}