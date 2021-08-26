import 'package:gstsuvidha/api_base/api_base_helper.dart';
import 'package:gstsuvidha/screen/searchModel.dart';

class SearchRepository {
  ApiBaseHelper _helper = ApiBaseHelper();

  Future<SearchModel> searchRepositoryFunction(text) async {
    final response = await _helper.get("mockjson/$text");
    return SearchModel.fromJson(response);
  }
}