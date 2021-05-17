import 'package:typesense/src/api_call.dart';
import 'package:typesense/src/collections.dart';

class Documents {
  final ApiCall _apicall;
  final String _collectionName;
  static const String RESOURCEPATH = '/documents';

  Documents(String collectionName, ApiCall apicall)
      : _apicall = apicall,
        _collectionName = collectionName;

  Future<Map<String, dynamic>> create(Map<String, dynamic> document,
      {Map<String, dynamic> options = const {}}) async {
    return await _apicall.post(_endPoint(),
        bodyParameters: document, queryParams: options);
  }

  Future<Map<String, dynamic>> upsert(Map<String, dynamic> document,
      {Map<String, dynamic> options = const {}}) async {
    options["action"] = "upsert";
    return await _apicall.post(_endPoint(),
        bodyParameters: document, queryParams: options);
  }

  Future<Map<String, dynamic>> update(Map<String, dynamic> document,
      {Map<String, dynamic> options = const {}}) async {
    options["action"] = "update";
    return await _apicall.post(_endPoint(),
        bodyParameters: document, queryParams: options);
  }

  Future<Map<String, dynamic>> delete(
      {Map<String, dynamic> queryParams = const {}}) async {
    return await _apicall.post(_endPoint(), bodyParameters: queryParams);
  }

  String _endPoint({String operation = ''}) {
    return "${Collections.RESOURCEPATH}/$_collectionName/${Documents.RESOURCEPATH}/$operation";
  }
}
