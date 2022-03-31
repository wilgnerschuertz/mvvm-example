

import 'dart:convert';

import 'package:shop/model/picsum_model.dart';
import 'package:http/http.dart' as http;

class Service{
  Future<List<PicSumModel>?> fecthPicturesAPI() async {
    String url = 'https://picsum.photos/v2/list';
    final response = await http.get(Uri.parse(url));
    if(response.statusCode == 200){
      final json = jsonDecode(response.body) as List<dynamic>;
      final listResult = json.map((e) => PicSumModel.fromJson(e)).toList();
    }
    else
      throw Exception('Error fetching pictures');
  }
}